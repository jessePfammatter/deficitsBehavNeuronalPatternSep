%load('/Volumes/cookieMonster/mj1lab_mirror/falconHawk/eeg_data/abnormals/181114abnDataSF4.mat');
load('/Volumes/cookieMonster/mj1lab_mirror/falconHawk/eeg_data/abnormals/eventMatrix_KA_abnormals.mat')
eventMatrix = eventMatrix';
eventMatrix_DB4 = eventMatrix_DB4';
fs = 512;


%%
% make a summary table that shows events per animal per day
sTable1 = grpstats(eventMatrixSummary, {'fileID', 'treatment', 'tracebackNumber'}, {'mean'}, 'DataVars',{'recordLength'});
sTable1.eventsPerHour = sTable1.GroupCount ./ (sTable1.mean_recordLength / fs / 3600);
% find the unique animal names
uniqueAnimalNames = unique(sTable1.fileID);

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

temp = eventMatrix_DB4(~strcmp(eventMatrixSummary.treatment, 'WT'),:); % only choose SA and KA animals for this -- the same that were used in the publication

PCA = pcamj(temp, 'display'); % 103 data points is a little bit longer than 200ms 512Hz * .2 seconds
pcadata = PCA.Proj(:,1:3);

% cluster the PCA to find event morphotoypes

% some prep variable
options = statset('MaxIter',100000);

% cluster optimization
clear optimizationOutput
counter = 1;
for randomSeed = 1:10
    for nClusters = 5:15
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

%% plot the PCA

eventMatrixSummary = eventMatrixSummary(~strcmp(eventMatrixSummary.treatment, 'WT'),:);
plot3(pcadata(~strcmp(eventMatrixSummary.treatment, 'KA'),1), pcadata(~strcmp(eventMatrixSummary.treatment, 'KA'),2), pcadata(~strcmp(eventMatrixSummary.treatment, 'KA'),3), '.k')
hold on
plot3(pcadata(strcmp(eventMatrixSummary.treatment, 'KA'),1), pcadata(strcmp(eventMatrixSummary.treatment, 'KA'),2), pcadata(strcmp(eventMatrixSummary.treatment, 'KA'),3), '.r')
grid on


%%

totalHoursSA = sum(sTable1.mean_recordLength(strcmp(sTable1.treatment, 'SA')) / fs / 3600)
totalHoursKA = sum(sTable1.mean_recordLength(strcmp(sTable1.treatment, 'KA')) / fs / 3600)

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

%%
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
    sTable2 = table(idx, probsList', eventMatrixSummary.fileID, eventMatrixSummary.treatment, eventMatrixSummary.recordLength);
    sTable2.Properties.VariableNames = {'idx', 'probsList', 'fileID', 'treatment', 'recordLength'};
    sTable2 = grpstats(sTable2, {'treatment', 'fileID', 'idx', 'recordLength'}, {'mean'}, 'DataVars',{'probsList'});
    sTable2.eventsPerHour = sTable2.GroupCount ./ (sTable2.recordLength / 512 / 3600);

    sTable2.epilepsyEventsPerHour = sTable2.eventsPerHour .* sTable2.mean_probsList;

    sTable2 = grpstats(sTable2, {'treatment', 'fileID'}, {'sum'}, 'DataVars',{'epilepsyEventsPerHour'});
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



%% pick the one with the biggest effect size

clear temp temp2
for i = 1:size(optimizationOutput, 2)
    temp(i) = optimizationOutput(i).effectSize;
    temp2(i) = max(optimizationOutput(i).clusterX);
end

[a, b] = max(temp(temp2 == 9));
zz = find(temp == a);

zz = zz(1);


clear probsList
idx = optimizationOutput(zz).clusterX;
for i = 1:max(idx)
    probsList(idx == i) = optimizationOutput(counter).clusterEpilepsyRatio_prob(i);
end
    

unique(optimizationOutput(zz).clusterEpilepsyRatio_prob)



%% plot the clustering

figure
grid on
hold on
    for i = 1:max(optimizationOutput(zz).clusterX)
    
        plot3(pcadata(optimizationOutput(zz).clusterX == i,1), pcadata(optimizationOutput(zz).clusterX == i,2), pcadata(optimizationOutput(zz).clusterX == i,3), '.');
        
    end
    



    %% now plot example events from the top cluster
        
    temp = fliplr(sort(unique(probsList)));
    figure
    
    for i = 1:length(temp)
        clusterProb = temp(i);
        
        temp2 = probsList == clusterProb;
        
        subplot(3,3,i)

                
            temp_mean = mean(eventMatrix(temp2' & strcmp(eventMatrixSummary.treatment, 'KA'),:));
            temp_std = std(eventMatrix(temp2' & strcmp(eventMatrixSummary.treatment, 'KA'),:));
            sum(temp2' & strcmp(eventMatrixSummary.treatment, 'KA'))

            plot(temp_mean, 'r');
            hold on
            plot(temp_mean + temp_std, '-.r');
            plot(temp_mean - temp_std, '-.r');

            temp_mean = mean(eventMatrix(temp2' & strcmp(eventMatrixSummary.treatment, 'SA'),:));
            temp_std = std(eventMatrix(temp2' & strcmp(eventMatrixSummary.treatment, 'SA'),:));
            sum(temp2' & strcmp(eventMatrixSummary.treatment, 'SA'))
         
            plot(temp_mean, 'k');
            plot(temp_mean + temp_std, '-.k');
            plot(temp_mean - temp_std, '-.k');
            title(strcat("P(e) = ", num2str(1- temp(i))))
            
    
        
    end
    
   
%% now plot 100 examples of each event type


 tempA = fliplr(sort(unique(probsList)));
    
    for i = 1:length(tempA)
        clusterProb = tempA(i);
        
        temp2 = probsList == clusterProb;
        temp = eventMatrix_DB4(temp2,:);
        temp3 = eventMatrixSummary.treatment(temp2);
      
        
        h = figure('units', 'inch', 'pos', [10 10 15 15]) 
        nEvents = 100;
        if size(temp, 1) > nEvents
            randEvents = randsample(size(temp, 1), nEvents);
        else
            nEvents = size(temp, 1);
            randEvents = 1:length(nEvents);
        end
        
        for ii = 1:nEvents
            
            subplot(10, 10, ii)
            useThis = randEvents(ii);
                if strcmp(temp3(useThis), 'KA')
                    plot(temp(useThis,:), 'r')
                else
                    plot(temp(useThis,:), 'k')
                    enda
                %axis off
                xlim([0 size(eventMatrix_DB4, 2)])
                ylim([-20 20])

        end
        suptitle(strcat({'Examples of '}, treatmentGroup, {' events from Cluster: '}, num2str(1 - tempA(i))))
        set(h,'Units','Inches');
        pos = get(h,'Position');
        set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])  
        print(strcat('~/Desktop/examples_', treatmentGroup, '_cluster', num2str(i), '.pdf'), '-dpdf', '-painters')
        close all
    end


        
        
        