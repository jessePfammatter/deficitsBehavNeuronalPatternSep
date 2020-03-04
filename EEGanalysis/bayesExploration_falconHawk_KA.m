% explore Bayes method for clustering, P(KA|event) = (P(event|KA) * P(KA)) / P(event)

% run some things to set up -- pulled these from detectIIS_KA (the updated version)
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

% make a summary table that shows events per animal per day
sTable1 = grpstats(eventMatrixSummary, {'animalID', 'treatment', 'recordDay', 'recordLength'}, {'mean'}, 'DataVars',{'recordLength'});
sTable1.eventsPerHour = sTable1.GroupCount ./ (sTable1.mean_recordLength / fs / 3600);

sTable3 = grpstats(sTable1, {'animalID', 'treatment'}, {'mean', 'sum'}, 'DataVars', {'eventsPerHour', 'mean_recordLength'});

meanKAeventsPerHour = mean(sTable3.mean_eventsPerHour(strcmp(sTable3.treatment, 'KA')));
meanSAeventsPerHour = mean(sTable3.mean_eventsPerHour(~strcmp(sTable3.treatment, 'KA')));

prior = meanKAeventsPerHour / (meanKAeventsPerHour + meanSAeventsPerHour);

clear scalingVect
% this vector allows the appropriate weighting for each event relative the the number of hours sampled per animal and the number of animals sampled.
for i = 1:size(eventMatrixSummary.recordLength, 1)
    animalTreatment = sTable3.treatment(strcmp(eventMatrixSummary.animalID{i}, sTable3.animalID));
    if strcmp(animalTreatment, 'KA')
        numAnimalsInTreatment = length(sTable3.mean_eventsPerHour(strcmp(sTable3.treatment, 'KA')));
    else
        numAnimalsInTreatment = length(sTable3.mean_eventsPerHour(~strcmp(sTable3.treatment, 'KA')));
    end
    numRecordsFromAnimal = sTable3.GroupCount(strcmp(eventMatrixSummary.animalID{i}, sTable3.animalID));
    scalingVect(i) = 1 / eventMatrixSummary.recordLength(i) / numRecordsFromAnimal / numAnimalsInTreatment;
end

% find the unique animal names
uniqueAnimalNames = unique(sTable1.animalID);

temp = eventMatrix(:,fs:fs+103); % only choose SA and KA animals for this -- the same that were used in the publication
%temp = eventMatrix_DB4;

PCA = pcamj(temp, 'display'); % 103 data points is a little bit longer than 200ms 512Hz * .2 seconds
pcadata = PCA.Proj(:,1:3);

% plot the pca results
KAind = strcmp(eventMatrixSummary.treatment, 'KA');
%SAind = strcmp(eventMatrixSummary.treatment, 'SA');
SAind = ~strcmp(eventMatrixSummary.treatment, 'KA');

h = figure('units', 'inch', 'pos', [10 10 8 8]) 
scatter3(pcadata(KAind,1), pcadata(KAind,2), pcadata(KAind,3), '.r', 'MarkerFaceAlpha', .6, 'MarkerEdgeAlpha', .4)
hold on
scatter3(pcadata(SAind,1), pcadata(SAind,2), pcadata(SAind,3), '.k', 'MarkerFaceAlpha', .6, 'MarkerEdgeAlpha', .6)
    xlabel('PC1')
    ylabel('PC2')
    zlabel('PC3') % xxx
    h.Renderer = 'painters';

    
saveas(h, '/Users/jesse/Desktop/pca.pdf')


totalHoursSA = sum(sTable1.recordLength(strcmp(sTable1.treatment, 'SA')) / fs / 3600);
totalHoursKA = sum(sTable1.recordLength(strcmp(sTable1.treatment, 'KA')) / fs / 3600);



%%

% P(KA), the prior. Somewhat difficult to calculate as this quantity could represent several different things but I think the ratio of KA to SA events is right. so 
% (# KA events / KA sample effort) / ((# KA events / KA sample effort) * (# SA events / SA sample effort))

% P(event). The probability of selecting an event from the set of events.

% P(event|KA). The probability of selecting an event from the set of KA events

    
clear output
dsList = [1:30]; % we can cycle across all of these to provide an error measurement for the epilepsy index but where do we start and where do we end?
for j = 1:length(dsList)
    % okay, first set up some stuff
    ds = dsList(j); % binwidth (in units of PC axes)
    output(j).voxelSize = ds;

    % vectors of bin starts
    xbins = [ min(pcadata(:,1)) - ds : ds : max(pcadata(:,1)) + ds];
    ybins = [ min(pcadata(:,2)) - ds : ds : max(pcadata(:,2)) + ds];
    zbins = [ min(pcadata(:,3)) - ds : ds : max(pcadata(:,3)) + ds];
    

    % each iteration in this loop will calculate probability densities and pKA values for each voxel based on some random sample of half the data. We can then use this to test model stability.
    nIterations = 200;
    for ii = 1:nIterations
        
        holdoutProp = 0.5;
        modelInd = randsample(size(pcadata, 1), floor(size(pcadata, 1) * (1 - holdoutProp))); % change this to the proportion of data you would like to holdout.
        modelData = pcadata(modelInd,:);
        SAxModelInd = intersect(find(SAind), modelInd);
        KAxModelInd = intersect(find(KAind), modelInd);    

        holdoutData = pcadata(~modelInd,:);
        SAxHoldoutInd = intersect(find(SAind), ~modelInd);
        KAxHoldoutInd = intersect(find(KAind), ~modelInd);
        
        % calculate P(event|SA)
        tempData = pcadata(SAxModelInd,:);
        tempInd = scalingVect(SAxModelInd);
        [DSA edges mid] = histcn(tempData, xbins, ybins, zbins, 'AccumData', tempInd); % see MatlabCentral for histcn
        DSA = DSA ./ sum(DSA(:)); % we were previously using this step to turn the hist counts into the probability density. However using probability densities doesn't seem to work well in Bayes Theorem. For whatever reason, keeping these as histogram counts gives perfectly expected results.

        % calculate P(event|KA)
        tempData = pcadata(KAxModelInd,:);
        tempInd = scalingVect(KAxModelInd);
        [DKA edges mid] = histcn(tempData, xbins, ybins, zbins, 'AccumData', tempInd);
        DKA = DKA ./ sum(DKA(:));

        % calculate P(event)
        tempData = modelData;
        tempInd = scalingVect;
        [DE edges mid] = histcn(tempData, xbins, ybins, zbins, 'AccumData', tempInd); % see MatlabCentral for histcn
        DE = DE ./ sum(DE(:));

        % how many events per voxel on average? cov
        [output(j).iteration(ii).DE] = histcn(tempData, xbins, ybins, zbins); % see MatlabCentral for histcn
    
        % P(KA|event) in bayesian framework 
        bayesConditional = (DKA * prior) ./ DE;

        % prob KA for each voxel.. this is the same thing but without any space for a prior and makes more sense in terms of event counts
        %probVoxelBeingKA = DKA ./ (DKA + DSA);

        % now assign each event back to it's voxel
        whichDataToUse = bayesConditional; % make sure you select which method you want.
        [~, edges, mid, loc] = histcn(pcadata, xbins, ybins, zbins); % see MatlabCentral for histcn
        clear eventMatrixEIValues
        for i = 1:size(loc, 1)
            temp = loc(i,:);
            if sum(temp == 0) > 0 
                pKA(i) = 0;
            else
                pKA(i) = whichDataToUse(temp(1), temp(2), temp(3));
            end
        end

        output(j).pKA_fromRandomSubsamples(:,ii) = pKA;
    end
    
    % ----- now caluclate the full model without dropping data
    
    % now calculate P(event|SA)
    tempData = pcadata(SAind,:);
    tempInd = scalingVect(SAind);
    [DSA edges mid] = histcn(tempData, xbins, ybins, zbins, 'AccumData', tempInd); % see MatlabCentral for histcn
    DSA = DSA ./ sum(DSA(:)); % we were previously using this step to turn the hist counts into the probability density. However using probability densities doesn't seem to work well in Bayes Theorem. For whatever reason, keeping these as histogram counts gives perfectly expected results.

    % now calculate P(event|KA)
    tempData = pcadata(KAind,:);
    tempInd = scalingVect(KAind);
    [DKA edges mid] = histcn(tempData, xbins, ybins, zbins, 'AccumData', tempInd);
    DKA = DKA ./ sum(DKA(:));

    % now calculate P(event)
    tempData = pcadata;
    tempInd = scalingVect;
    [DE edges mid] = histcn(tempData, xbins, ybins, zbins, 'AccumData', tempInd); % see MatlabCentral for histcn
    DE = DE ./ sum(DE(:));

    % so P(KA|event).. not sure this makes sense but I'm also not sure 
    output(j).bayesConditional = (DKA * prior) ./ DE;

    output(j).kainateProp = DKA ./ (DSA + DKA);
    
    % assign each event back to it's voxel
    whichDataToUse = output(j).kainateProp; % make sure you select which method you want.
    [~, edges, mid, loc] = histcn(pcadata, xbins, ybins, zbins); % see MatlabCentral for histcn
    for i = 1:size(loc, 1)
        temp = loc(i,:);
        if sum(temp == 0) > 0 
            output(j).pKA(i) = 0;
        else
            output(j).pKA(i) = whichDataToUse(temp(1), temp(2), temp(3));
        end
    end
    
    output(j).pKA;
    
    %  calculate some relevant statistics that compare the pKA_randomSubsamples to the pKA values from the whole model
    for ii = 1:nIterations
        output(j).pKA_differences(:,ii) = output(j).pKA' - output(j).pKA_fromRandomSubsamples(:,ii);
        [output(j).h(ii), output(j).p(ii)] = ttest(output(j).pKA_differences(:,ii));
        
    end
    
    % standard deviation of the pKA
    output(j).stddeviations = nanstd(output(j).pKA_fromRandomSubsamples');
    output(j).means = nanmean(output(j).pKA_fromRandomSubsamples');
    output(j).cov = output(j).stddeviations / output(j).means;
    meancov(j) = nanmean( output(j).cov);
    output(j).meancov = meancov(j);
    
end

% calculate a few other useful quantities including the coefficient of variation across mulptilple iterations of the model
for j = 1:size(output, 2)
    for ii = 1:nIterations
        %meanNumEvents = nanmean(output(j).iteration(ii).DE(:));
        meanNumEvents = nanmean(output(j).iteration(ii).DE(output(j).iteration(ii).DE ~= 0 ));
        maxNumEvents = max(output(j).iteration(ii).DE(output(j).iteration(ii).DE ~= 0 ));
        stdNumEvents = nanstd(output(j).iteration(ii).DE(output(j).iteration(ii).DE ~= 0 ));
        covcov(j,ii) = stdNumEvents/meanNumEvents;
        meanVoxelSize(j,ii) = meanNumEvents;
        maxmaxNumEvents(j,ii) = maxNumEvents;
    end
end
 meancovVoxels = mean(covcov, 2);
 meanVS = mean(meanVoxelSize, 2);
 maxNE = mean(maxmaxNumEvents, 2);

%{
%% compare iterations with each other.. this doesn't really produce useful results

figure
hold on
for j = 1:30%:30
    for i = 1:nIterations/2
        index1 = i;
        index2 = i+(nIterations/2);
        [p(i), h(i)] = ranksum(round(output(j).pKA_fromRandomSubsamples(:,index1), 2), round(output(j).pKA_fromRandomSubsamples(:,index2), 2));
        %[h(i), p(i)] = kstest(output(j).pKA_fromRandomSubsamples(:,index1)', output(j).pKA_fromRandomSubsamples(:,index2)');
        
    end
    plot(j, sum(h), '.k')
    sum(h)

end

figure
histogram(output(j).pKA_fromRandomSubsamples(:,index1), 'Normalization', 'probability')
hold on
histogram(output(j).pKA_fromRandomSubsamples(:,index2), 'Normalization', 'probability')
xlabel('Event/Voxel pKAs')
ylabel('Probability')
title(strcat(num2str(j), " Voxels"))
 
%}

    %% summary figures and idecies.. be careful to look through these and change values as you change the j index.. it's not coded super clearly
    
    % set the number of voxels and plot some data
    for j = 10%1:size(output, 2)
    
        %{
        % plot some of these probabilities back onto the events so we can look at how the process went.
        scatter3(pcadata(:,1), pcadata(:,2), pcadata(:,3), 5, output(j).pKA, 'filled')
        colormap('redgreenblue')
        colorbar()

        %}
        
        % do you want to scale the data to only focus on the KA specific events? This is the way we did it in the publication
        eventMatrixEIValues2 = output(j).pKA;
        doScale = 1;
        if doScale
            eventMatrixEIValues2 = (eventMatrixEIValues2 - 0.5);
            eventMatrixEIValues2(eventMatrixEIValues2 < 0) = 0;
            eventMatrixEIValues2 = eventMatrixEIValues2 * 2;
        end

        % build a summary table to calculate the epilepsy index
        sTable2 = table(eventMatrixEIValues2', eventMatrixSummary.animalID, eventMatrixSummary.recordDay, eventMatrixSummary.treatment, eventMatrixSummary.recordLength);
        sTable2.Properties.VariableNames = {'probsList', 'animalID', 'recordDay', 'treatment', 'recordLength'};
        sTable2 = grpstats(sTable2, {'treatment', 'animalID', 'recordDay', 'recordLength'}, {'sum'}, 'DataVars',{'probsList'});
        sTable2.ei = sTable2.sum_probsList ./ (sTable2.recordLength / 512 / 3600);
        sTable2 = grpstats(sTable2, {'treatment', 'animalID'}, {'mean'}, 'DataVars',{'ei'});
        writetable(sTable2, '/Users/jesse/Desktop/epilepsyIndex_voxelSize10_scaled.csv')
        
        % pull the epilepsy index values from the previous table
        output(j).KA_EI = sTable2.mean_ei(strcmp(sTable2.treatment, 'KA'));
        output(j).SA_EI = sTable2.mean_ei(~strcmp(sTable2.treatment, 'KA')); 

        % perform a statistical test to compare the means between the KA and SA group. t-test is particularly sensitive to the lack of normality and gives weird results.
        %[~, p] = ttest2(sTable2.mean_ei(strcmp(sTable2.treatment, 'KA')), sTable2.mean_ei(strcmp(sTable2.treatment, 'SA')), 'Vartype','unequal')
        output(j).pValue = ranksum(sTable2.mean_ei(strcmp(sTable2.treatment, 'KA')), sTable2.mean_ei(~strcmp(sTable2.treatment, 'KA')));
        pValue(j) = ranksum(sTable2.mean_ei(strcmp(sTable2.treatment, 'KA')), sTable2.mean_ei(~strcmp(sTable2.treatment, 'KA')));
        
        % calculate the means of the two groups
        output(j).KAmean = mean(output(j).KA_EI);
        KAmean(j) = mean(output(j).KA_EI);
        output(j).SAmean = mean(output(j).SA_EI);
        SAmean(j) = mean(output(j).SA_EI);
        output(j).effectSize = output(j).KAmean - output(j).SAmean;  
        effectSize(j) = output(j).KAmean - output(j).SAmean; 
        
    end
    
    %%
    % plot the summary statistics from the voxel search.
    
    set(0,'defaultAxesFontSize',12)

%
figure('units', 'inch', 'pos', [10 10 10 10]) 
subplot(2,2,1)
    plot(meancov)
    xlabel('Voxel Size (Units in PCA Space^3)')
    ylabel('Average Cofficient of Variation for Event/Voxel pKA Values');
subplot(2,2,2)
    plot(effectSize)
    xlabel('Voxel Size (Units in PCA Space^3)')
    ylabel('Effect Size of Epilepsy Index');
subplot(2,2,3)
    plot(meanVS)
    xlabel('Voxel Size (Units in PCA Space^3)')
    ylabel('Average Num Events Per Non-Zero Voxel');
subplot(2,2,4)
    plot(pValue)
    xlabel('Voxel Size (Units in PCA Space^3)')
    ylabel('P-value comparing KA and SA Epilepsy Indices');
saveas(gcf, '/Users/jesse/Desktop/optimization_bayesKA.pdf')

    %
        set(0,'defaultAxesFontSize',20)

    j = 10
    
h = figure('units', 'inch', 'pos', [10 10 8 8]) 
        scatter3(pcadata(:,1), pcadata(:,2), pcadata(:,3), 5, output(j).pKA, 'filled', 'MarkerFaceAlpha', .6, 'MarkerEdgeAlpha', .4)
        colormap('redgreenblue')
        colorbar() 
        title('Voxel size of 10x10x10 scaled', 'interpreter', 'none')
        xlabel('PC1')
        ylabel('PC2')
        zlabel('PC3')
        h.Renderer = 'painters';

saveas(h, '/Users/jesse/Desktop/voxelPKA_bayesKA.pdf')

        % plot the epilepsy index

h = figure('units', 'inch', 'pos', [10 10 8 8]) 
        plot(normrnd(ones(length(output(j).SA_EI),1), .1), output(j).SA_EI, 'ok', normrnd(ones(length(output(j).KA_EI),1) * 2, .1), output(j).KA_EI, 'or')
        xticks([1, 2])
        xticklabels({'SA', 'KA'})
        ylabel('Hourly Epilepsy Index')
        xlim([.5, 2.5]);
        title('Voxel size of 10x10x10 scaled', 'interpreter', 'none')
        breakyaxis([15 45])
                h.Renderer = 'painters';

saveas(h, '/Users/jesse/Desktop/ei_bayesKA.pdf')
   
    
    % write the data to a table
     %writetable(sTable2,'/Users/jesse/Desktop/epilepsyIndexValues_5_scaled.csv')

     
     %% now plot what some of the similar events look like that have a pKA above .90

     highCut = output(j).pKA > .80;
     
      figure
        scatter3(pcadata(highCut,1), pcadata(highCut,2), pcadata(highCut,3), 5, output(j).pKA(highCut), 'filled')
        hold on
        scatter3(0,0,0,5,0,'filled')
        colormap('redgreenblue')
        xlabel('PCA1')
        ylabel('PCA2')
        zlabel('PCA3')
        colorbar() 
        title('Voxel size of 10x10x10 notScaled', 'interpreter', 'none')

        
        %looks like things less than -15 on PCA1 vs things above -15 split these into two groups.
        
        groupA = pcadata(:,1) < -10 & highCut';
        groupB = pcadata(:,1) > - 10 & highCut';
        
        
       %% plot the EI for the two groups
              
       sTable2 = table(eventMatrixEIValues2', groupA, groupB, eventMatrixSummary.animalID, eventMatrixSummary.recordDay, eventMatrixSummary.treatment, eventMatrixSummary.recordLength);
        sTable2.Properties.VariableNames = {'probsList', 'groupA', 'groupB', 'animalID', 'recordDay', 'treatment', 'recordLength'};
        sTable2 = grpstats(sTable2, {'treatment', 'animalID', 'recordDay', 'recordLength'}, {'sum'}, 'DataVars',{'probsList', 'groupA', 'groupB'});
        sTable2.ei = sTable2.sum_probsList ./ (sTable2.recordLength / 512 / 3600);
        sTable2.groupA = sTable2.sum_groupA ./ (sTable2.recordLength / 512 / 3600);
        sTable2.groupB = sTable2.sum_groupB ./ (sTable2.recordLength / 512 / 3600);

        sTable2 = grpstats(sTable2, {'treatment', 'animalID'}, {'mean'}, 'DataVars',{'ei', 'groupA', 'groupB'});

        % pull the epilepsy index values from the previous table
        output(j).KA_EI = sTable2.mean_ei(strcmp(sTable2.treatment, 'KA'));
        output(j).KA_groupA = sTable2.mean_groupA(strcmp(sTable2.treatment, 'KA'));
        output(j).KA_groupB = sTable2.mean_groupB(strcmp(sTable2.treatment, 'KA'));
        output(j).SA_EI = sTable2.mean_ei(~strcmp(sTable2.treatment, 'KA')); 
        output(j).SA_groupA = sTable2.mean_groupA(~strcmp(sTable2.treatment, 'KA'));
        output(j).SA_groupB = sTable2.mean_groupB(~strcmp(sTable2.treatment, 'KA'));
        
        % perform a statistical test to compare the means between the KA and SA group. t-test is particularly sensitive to the lack of normality and gives weird results.
        %[~, p] = ttest2(sTable2.mean_ei(strcmp(sTable2.treatment, 'KA')), sTable2.mean_ei(strcmp(sTable2.treatment, 'SA')), 'Vartype','unequal')
        output(j).pValue = ranksum(sTable2.mean_ei(strcmp(sTable2.treatment, 'KA')), sTable2.mean_ei(~strcmp(sTable2.treatment, 'KA')));
        pValue(j) = ranksum(sTable2.mean_ei(strcmp(sTable2.treatment, 'KA')), sTable2.mean_ei(~strcmp(sTable2.treatment, 'KA')));
        pValue_groupA(j) = ranksum(sTable2.mean_groupA(strcmp(sTable2.treatment, 'KA')), sTable2.mean_groupA(~strcmp(sTable2.treatment, 'KA')));
        pValue_groupB(j) = ranksum(sTable2.mean_groupB(strcmp(sTable2.treatment, 'KA')), sTable2.mean_groupB(~strcmp(sTable2.treatment, 'KA')));
        
        % calculate the means of the two groups
        output(j).KAmean = mean(output(j).KA_EI);
        KAmean(j) = mean(output(j).KA_EI);
        output(j).SAmean = mean(output(j).SA_EI);
        SAmean(j) = mean(output(j).SA_EI);
        output(j).effectSize = output(j).KAmean - output(j).SAmean;  
        effectSize(j) = output(j).KAmean - output(j).SAmean; 
        
        
        figure
        subplot(1,2,1)
            plot(normrnd(ones(length(output(j).SA_groupA),1), .1), output(j).SA_groupA, 'ok', normrnd(ones(length(output(j).KA_groupA),1) * 2, .1), output(j).KA_groupA, 'or')
            xticks([1, 2])
            xticklabels({'SA', 'KA'})
            ylabel('Group A Event Frequency')
            xlim([.5, 2.5]);
            title('Voxel size of 10x10x10', 'interpreter', 'none')        
        subplot(1,2,2)
            plot(normrnd(ones(length(output(j).SA_groupB),1), .1), output(j).SA_groupB, 'ok', normrnd(ones(length(output(j).KA_groupB),1) * 2, .1), output(j).KA_groupB, 'or')
            xticks([1, 2])
            xticklabels({'SA', 'KA'})
            ylabel('Group B Event Frequency')
            xlim([.5, 2.5]);
            title('Voxel size of 10x10x10', 'interpreter', 'none')
        
            
            writetable(sTable2,'/Users/jesse/Desktop/epilepsyIndexValues_10_scaled_groupA+B.csv')