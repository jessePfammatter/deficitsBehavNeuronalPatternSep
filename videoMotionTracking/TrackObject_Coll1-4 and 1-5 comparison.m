% summary script for 'TrackObject.m' output
close all
[basePath, merlinPath, cookieMonster, user] = getUserPath();


%
% import .csv file that holds behavior data
T = readtable('/Users/jesse/private/jonesLab_data/falconHawk/behavior_data/placeRecognition/placeRecognition1-4and1-5VideoAnalysis.xlsx');

for i = 1:size(T, 1)
    
    videoPath = '/Users/jesse/private/jonesLab_data/falconHawk/behavior_data/placeRecognition/videos/';
    % get filenames and import stages 1, 2, and 3 (a, b, and c in the filenames)
    filespec_a = strcat(videoPath, T.group(i), filesep, strcat(T.group{i}, ' week', num2str(T.trialNo(i))), filesep, strcat(T.trialDate(i), '_', T.mouseID(i), 'a.mov.summary.mat'));
    filespec_b = strcat(videoPath, T.group(i), filesep, strcat(T.group{i}, ' week', num2str(T.trialNo(i))), filesep, strcat(T.trialDate(i), '_', T.mouseID(i), 'b.mov.summary.mat'));
    filespec_c = strcat(videoPath, T.group(i), filesep, strcat(T.group{i}, ' week', num2str(T.trialNo(i))), filesep, strcat(T.trialDate(i), '_', T.mouseID(i), 'c.mov.summary.mat'));
    if exist(filespec_a{1}, 'file') > 0 
        data(i).stage1 = load(filespec_a{1});
    end
    if exist(filespec_b{1}, 'file') > 0
        data(i).stage2 = load(filespec_b{1});
    end
    if exist(filespec_c{1}, 'file') > 0
        data(i).stage3 = load(filespec_c{1});
    end
    
    % add tags for treatment and (lighting in the future)
    data(i).treatment = T.treatment{i};
    
    % generate indecies 
    % make the index for saline vs. ka files
    index.saline(i,:) = strcmp(data(i).treatment, 'Saline');
    index.ka(i,:) = strcmp(data(i).treatment, 'KA');
    
    % make indicies of what video files exist
    index.stage1vid(i,:) = ~isempty(data(i).stage1);
    index.stage2vid(i,:) = ~isempty(data(i).stage2);
    index.stage3vid(i,:) = ~isempty(data(i).stage3);
    
end

%%
% calculate total distance moved in stage 1 

figure('units', 'inch', 'pos', [10 10 7 15]) 

clear temp
dumInd = find(index.stage1vid);
for w = 1:numel(dumInd)
    i = dumInd(w);
    % concatanate a vector of the x and y values that the animal moved
    dummy = [data(i).stage1.summary.traj.cleanx'; data(i).stage1.summary.traj.cleany']';
    
    % calculate the euculidian distance between pairs of points for all sequential pairs.
    for j = 2:length(dummy)
        dummy2(j-1) = pdist([dummy(j-1,:);dummy(j,:)]); 
    end
    
    % sum up all the distances moved over the trial and standardize by the number of frames.
    temp.total_distance_moved(w) = sum(dummy2);
    temp.standard_distance_moved(w) = temp.total_distance_moved(w)/length(dummy);
    temp.pct_time_near_wall(w) = data(i).stage1.summary.stats.pct_time_near_wall;

    temp.treatment{w} = data(i).treatment;
end

%
% use the plotting functions to plot the results

subplot(3, 2, 1)
    plot(ones(sum(strcmp(temp.treatment, 'Saline')),1), temp.standard_distance_moved(strcmp(temp.treatment, 'Saline')), '.k', 'MarkerSize', 10)
    hold on;
    errorbar(1, mean(temp.standard_distance_moved(strcmp(temp.treatment, 'Saline'))), std(temp.standard_distance_moved(strcmp(temp.treatment, 'Saline'))) / sqrt(size(temp.treatment, 2)), 'k', 'linewidth', 2, 'capsize', 20)

    plot(2*ones(sum(strcmp(temp.treatment, 'KA')),1), temp.standard_distance_moved(strcmp(temp.treatment, 'KA')), '.r', 'MarkerSize', 10)
    errorbar(2, mean(temp.standard_distance_moved(strcmp(temp.treatment, 'KA'))), std(temp.standard_distance_moved(strcmp(temp.treatment, 'KA'))) / sqrt(size(temp.treatment, 2)), 'r', 'linewidth', 2, 'capsize', 20)
    xlim([.5 2.5])

    ylabel('Distance Moved', 'interpreter', 'none')
    title('Stage 1')
    
    [h, p] = ttest2(temp.standard_distance_moved(strcmp(temp.treatment, 'Saline')), temp.standard_distance_moved(strcmp(temp.treatment, 'KA')))


subplot(3, 2, 2)
    plot(ones(sum(strcmp(temp.treatment, 'Saline')),1), temp.pct_time_near_wall(strcmp(temp.treatment, 'Saline')), '.k', 'MarkerSize', 10)
    hold on;
    errorbar(1, mean(temp.pct_time_near_wall(strcmp(temp.treatment, 'Saline'))), std(temp.pct_time_near_wall(strcmp(temp.treatment, 'Saline'))) / sqrt(size(temp.treatment, 2)), 'k', 'linewidth', 2, 'capsize', 20)

    plot(2*ones(sum(strcmp(temp.treatment, 'KA')),1), temp.pct_time_near_wall(strcmp(temp.treatment, 'KA')), '.r', 'MarkerSize', 10)
    errorbar(2, mean(temp.pct_time_near_wall(strcmp(temp.treatment, 'KA'))), std(temp.pct_time_near_wall(strcmp(temp.treatment, 'KA'))) / sqrt(size(temp.treatment, 2)), 'r', 'linewidth', 2, 'capsize', 20)
    xlim([.5 2.5])

    ylabel('% Time Near Wall', 'interpreter', 'none')
    title('Stage 1')
    
    [h, p] = ttest2(temp.pct_time_near_wall(strcmp(temp.treatment, 'Saline')), temp.pct_time_near_wall(strcmp(temp.treatment, 'KA')))


%
clear temp
dumInd = find(index.stage2vid);
for w = 1:numel(dumInd)
    i = dumInd(w);
    % concatanate a vector of the x and y values that the animal moved
    dummy = [data(i).stage2.summary.traj.cleanx'; data(i).stage2.summary.traj.cleany']';
    
    % calculate the euculidian distance between pairs of points for all sequential pairs.
    for j = 2:length(dummy)
        dummy2(j-1) = pdist([dummy(j-1,:);dummy(j,:)]); 
    end
    
    % sum up all the distances moved over the trial and standardize by the number of frames.
    temp.total_distance_moved(w) = sum(dummy2);
    temp.standard_distance_moved(w) = temp.total_distance_moved(w)/length(dummy);
    temp.pct_time_near_wall(w) = data(i).stage2.summary.stats.pct_time_near_wall;

    temp.treatment{w} = data(i).treatment;
end

%
% use the plotting functions to plot the results

subplot(3, 2, 3)
    plot(ones(sum(strcmp(temp.treatment, 'Saline')),1), temp.standard_distance_moved(strcmp(temp.treatment, 'Saline')), '.k', 'MarkerSize', 10)
    hold on;
    errorbar(1, mean(temp.standard_distance_moved(strcmp(temp.treatment, 'Saline'))), std(temp.standard_distance_moved(strcmp(temp.treatment, 'Saline'))) / sqrt(size(temp.treatment, 2)), 'k', 'linewidth', 2, 'capsize', 20)

    plot(2*ones(sum(strcmp(temp.treatment, 'KA')),1), temp.standard_distance_moved(strcmp(temp.treatment, 'KA')), '.r', 'MarkerSize', 10)
    errorbar(2, mean(temp.standard_distance_moved(strcmp(temp.treatment, 'KA'))), std(temp.standard_distance_moved(strcmp(temp.treatment, 'KA'))) / sqrt(size(temp.treatment, 2)), 'r', 'linewidth', 2, 'capsize', 20)
    xlim([.5 2.5])

    ylabel('Distance Moved', 'interpreter', 'none')
    title('Stage 2')
    
    [h, p] = ttest2(temp.standard_distance_moved(strcmp(temp.treatment, 'Saline')), temp.standard_distance_moved(strcmp(temp.treatment, 'KA')))


subplot(3, 2, 4)
    plot(ones(sum(strcmp(temp.treatment, 'Saline')),1), temp.pct_time_near_wall(strcmp(temp.treatment, 'Saline')), '.k', 'MarkerSize', 10)
    hold on;
    errorbar(1, mean(temp.pct_time_near_wall(strcmp(temp.treatment, 'Saline'))), std(temp.pct_time_near_wall(strcmp(temp.treatment, 'Saline'))) / sqrt(size(temp.treatment, 2)), 'k', 'linewidth', 2, 'capsize', 20)

    plot(2*ones(sum(strcmp(temp.treatment, 'KA')),1), temp.pct_time_near_wall(strcmp(temp.treatment, 'KA')), '.r', 'MarkerSize', 10)
    errorbar(2, mean(temp.pct_time_near_wall(strcmp(temp.treatment, 'KA'))), std(temp.pct_time_near_wall(strcmp(temp.treatment, 'KA'))) / sqrt(size(temp.treatment, 2)), 'r', 'linewidth', 2, 'capsize', 20)
    xlim([.5 2.5])

    ylabel('% Time Near Wall', 'interpreter', 'none')
    title('Stage 2')
    
    [h, p] = ttest2(temp.pct_time_near_wall(strcmp(temp.treatment, 'Saline')), temp.pct_time_near_wall(strcmp(temp.treatment, 'KA')))


%

clear temp
dumInd = find(index.stage3vid);
for w = 1:numel(dumInd)
    i = dumInd(w);
    % concatanate a vector of the x and y values that the animal moved
    dummy = [data(i).stage3.summary.traj.cleanx'; data(i).stage3.summary.traj.cleany']';
    
    % calculate the euculidian distance between pairs of points for all sequential pairs.
    for j = 2:length(dummy)
        dummy2(j-1) = pdist([dummy(j-1,:);dummy(j,:)]); 
    end
    
    % sum up all the distances moved over the trial and standardize by the number of frames.
    temp.total_distance_moved(w) = sum(dummy2);
    temp.standard_distance_moved(w) = temp.total_distance_moved(w)/length(dummy);
    temp.pct_time_near_wall(w) = data(i).stage3.summary.stats.pct_time_near_wall;

    temp.treatment{w} = data(i).treatment;
end

%
% use the plotting functions to plot the results

subplot(3, 2, 5)
    plot(ones(sum(strcmp(temp.treatment, 'Saline')),1), temp.standard_distance_moved(strcmp(temp.treatment, 'Saline')), '.k', 'MarkerSize', 10)
    hold on;
    errorbar(1, mean(temp.standard_distance_moved(strcmp(temp.treatment, 'Saline'))), std(temp.standard_distance_moved(strcmp(temp.treatment, 'Saline'))) / sqrt(size(temp.treatment, 2)), 'k', 'linewidth', 2, 'capsize', 20)
    
    plot(2*ones(sum(strcmp(temp.treatment, 'KA')),1), temp.standard_distance_moved(strcmp(temp.treatment, 'KA')), '.r', 'MarkerSize', 10)
    errorbar(2, mean(temp.standard_distance_moved(strcmp(temp.treatment, 'KA'))), std(temp.standard_distance_moved(strcmp(temp.treatment, 'KA'))) / sqrt(size(temp.treatment, 2)), 'r', 'linewidth', 2, 'capsize', 20)
    xlim([.5 2.5])

    ylabel('Distance Moved', 'interpreter', 'none')
    title('Stage 3')

    [h, p] = ttest2(temp.standard_distance_moved(strcmp(temp.treatment, 'Saline')), temp.standard_distance_moved(strcmp(temp.treatment, 'KA')))

subplot(3, 2, 6)
    plot(ones(sum(strcmp(temp.treatment, 'Saline')),1), temp.pct_time_near_wall(strcmp(temp.treatment, 'Saline')), '.k', 'MarkerSize', 10)
    hold on;
    errorbar(1, mean(temp.pct_time_near_wall(strcmp(temp.treatment, 'Saline'))), std(temp.pct_time_near_wall(strcmp(temp.treatment, 'Saline'))) / sqrt(size(temp.treatment, 2)), 'k', 'linewidth', 2, 'capsize', 20)

    plot(2*ones(sum(strcmp(temp.treatment, 'KA')),1), temp.pct_time_near_wall(strcmp(temp.treatment, 'KA')), '.r', 'MarkerSize', 10)
    errorbar(2, mean(temp.pct_time_near_wall(strcmp(temp.treatment, 'KA'))), std(temp.pct_time_near_wall(strcmp(temp.treatment, 'KA'))) / sqrt(size(temp.treatment, 2)), 'r', 'linewidth', 2, 'capsize', 20)
    xlim([.5 2.5])

    ylabel('% Time Near Wall', 'interpreter', 'none')
    title('Stage 3')
    
    [h, p] = ttest2(temp.pct_time_near_wall(strcmp(temp.treatment, 'Saline')), temp.pct_time_near_wall(strcmp(temp.treatment, 'KA')))

print('~/Desktop/beahvioralMovementCheck.pdf', '-dpdf')

% NOT WORKNG BELOW THIS POINT 4/5/18 JP
    
%% show trajectory heatmap averages for Saline vs. KA
% for stage 1 
clear temp

dumInd = find(index.stage1vid);
for w = 1:numel(dumInd)
    
    i = dumInd(w);
    x = data(i).stage1.summary.traj.cleanx;
    y = data(i).stage1.summary.traj.cleany;


    xx = [1:data(i).stage1.summary.vid.vidWidth];
    yy = [1:data(i).stage1.summary.vid.vidWidth]; % orginal code had an error and didn's save the videHeight -- I'll assume it square until the next batch of animals. (5/23/16)
    N = hist3([x y], {xx, yy});
    H = fspecial('gaussian', 50, 10);
    temp(i).fN = imfilter(N,H); 
   
end

heatmapObject = temp;

tempData = heatmapObject(dumInd)';
tempTrt = T.treatment(dumInd);
forPlot.Saline = tempData(find(strcmp(tempTrt, 'Saline')));
forPlot.KA = tempData(find(strcmp(tempTrt, 'KA')));

% calculate the mean for the heatmaps..
meanSaline = forPlot.Saline(1).fN;
for i = 2:length(forPlot.Saline)
    meanSaline = meanSaline + forPlot.Saline(i).fN;
end
meanSaline = meanSaline ./length(forPlot.Saline);
forPlot.Saline = meanSaline;

meanKA = forPlot.KA(1).fN;
for i = 2:length(forPlot.KA)
    meanKA = meanKA + forPlot.KA(i).fN;
end
meanKA = meanKA ./length(forPlot.KA);
forPlot.KA = meanKA;

figure();

subplot(2, 2, 1)
    imagesc(xx, yy, forPlot.Saline', 'alphadata', 0.4);
    title('Saline Stage1');
    axes('units', 'norm', 'pos', [0 0 1 1])
    axis off
    
subplot(2, 2, 2)
    imagesc(xx, yy, forPlot.KA', 'alphadata', 0.4); 
    title('KA Stage1');
    axes('units', 'norm', 'pos', [0 0 1 1])
    axis off

    %text(0.5, 0.975, 'temporary label', 'fontname', 'times', 'fontsize', 18, 'horiz', 'center') 

% for stage 2 
clear temp

dumInd = find(index.stage2vid);
for w = 1:numel(dumInd)
    
    i = dumInd(w);
    x = data(i).stage2.summary.traj.cleanx;
    y = data(i).stage2.summary.traj.cleany;


    xx = [1:data(i).stage2.summary.vid.vidWidth];
    yy = [1:data(i).stage2.summary.vid.vidWidth]; % orginal code had an error and didn's save the videHeight -- I'll assume it square until the next batch of animals. (5/23/16)
    N = hist3([x y], {xx, yy});
    H = fspecial('gaussian', 50, 10);
    temp(i).fN = imfilter(N,H); 
   
end

heatmapObject = temp;

% plot for plotting Saline vs. KA
tempData = heatmapObject(dumInd)';
tempTrt = T.treatment(dumInd);
forPlot.Saline = tempData(find(strcmp(tempTrt, 'Saline')));
forPlot.KA = tempData(find(strcmp(tempTrt, 'KA')));


% calculate the mean for the heatmaps..
meanSaline = forPlot.Saline(1).fN;
for i = 2:length(forPlot.Saline)
    meanSaline = meanSaline + forPlot.Saline(i).fN;
end
meanSaline = meanSaline ./length(forPlot.Saline);
forPlot.Saline = meanSaline;

meanKA = forPlot.KA(1).fN;
for i = 2:length(forPlot.KA)
    meanKA = meanKA + forPlot.KA(i).fN;
end
meanKA = meanKA ./length(forPlot.KA);
forPlot.KA = meanKA;

subplot(2, 2, 3)
    imagesc(xx, yy, forPlot.Saline', 'alphadata', 0.4);
    title('Saline Stage2');
    axes('units', 'norm', 'pos', [0 0 1 1])
    axis off
    
subplot(2, 2, 4)
    imagesc(xx, yy, forPlot.KA', 'alphadata', 0.4); 
    title('KA Stage2');
    axes('units', 'norm', 'pos', [0 0 1 1])
    axis off

    
% print the figure for KA vs. Saline
figname = [videoPath 'figures/heatMaps_salineVka.tif'];
print(figname, '-dtiff', '-r300')

clear forPlot

%% plot for average heatmaps by animal groups
% for stage 1 
clear temp

dumInd = find(index.stage1vid);
for w = 1:numel(dumInd)
    
    i = dumInd(w);
    x = data(i).stage1.summary.traj.cleanx;
    y = data(i).stage1.summary.traj.cleany;


    xx = [1:data(i).stage1.summary.vid.vidWidth];
    yy = [1:data(i).stage1.summary.vid.vidWidth]; % orginal code had an error and didn's save the videHeight -- I'll assume it square until the next batch of animals. (5/23/16)
    N = hist3([x y], {xx, yy});
    H = fspecial('gaussian', 50, 10);
    temp(i).fN = imfilter(N,H); 
   
end

heatmapObject = temp;

tempData = heatmapObject(dumInd)';
tempTrt = T.group(dumInd);
forPlot.onefourb = tempData(find(strcmp(tempTrt, '1-4b')));
forPlot.onefivea = tempData(find(strcmp(tempTrt, '1-5a')));
forPlot.onefiveb = tempData(find(strcmp(tempTrt, '1-5b')));

% calculate the mean for the heatmaps..
mean_onefourb = forPlot.onefourb(1).fN;
for i = 2:length(forPlot.onefourb)
    mean_onefourb = mean_onefourb + forPlot.onefourb(i).fN;
end
mean_onefourb = mean_onefourb ./length(forPlot.onefourb);
forPlot.onefourb = mean_onefourb;

mean_onefivea = forPlot.onefivea(1).fN;
for i = 2:length(forPlot.onefivea)
    mean_onefivea = mean_onefivea + forPlot.onefivea(i).fN;
end
mean_onefivea = mean_onefivea ./length(forPlot.onefivea);
forPlot.onefivea = mean_onefivea;

mean_onefiveb = forPlot.onefiveb(1).fN;
for i = 2:length(forPlot.onefiveb)
    mean_onefiveb = mean_onefiveb + forPlot.onefiveb(i).fN;
end
mean_onefiveb = mean_onefiveb ./length(forPlot.onefiveb);
forPlot.onefiveb = mean_onefiveb;


figure();

subplot(2, 3, 1)
    imagesc(xx, yy, forPlot.onefourb', 'alphadata', 0.4);
    title('1-4b Stage1');
    axes('units', 'norm', 'pos', [0 0 1 1])
    axis off
    
subplot(2, 3, 2)
    imagesc(xx, yy, forPlot.onefivea', 'alphadata', 0.4); 
    title('1-5a Stage1');
    axes('units', 'norm', 'pos', [0 0 1 1])
    axis off
    
subplot(2, 3, 3)
    imagesc(xx, yy, forPlot.onefiveb', 'alphadata', 0.4); 
    title('1-5b Stage1');
    axes('units', 'norm', 'pos', [0 0 1 1])
    axis off
    %text(0.5, 0.975, 'temporary label', 'fontname', 'times', 'fontsize', 18, 'horiz', 'center') 

% for stage 2 
clear temp

dumInd = find(index.stage2vid);
for w = 1:numel(dumInd)
    
    i = dumInd(w);
    x = data(i).stage2.summary.traj.cleanx;
    y = data(i).stage2.summary.traj.cleany;


    xx = [1:data(i).stage2.summary.vid.vidWidth];
    yy = [1:data(i).stage2.summary.vid.vidWidth]; % orginal code had an error and didn's save the videHeight -- I'll assume it square until the next batch of animals. (5/23/16)
    N = hist3([x y], {xx, yy});
    H = fspecial('gaussian', 50, 10);
    temp(i).fN = imfilter(N,H); 
   
end

heatmapObject = temp;

tempData = heatmapObject(dumInd)';
tempTrt = T.group(dumInd);
forPlot.onefourb = tempData(find(strcmp(tempTrt, '1-4b')));
forPlot.onefivea = tempData(find(strcmp(tempTrt, '1-5a')));
forPlot.onefiveb = tempData(find(strcmp(tempTrt, '1-5b')));

% calculate the mean for the heatmaps..
mean_onefourb = forPlot.onefourb(1).fN;
for i = 2:length(forPlot.onefourb)
    mean_onefourb = mean_onefourb + forPlot.onefourb(i).fN;
end
mean_onefourb = mean_onefourb ./length(forPlot.onefourb);
forPlot.onefourb = mean_onefourb;

mean_onefivea = forPlot.onefivea(1).fN;
for i = 2:length(forPlot.onefivea)
    mean_onefivea = mean_onefivea + forPlot.onefivea(i).fN;
end
mean_onefivea = mean_onefivea ./length(forPlot.onefivea);
forPlot.onefivea = mean_onefivea;

mean_onefiveb = forPlot.onefiveb(1).fN;
for i = 2:length(forPlot.onefiveb)
    mean_onefiveb = mean_onefiveb + forPlot.onefiveb(i).fN;
end
mean_onefiveb = mean_onefiveb ./length(forPlot.onefiveb);
forPlot.onefiveb = mean_onefiveb;

subplot(2, 3, 4)
    imagesc(xx, yy, forPlot.onefourb', 'alphadata', 0.4);
    title('1-4b Stage2');
    axes('units', 'norm', 'pos', [0 0 1 1])
    axis off
    
subplot(2, 3, 5)
    imagesc(xx, yy, forPlot.onefivea', 'alphadata', 0.4); 
    title('1-5a Stage2');
    axes('units', 'norm', 'pos', [0 0 1 1])
    axis off
    
subplot(2, 3, 6)
    imagesc(xx, yy, forPlot.onefiveb', 'alphadata', 0.4); 
    title('1-5b Stage2');
    axes('units', 'norm', 'pos', [0 0 1 1])
    axis off
    %text(0.5, 0.975, 'temporary label', 'fontname', 'times', 'fontsize', 18, 'horiz', 'center') 


    
% print the figure for 1-5a, 1-5b, 1-4b 
figname = [videoPath 'figures/heatMaps_groups.tif'];
print(figname, '-dtiff', '-r300')

clear forPlot



%% output .m file

