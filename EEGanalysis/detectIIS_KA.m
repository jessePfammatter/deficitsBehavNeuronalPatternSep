% run this to initialize

% assign a sample rate
fs = 512;

% load the data set
storageLocationBase = '/Volumes/cookieMonster/mj1lab_mirror';
load(strcat(storageLocationBase, '/falconHawk/EEG_data/eventMatrixKA.mat'))

% remove events that have unrealisticlly high amplitude
cutoff = prctile(max(eventMatrix'), 98);
removeInd = max(eventMatrix') <= cutoff;
eventMatrix = eventMatrix(removeInd, :);
eventMatrix_DB4 = eventMatrix_DB4(removeInd, :);
%eventEMGMatrix = eventEMGMatrix(removeInd, :);
eventMatrixSummary = eventMatrixSummary(removeInd, :);

%%
% make a summary table that shows events per animal per day
sTable1 = grpstats(eventMatrixSummary, {'animalID', 'treatment', 'recordDay', 'recordLength'}, {'mean'}, 'DataVars',{'recordLength'});
sTable1.eventsPerHour = sTable1.GroupCount ./ (sTable1.mean_recordLength / fs / 3600);
% find the unique animal names
uniqueAnimalNames = unique(sTable1.animalID);

%% make a plot to look at the events per hour before the index is calculated

hh = figure('units', 'inch', 'pos', [10 10 4 5]) 

dummy = sTable1.eventsPerHour(strcmp(sTable1.treatment, 'KA'));
mean(dummy)
plot(normrnd(ones(length(dummy), 1) * 2, .1), dummy, 'or');
hold on
dummyb = sTable1.eventsPerHour(~strcmp(sTable1.treatment, 'KA'));
mean(dummyb)
plot(normrnd(ones(length(dummyb), 1), .1), dummyb, 'ok');
xlim([0.5, 2.5])

[h, p, more, evenmore] = ttest2(dummy, dummyb);
ylabel('Events per Hour')
set(hh,'Units','Inches');    
pos = get(hh,'Position');
set(hh,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])  
print('~/Desktop/eventsPerHour_twoThresh_KA.pdf', '-dpdf')

%% create a PCA to cluster events

temp = eventMatrix(:,fs:fs+103); % only choose SA and KA animals for this -- the same that were used in the publication
%temp = eventMatrix_DB4;


PCA = pcamj(temp, 'display'); % 103 data points is a little bit longer than 200ms 512Hz * .2 seconds
pcadata = PCA.Proj(:,1:3);

% plot the pca results
KAind = strcmp(eventMatrixSummary.treatment, 'KA');
%SAind = strcmp(eventMatrixSummary.treatment, 'SA');
SAind = ~strcmp(eventMatrixSummary.treatment, 'KA');

scatter3(pcadata(KAind,1), pcadata(KAind,2), pcadata(KAind,3), '.r')
hold on
scatter3(pcadata(SAind,1), pcadata(SAind,2), pcadata(SAind,3), '.k')

    

%%
% cluster the PCA to find event morphotoypes

% some prep variable
options = statset('MaxIter',100000);

% cluster optimization
clear optimizationOutput
counter = 1;
for randomSeed = 1:10
    for nClusters = [15]
        % what are the optimization settings
        optimizationOutput(counter).randomSeed = randomSeed;
        optimizationOutput(counter).nClusters = nClusters;

        % run the gm and clustering
        rng(randomSeed); % For reproducibility and random seed checking


        optimizationOutput(counter).gm = fitgmdist(pcadata,nClusters,...
                                    'CovarianceType','full',...
                                    'SharedCovariance',false,...
                                    'RegularizationValue',.01,...
                                    'Options',options,...
                                    'Start', 'plus');

        [optimizationOutput(counter).clusterX optimizationOutput(counter).NLOGL] = cluster(optimizationOutput(counter).gm, pcadata);
        optimizationOutput(counter).P = posterior(optimizationOutput(counter).gm,pcadata);
        temptemp = sum((optimizationOutput(counter).P.^2)');
        minVal = 1/nClusters;
        temptemp = temptemp .* (1 - ((1 - temptemp) .* minVal));
        optimizationOutput(counter).clusterConfidenceMeas_mean = mean(temptemp);
        optimizationOutput(counter).clusterConfidenceMeas_std = std(temptemp);

        % increment counter
        counter = counter + 1;
        counter - 1 % to diplsay which iteration we are on
    end
end

%

totalHoursSA = sum(sTable1.recordLength(strcmp(sTable1.treatment, 'SA')) / fs / 3600)
totalHoursKA = sum(sTable1.recordLength(strcmp(sTable1.treatment, 'KA')) / fs / 3600)

for counter = 1:length(optimizationOutput)
    idx = optimizationOutput(counter).clusterX;
    optimizationOutput(counter).clusterEpilepsyRatio_odds = 0;
    optimizationOutput(counter).clusterEpilepsyRatio_prob = 0;
    clear clusterEpilepsyRatioSA clusterEpilepsyRatioKA

    for j = 1:2
        if j == 1
            treatmentGroup = 'SA';
            treatmentColor = {'k'};
        else
            treatmentGroup = 'KA';
            treatmentColor = {'r'};
        end
        
        for i = 1:max(idx)
            temp = eventMatrix(intersect(find(idx == i), find(strcmp(eventMatrixSummary.treatment, {treatmentGroup}))),:); 
            numElements = size(temp, 1);
            if j == 1
                clusterEpilepsyRatioSA(i) = numElements / totalHoursSA;
            else
                clusterEpilepsyRatioKA(i) = numElements / totalHoursKA;
            end
        end
    end

    optimizationOutput(counter).clusterEpilepsyRatio_odds = clusterEpilepsyRatioKA ./ clusterEpilepsyRatioSA; % the odds ratio of being an event related to KA.
    optimizationOutput(counter).clusterEpilepsyRatio_prob = optimizationOutput(counter).clusterEpilepsyRatio_odds ./  (optimizationOutput(counter).clusterEpilepsyRatio_odds + 1); % 
    optimizationOutput(counter).clusterEpilepsyRatio_prob(find(isnan(optimizationOutput(counter).clusterEpilepsyRatio_prob))) = 1; % 
    clear clusterEpilepsyRatioKA clusterEpilepsyRatioSA

end

%
% calculate the epiepsy index
clear probsList
for counter = 1:length(optimizationOutput)
    idx = optimizationOutput(counter).clusterX; 
    for i = 1:max(idx)
        probsList(idx == i) = optimizationOutput(counter).clusterEpilepsyRatio_prob(i);
    end
    
    % set anything below 0.5 prob to 0 and scale the rest between 0 and 1 -- this is for the calculation of the epilepsy index.
    probsList = (probsList - 0.5);
    probsList(probsList < 0) = 0;
    probsList = probsList * 2;
    
    %eventMatrixSummary_noWT = eventMatrixSummary(~strcmp(eventMatrixSummary.treatment, 'WT'),:);
    sTable2 = table(idx, probsList', eventMatrixSummary.animalID, eventMatrixSummary.recordDay, eventMatrixSummary.treatment, eventMatrixSummary.recordLength);
    sTable2.Properties.VariableNames = {'idx', 'probsList', 'animalID', 'recordDay', 'treatment', 'recordLength'};
    sTable2 = grpstats(sTable2, {'treatment', 'animalID', 'recordDay', 'idx', 'recordLength'}, {'mean'}, 'DataVars',{'probsList'});
    sTable2.eventsPerHour = sTable2.GroupCount ./ (sTable2.recordLength / 512 / 3600);

    sTable2.epilepsyEventsPerHour = sTable2.eventsPerHour .* sTable2.mean_probsList;

    sTable2 = grpstats(sTable2, {'treatment', 'animalID'}, {'sum'}, 'DataVars',{'epilepsyEventsPerHour'});
    sTable2.epilepsyEventsPerHour = sTable2.sum_epilepsyEventsPerHour;

    optimizationOutput(counter).KA_EI = sTable2.epilepsyEventsPerHour(strcmp(sTable2.treatment, 'KA'));
    optimizationOutput(counter).SA_EI = sTable2.epilepsyEventsPerHour(strcmp(sTable2.treatment, 'SA'));
    optimizationOutput(counter).WT_EI = sTable2.epilepsyEventsPerHour(strcmp(sTable2.treatment, 'WT'));
    optimizationOutput(counter).summaryTable = sTable2;
    
    [~, optimizationOutput(counter).p,] = ttest2(sTable2.epilepsyEventsPerHour(strcmp(sTable2.treatment, 'KA')), sTable2.epilepsyEventsPerHour(strcmp(sTable2.treatment, 'SA')), 'Vartype','unequal');
    sTable2 = grpstats(sTable2, {'treatment'}, {'mean', 'meanci'}, 'DataVars',{'epilepsyEventsPerHour'});

    optimizationOutput(counter).KAmean = sTable2.mean_epilepsyEventsPerHour(strcmp(sTable2.treatment, 'KA'));
    optimizationOutput(counter).SAmean = sTable2.mean_epilepsyEventsPerHour(strcmp(sTable2.treatment, 'SA'));
    optimizationOutput(counter).KAci = sTable2.meanci_epilepsyEventsPerHour(strcmp(sTable2.treatment, 'KA'),:);
    optimizationOutput(counter).KAci = sTable2.meanci_epilepsyEventsPerHour(strcmp(sTable2.treatment, 'SA'),:);
    optimizationOutput(counter).effectSize = optimizationOutput(counter).KAmean - optimizationOutput(counter).SAmean;
    
end

  
  %%
  
clusterNumber = 15; 
clear tempMatrix tempValue
counter = 1;
figure;
grid on
hold on

for i = 2:size(optimizationOutput, 2)
    if optimizationOutput(i).nClusters == clusterNumber
        
        if length(optimizationOutput(i).clusterEpilepsyRatio_prob) == clusterNumber
            %scatter3(optimizationOutput(i).gm.mu(:,1), optimizationOutput(i).gm.mu(:,2), optimizationOutput(i).gm.mu(:,3), 5, optimizationOutput(i).gm.mu(:,1) + optimizationOutput(i).gm.mu(:,3), 'filled') 
            scatter3(optimizationOutput(i).gm.mu(:,1), optimizationOutput(i).gm.mu(:,2), optimizationOutput(i).gm.mu(:,3), 5, optimizationOutput(i).clusterEpilepsyRatio_prob, 'filled')
       
            tempMatrix(:,:,counter) = [optimizationOutput(i).gm.mu(:,1), optimizationOutput(i).gm.mu(:,2), optimizationOutput(i).gm.mu(:,3)]';
            tempValue(:, counter) = optimizationOutput(i).clusterEpilepsyRatio_prob;
            counter = counter + 1;
        end
    end
end


colorbar()
colormap('redgreenblue')
%xlim([-80 20])
%ylim([-50 30])
  
%
tempMatrix = tempMatrix(:,:);
tempValue = tempValue(:);
  
scatter3(pcadata(KAind,1), pcadata(KAind,2), pcadata(KAind,3), 1, 'r', 'filled');
hold on
scatter3(pcadata(SAind,1), pcadata(SAind,2), pcadata(SAind,3), 1, 'k', 'filled');

  %{

%% use interpolation to assign values -- this method seems a little sloppy.
  
X = tempMatrix(1,:);
Y = tempMatrix(2,:);
Z = tempMatrix(3,:);
V = tempValue;
tempInterpolant = scatteredInterpolant(X',Y',Z',V);
 
% now plot the original data points but assign them a value from the interpolant
eventMatrixEIValues = tempInterpolant(pcadata(:,1), pcadata(:,2), pcadata(:,3));
eventMatrixEIValues(eventMatrixEIValues > 1) = 1;
eventMatrixEIValues(eventMatrixEIValues < 0) = 0;
  
scatter3(pcadata(:,1), pcadata(:,2), pcadata(:,3), 5, eventMatrixEIValues, 'filled')
colorbar()
colormap('redgreenblue')
 %} 


 
% now use nearest neighbor method to figure out how to assign values to data points
k = dsearchn(tempMatrix', pcadata(:,1:3));
clear eventMatrixEIValues
for i = 1:length(k)
    eventMatrixEIValues(i) = tempValue(k(i));
end

figure;
scatter3(pcadata(:,1), pcadata(:,2), pcadata(:,3), 5, eventMatrixEIValues, 'filled') 
colorbar()
colormap('redgreenblue')

% calculate the epilspy index using the new methods.

% calculate the epiepsy index

% set anything below 0.5 prob to 0 and scale the rest between 0 and 1 -- this is for the calculation of the epilepsy index.
eventMatrixEIValues2 = eventMatrixEIValues;
eventMatrixEIValues2 = (eventMatrixEIValues2 - 0.5);
eventMatrixEIValues2(eventMatrixEIValues2 < 0) = 0;
eventMatrixEIValues2 = eventMatrixEIValues2 * 2;
   


%%
%eventMatrixEIValues2 = 1 ./  Summary.Points.DROdds' ;

sTable2 = table(eventMatrixEIValues2', eventMatrixSummary.animalID, eventMatrixSummary.recordDay, eventMatrixSummary.treatment, eventMatrixSummary.recordLength);
sTable2.Properties.VariableNames = {'probsList', 'animalID', 'recordDay', 'treatment', 'recordLength'};
sTable2 = grpstats(sTable2, {'treatment', 'animalID', 'recordDay', 'recordLength'}, {'sum'}, 'DataVars',{'probsList'});
sTable2.ei = log(sTable2.sum_probsList ./ (sTable2.recordLength / 512 / 3600));

sTable2 = grpstats(sTable2, {'treatment', 'animalID'}, {'mean'}, 'DataVars',{'ei'});


KA_EI = sTable2.mean_ei(strcmp(sTable2.treatment, 'KA'));
SA_EI = sTable2.mean_ei(strcmp(sTable2.treatment, 'SA'));
WT_EI = sTable2.mean_ei(strcmp(sTable2.treatment, 'WT'));
    
%[~, p] = ttest2(sTable2.mean_ei(strcmp(sTable2.treatment, 'KA')), sTable2.mean_ei(strcmp(sTable2.treatment, 'SA')), 'Vartype','unequal')

ranksum(sTable2.mean_ei(strcmp(sTable2.treatment, 'KA')), sTable2.mean_ei(strcmp(sTable2.treatment, 'SA')))

KAmean = mean(KA_EI);
SAmean = mean(SA_EI);
    
figure
plot(ones(length(SA_EI),1), SA_EI, 'ok', ones(length(KA_EI),1) * 2, KA_EI, 'or')

xlim([0, 3]);

writetable(sTable2,'/Users/jesse/Desktop/epilepsyIndexValuesJ.csv')
%%

scatter3(Summary.Voxels.DP)

%% now plot the average epilepsy index across all the unique trials..
clear KA SA WT nClusters
for gg = 1:length(optimizationOutput)
   KA(:,gg) = optimizationOutput(gg).KA_EI;
   SA(:,gg) = optimizationOutput(gg).SA_EI;
   WT(:,gg) = optimizationOutput(gg).WT_EI;
   nClusters(gg) = optimizationOutput(gg).nClusters;
end

KA_means = mean(KA, 2);
KA_std = std(KA')
SA_means = mean(SA, 2);
SA_std = std(SA')
WT_means = mean(WT, 2);
WT_std = std(WT')

%
figure
hold on
for i = 1:length(SA_means)
    temp = normrnd(1, .05);
    plot(temp, SA_means(i), 'ok')
    errorbar(temp, SA_means(i), SA_std(i), SA_std(i), 'k')
end
for i = 1:length(KA_means)
    temp = normrnd(1, .05) * 2;
    plot(temp, KA_means(i), 'or')
    errorbar(temp, KA_means(i), KA_std(i), KA_std(i), 'r')
end
for i = 1:length(WT_means)
    temp = normrnd(1, .05) * 3;
    plot(temp, WT_means(i), 'or')
    errorbar(temp, WT_means(i), WT_std(i), WT_std(i), 'b')
end
xlim([.5 3.5])
ylabel('Hourly Epilepsy Index')
xticks([1, 2, 3])
xticklabels({'SA', 'KA', 'WT'})

% t.test for the mean values across samples

[~, p, ~, stats] = ttest2(KA_means, SA_means, 'Vartype', 'unequal')


%% now plot the epilepsy indecies as a function of cluster size

figure
hold on
for i = min(nClusters):max(nClusters)
    plot(i, mean(KA(:,(nClusters == i))), '.r')
end
for i = min(nClusters):max(nClusters)
    plot(i, mean(SA(:,(nClusters == i))), '.k')
end

xlabel('Number of Clusters')
ylabel('Mean of Epilepsy Indices')

figure
hold on
for i = min(nClusters):max(nClusters)
    plot(i, std(KA(:,(nClusters == i))), '.r')
end
for i = min(nClusters):max(nClusters)
    plot(i, std(SA(:,(nClusters == i))), '.k')
end

xlabel('Number of Clusters')
ylabel('Std of Epilepsy Indices')

%% 

summaryTable = table(optimizationOutput(1).summaryTable.animalID, optimizationOutput(1).summaryTable.treatment, [KA_means; SA_means; WT_means]);
summaryTable.Properties.VariableNames = {'animalIDs', 'treatment', 'epilepsyIndex'};

writetable(summaryTable, '/Users/Jesse/Desktop/epilepsyIndex.csv')

%%

clear NLOGL clusterConfidenceMeas_mean effectSize p
for i = 1:size(optimizationOutput, 2)
    nClusters(i) = optimizationOutput(i).nClusters;
    NLOGL(i) = optimizationOutput(i).NLOGL;
    clusterConfidenceMeas_mean(i) = optimizationOutput(i).clusterConfidenceMeas_mean;
    effectSize(i) = optimizationOutput(i).effectSize;
    p(i) = optimizationOutput(i).p;

end

% plot the log-liklihood vs the number of clusters to help pick out which to use
h = figure('units', 'inch', 'pos', [10 10 12 7]) 
subplot(2,2,1)
    scatter(nClusters, NLOGL, 10, 'k', 'filled')
    xlabel('Number of Clusters')
    ylabel('Negative Loglikelihood')
subplot(2,2,2)
    scatter(nClusters, clusterConfidenceMeas_mean, 10, 'k', 'filled')
    xlabel('Number of Clusters')
    ylabel('Cluster Confidence Measure')
subplot(2,2,3)
    scatter(nClusters, effectSize, 10, 'k', 'filled')
    xlabel('Number of Clusters')
    ylabel('Effect Size of Epilepsy Index')
subplot(2,2,4)
    scatter(nClusters, p, 10, 'k', 'filled')
    xlabel('Number of Clusters')
    ylabel('P-value for Epilepsy Index')

% paper settings and print
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])    
print('~/Desktop/detectIIS_clusterOptimization_KA.pdf', '-dpdf')

% plot the variance associated with the PCA
varianceComps = diag(fliplr(PCA.D));
varianceComps = varianceComps ./ max(varianceComps);
perVarComps = flipud((1 - varianceComps) * 100); 

h = figure('units', 'inch', 'pos', [10 10 5 5]) 
    plot(perVarComps)
    title('rawMatrix')
    ylim([0, 100])
    xlim([0, 150])
    ylabel('% of Variance Explained by PCs')
    xlabel('Principle Componenets')
    text(50, 50, num2str(perVarComps(3)))
    
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])  
print('~/Desktop/PCAVarianceComponents_detectIIS_KA.pdf', '-dpdf')

