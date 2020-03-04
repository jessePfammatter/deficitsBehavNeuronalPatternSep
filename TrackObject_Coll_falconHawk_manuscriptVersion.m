% summary script for 'TrackObject.m' output


% import .csv file that holds behavior data
T = readtable(strcat(labDataDrive, '/falconHawk/behavior_data/placeRecognition/placeRecognition1-6_FOR_PUBLICATION.csv'));


for i = 1:size(T, 1)
    
    videoPath = strcat(labDataDrive, '/falconHawk/behavior_data/placeRecognition/videos/');
    % get filenames and import stages 1, 2, and 3 (a, b, and c in the filenames)
    filespec_a = strcat(videoPath, T.group(i), filesep, strcat(T.group{i}, '_week', num2str(T.trialNo(i))), filesep, strcat(T.mouseID(i), '_', T.trialDate(i), '_p1.mov.summary.mat'));
    filespec_b = strcat(videoPath, T.group(i), filesep, strcat(T.group{i}, '_week', num2str(T.trialNo(i))), filesep, strcat(T.mouseID(i), '_', T.trialDate(i), '_p2.mov.summary.mat'));
    filespec_c = strcat(videoPath, T.group(i), filesep, strcat(T.group{i}, '_week', num2str(T.trialNo(i))), filesep, strcat(T.mouseID(i), '_', T.trialDate(i), '_p3.mov.summary.mat'));
    if exist(filespec_a{1}, 'file') > 0 
        data(i).stage1 = load(filespec_a{1});
        dummyfilespec = strcat(data(i).stage1.summary.vid.videopath, filesep, data(i).stage1.summary.vid.videofilename, '.mov');
        if ~exist(dummyfilespec)
            newvideoname = data(i).stage1.summary.vid.videofilename;
            newvideoname = strcat(newvideoname(1:end-1), '_p1');
            dummyfilespec = strcat(data(i).stage1.summary.vid.videopath, filesep, newvideoname, '.mov');
        end
        xyloObj = VideoReader(dummyfilespec);
        info = get(xyloObj);
        data(i).stage1.frameRate = info.FrameRate;
    end
    if exist(filespec_b{1}, 'file') > 0
        data(i).stage2 = load(filespec_b{1});
        dummyfilespec = strcat(data(i).stage2.summary.vid.videopath, filesep, data(i).stage2.summary.vid.videofilename, '.mov');
        if ~exist(dummyfilespec)
            newvideoname = data(i).stage2.summary.vid.videofilename;
            newvideoname = strcat(newvideoname(1:end-1), '_p2');
            dummyfilespec = strcat(data(i).stage2.summary.vid.videopath, filesep, newvideoname, '.mov');
        end
        xyloObj = VideoReader(dummyfilespec);
        info = get(xyloObj);
        data(i).stage2.frameRate = info.FrameRate;
    end
    if exist(filespec_c{1}, 'file') > 0
        data(i).stage3 = load(filespec_c{1});
        dummyfilespec = strcat(data(i).stage3.summary.vid.videopath, filesep, data(i).stage3.summary.vid.videofilename, '.mov');
        if ~exist(dummyfilespec)
            newvideoname = data(i).stage3.summary.vid.videofilename;
            newvideoname = strcat(newvideoname(1:end-1), '_p3');
            dummyfilespec = strcat(data(i).stage3.summary.vid.videopath, filesep, newvideoname, '.mov');
        end
        xyloObj = VideoReader(dummyfilespec);
        info = get(xyloObj);
        data(i).stage3.frameRate = info.FrameRate;
    end
    
    % add tags for treatment and (lighting in the future)
    data(i).treatment = T.treatment{i};
    treatment{i} = T.treatment{i};
    
    % 
    animal{i} = strcat(T.mouseID{i}, T.group{i});
    
    % import epilespyIndex
    data(i).epilespyIndex = T.epilespyIndex(i);
    
    % which object moved
    data(i).whichObject = T.movedObject(i);
    
    DRM_p2(i) = (T.eL(i) - T.eR(i)) ./ (T.eL(i) + T.eR(i));
    
    if strcmp(data(i).whichObject, 'L')
        DRM_p3(i) = (T.tL(i) - T.tR(i)) ./ (T.tL(i) + T.tR(i));
    else
        DRM_p3(i) = (T.tR(i) - T.tL(i)) ./ (T.tL(i) + T.tR(i));
    end
    
    % generate indecies 
    % make the index for saline vs. ka files
    index.saline(i,:) = strcmp(data(i).treatment, 'SA');
    index.ka(i,:) = strcmp(data(i).treatment, 'KA');
    
    % make indicies of what video files exist
    if isfield(data(i), 'stage1')
        index.stage1vid(i,:) = ~isempty(data(i).stage1);
    else
        index.stage1vid(i,:) = 0;
    end
    if isfield(data(i), 'stage2')
        index.stage2vid(i,:) = ~isempty(data(i).stage2);
    else
        index.stage2vid(i,:) = 0;
    end
    if isfield(data(i), 'stage3')
        index.stage3vid(i,:) = ~isempty(data(i).stage3);
    else
        index.stage3vid(i,:) = 0;
    end
end

% calculate total distance moved in stage 1
dumInd = find(index.stage1vid);
for w = 1:numel(dumInd)
    i = dumInd(w);
    
    % grab the clean trajectories
    cleanx = data(i).stage1.summary.traj.cleanx(2:end-1);
    cleany = data(i).stage1.summary.traj.cleany(2:end-1);
    
    % convert x and y trajectories from pixels to cm -- there is about 400 pixels to 63.5 cm, so 6.30 pixel to each cm.
    adjustmentFactor = 6.3;
    
    cleanx = cleanx / adjustmentFactor;
    cleany = cleany / adjustmentFactor;

    % calculate the euculidian distance between pairs of points for all sequential pairs.
    for z = 1:length(cleanx) - 1
        stepwisedistance_p1(z) = (cleanx(z+1) - cleanx(z))^2 + ((cleany(z+1) - cleany(z)))^2;
    end
    
    % sum up all the distances moved over the trial and standardize by the number of frames.
    total_distance_moved_p1(i) = sum(stepwisedistance_p1) / (length(cleanx) / data(i).stage1.frameRate / 60); % normalized total distance traveled per minute
    
    % time spent near wall
    pct_time_near_wall_p1(i) = data(i).stage1.summary.stats.pct_time_near_wall;
    
    % make index for KA vs. SA in stage1
    if strcmp(T.treatment{i,:}, 'KA') == 1
        KAind_p1(i) = 1;
    else
        KAind_p1(i) = 0;
    end
    
    if strcmp(T.treatment{i,:}, 'SA') == 1
        SAind_p1(i) = 1;
    else
        SAind_p1(i) = 0;
    end

end

% calculate all the stuff we want from stage 2 
dumInd = find(index.stage2vid);
for w = 1:numel(dumInd)
    i = dumInd(w);
      
    % grab the clean trajectories
    cleanx = data(i).stage2.summary.traj.cleanx(2:end-1);
    cleany = data(i).stage2.summary.traj.cleany(2:end-1);
   
    % convert x and y trajectories from pixels to cm -- there is about 400 pixels to 63.5 cm, so 6.30 pixel to each cm.
    adjustmentFactor = 6.3;
    
    cleanx = cleanx / adjustmentFactor;
    cleany = cleany / adjustmentFactor;
    
    % calculate the euculidian distance between pairs of points for all sequential pairs.
    for z = 1:length(cleanx) - 1
        stepwisedistance_p2(z) = (cleanx(z+1) - cleanx(z))^2 + ((cleany(z+1) - cleany(z)))^2;
    end
    
    % sum up all the distances moved over the trial and standardize by the number of frames.
    total_distance_moved_p2(i) = sum(stepwisedistance_p2) / (length(cleanx) / data(i).stage2.frameRate / 60); % normalized total distance traveled per minute;
    
    % time spent near wall
    pct_time_near_wall_p2(i) = data(i).stage2.summary.stats.pct_time_near_wall;
    
    % grab the clean trajectories
    timeSpent_A = data(i).stage2.summary.stats.probclosetoA;
    timeSpent_B = data(i).stage2.summary.stats.probclosetoB;
    whichMoved = data(i).stage2.summary.taskparams.ObjectMoved; % this should be A or B
    distMoved = data(i).stage2.summary.taskparams.DistMoved;
        
    % calculate the discrimination index
    if strcmp(whichMoved, 'B - Right Object')
        movedObject = timeSpent_B;
        unmovedObject = timeSpent_A;
    else 
        movedObject = timeSpent_A;
        unmovedObject = timeSpent_B;
    end
    
    clear discrimRatio timeExploring
    discrimRatio_p2(i) = (movedObject - unmovedObject) / (movedObject + unmovedObject);
    timeExploring_p2(i) = (movedObject + unmovedObject);
    
    % make index for KA vs. SA
    if strcmp(T.treatment{i,:}, 'KA') == 1
        KAind_p2(i) = 1;
    else
        KAind_p2(i) = 0;
    end
    
    if strcmp(T.treatment{i,:}, 'SA') == 1
        SAind_p2(i) = 1;
    else
        SAind_p2(i) = 0;
    end
end

% calculate all the stuff from stage 3
dumInd = find(index.stage3vid);
for w = 1:numel(dumInd)
    i = dumInd(w);
     
    % grab the clean trajectories
    cleanx = data(i).stage3.summary.traj.cleanx(2:end-1);
    cleany = data(i).stage3.summary.traj.cleany(2:end-1);
    
    % convert x and y trajectories from pixels to cm -- there is about 400 pixels to 63.5 cm, so 6.30 pixel to each cm.
    adjustmentFactor = 6.3;
    
    cleanx = cleanx / adjustmentFactor;
    cleany = cleany / adjustmentFactor;
    
    % calculate the euculidian distance between pairs of points for all sequential pairs.
    for z = 1:length(cleanx) - 1
        stepwisedistance_p3(z) = (cleanx(z+1) - cleanx(z))^2 + ((cleany(z+1) - cleany(z)))^2;
    end
    
    % sum up all the distances moved over the trial and standardize by the number of frames.
    total_distance_moved_p3(i) = sum(stepwisedistance_p3) / (length(cleanx) / data(i).stage3.frameRate / 60); % normalized total distance traveled per minute
    
    % pct time spent near wall
    pct_time_near_wall_p3(i) = data(i).stage3.summary.stats.pct_time_near_wall;
    
    % grab the clean trajectories
    timeSpent_A = data(i).stage3.summary.stats.probclosetoA;
    timeSpent_B = data(i).stage3.summary.stats.probclosetoB;
    whichMoved = data(i).stage3.summary.taskparams.ObjectMoved; % this should be A or B
    distObjectMoved_p3(i) = data(i).stage3.summary.taskparams.DistMoved;
    
    % calculate the discrimination index
    if strcmp(whichMoved, 'B - Right Object')
        movedObject = timeSpent_B;
        unmovedObject = timeSpent_A;
    else 
        movedObject = timeSpent_A;
        unmovedObject = timeSpent_B;
    end
    
    clear discrimRatio timeExploring
    DR_p3(i) = (movedObject - unmovedObject) / (movedObject + unmovedObject);
    timeExploring_p3(i) = (movedObject + unmovedObject);
   
    % make index for KA vs. SA
    if strcmp(T.treatment{i,:}, 'KA') == 1
        KAind_p3(i) = 1;
    else
        KAind_p3(i) = 0;
    end
    
    if strcmp(T.treatment{i,:}, 'SA') == 1
        SAind_p3(i) = 1;
    else
        SAind_p3(i) = 0;
    end
    
    % pull out the epilespyIndex
    EI_p3(i) = data(i).epilespyIndex;
end

% collate a bunch of variables

% phase 1
TDM_p1.SA = total_distance_moved_p1(:,find(SAind_p1))';
TDM_p1.KA = total_distance_moved_p1(:,find(KAind_p1))';

PTNW_p1.SA = pct_time_near_wall_p1(:,find(SAind_p1))';
PTNW_p1.KA = pct_time_near_wall_p1(:,find(KAind_p1))';

% phase 2

TDM_p2.SA = total_distance_moved_p2(:,find(SAind_p2))';
TDM_p2.KA = total_distance_moved_p2(:,find(KAind_p2))';

PTNW_p2.SA = pct_time_near_wall_p2(:,find(SAind_p2))';
PTNW_p2.KA = pct_time_near_wall_p2(:,find(KAind_p2))';

DR_p2.SA = discrimRatio_p2(find(SAind_p2))';
DR_p2.KA = discrimRatio_p2(find(KAind_p2))';

TE_p2.SA = timeExploring_p2(find(SAind_p2))';
TE_p2.KA = timeExploring_p2(find(KAind_p2))';

% phase 3

TDM_p3.SA = total_distance_moved_p3(:,find(SAind_p3))';
TDM_p3.KA = total_distance_moved_p3(:,find(KAind_p3))';

PTNW_p3.SA = pct_time_near_wall_p3(:,find(SAind_p3))';
PTNW_p3.KA = pct_time_near_wall_p3(:,find(KAind_p3))';

DR_7_p3.SA = DR_p3(:,SAind_p3 & distObjectMoved_p3 == 7)';
DR_7_p3.KA = DR_p3(:,KAind_p3 & distObjectMoved_p3 == 7)';

TE_7_p3.KA = timeExploring_p3(:,KAind_p3 & distObjectMoved_p3 == 7)';
TE_7_p3.SA = timeExploring_p3(:,SAind_p3 & distObjectMoved_p3 == 7)';

DRM_p3_7.SA = DRM_p3(SAind_p3 & distObjectMoved_p3 == 7);
DRM_p3_7.KA = DRM_p3(KAind_p3 & distObjectMoved_p3 == 7); 

DR_14_p3.SA = DR_p3(:,SAind_p3 & distObjectMoved_p3 == 14)';
DR_14_p3.KA = DR_p3(:,KAind_p3 & distObjectMoved_p3 == 14)';

TE_14_p3.SA = timeExploring_p3(:,SAind_p3 & distObjectMoved_p3 == 14)';
TE_14_p3.KA = timeExploring_p3(:,KAind_p3 & distObjectMoved_p3 == 14)';

DRM_p3_14.SA = DRM_p3(SAind_p3 & distObjectMoved_p3 == 14); 
DRM_p3_14.KA = DRM_p3(KAind_p3 & distObjectMoved_p3 == 14); 

DR_21_p3.SA = DR_p3(:,SAind_p3 & distObjectMoved_p3 == 21)';
DR_21_p3.KA = DR_p3(:,KAind_p3 & distObjectMoved_p3 == 21)';

TE_21_p3.SA = timeExploring_p3(:,SAind_p3 & distObjectMoved_p3 == 21)';
TE_21_p3.KA = timeExploring_p3(:,KAind_p3 & distObjectMoved_p3 == 21)';

DRM_p3_21.SA = DRM_p3(SAind_p3 & distObjectMoved_p3 == 21);
DRM_p3_21.KA = DRM_p3(KAind_p3 & distObjectMoved_p3 == 21); 

EI_p3_7.SA = EI_p3(SAind_p3 & distObjectMoved_p3 == 7);
EI_p3_7.KA = EI_p3(KAind_p3 & distObjectMoved_p3 == 7); 

EI_p3_14.SA = EI_p3(SAind_p3 & distObjectMoved_p3 == 14);
EI_p3_14.KA = EI_p3(KAind_p3 & distObjectMoved_p3 == 14);

EI_p3_21.SA = EI_p3(SAind_p3 & distObjectMoved_p3 == 21);
EI_p3_21.KA = EI_p3(KAind_p3 & distObjectMoved_p3 == 21);

%% plot figure for total distance moved and time spent near wall in phases 1, 2, and 3.



h = figure('units', 'inch', 'pos', [10 10 10 10])
subplot(3,2,1)
    barplot_jp(TDM_p1);
    ylabel('Dist. Moved (cm/min)');
    title('Norm. Euclidian Dist. (S1)');
    tbl = table(total_distance_moved_p1', treatment', animal', 'VariableNames', {'total_distance_moved_p1', 'treatment', 'animal'});
    tbl.treatment = categorical(tbl.treatment);
    tbl.animal = categorical(tbl.animal);
    tbl = tbl(tbl.total_distance_moved_p1 > 0,:);
    tbl = tbl(tbl.treatment ~= 'WT',:);
    tbl.treatment = removecats(tbl.treatment);
    lme = fitlme(tbl,'total_distance_moved_p1 ~ 1 + treatment + (1 | animal)')
    output = anova(lme)
    ylim = get(gca,'ylim');
    yy = ylim(2) - (range(ylim) * .10);
    xlim = get(gca,'xlim');
    xx = xlim(1) + (range(xlim) * .10);
    text(xx,yy, strcat({'P = '}, num2str(round(output.pValue(2), 3))));
subplot(3,2,2)
    barplot_jp(PTNW_p1);
    ylabel('Prop. of time spent near wall');
    title('Prop Time by Wall (S1)');
    tbl = table(pct_time_near_wall_p1', treatment', animal', 'VariableNames', {'pct_time_near_wall_p1', 'treatment', 'animal'});
    tbl.treatment = categorical(tbl.treatment);
    tbl.animal = categorical(tbl.animal);
    tbl = tbl(tbl.pct_time_near_wall_p1 > 0,:);
    tbl = tbl(tbl.treatment ~= 'WT',:);
    tbl.treatment = removecats(tbl.treatment);
    lme = fitlme(tbl,'pct_time_near_wall_p1 ~ 1 + treatment + (1 | animal)')
    output = anova(lme)
    ylim = get(gca,'ylim');
    yy = ylim(2) - (range(ylim) * .10);
    xlim = get(gca,'xlim');
    xx = xlim(1) + (range(xlim) * .10);
    text(xx,yy, strcat({'P = '}, num2str(round(output.pValue(2), 3))));
subplot(3,2,3)
    barplot_jp(TDM_p2);
    ylabel('Dist. Moved (cm/min)');
    title('Norm. Euclidian Dist. (S2)');
    tbl = table(total_distance_moved_p2', treatment', animal', 'VariableNames', {'total_distance_moved_p2', 'treatment', 'animal'});
    tbl.treatment = categorical(tbl.treatment);
    tbl.animal = categorical(tbl.animal);
    tbl = tbl(tbl.total_distance_moved_p2 > 0,:);
    tbl = tbl(tbl.treatment ~= 'WT',:);
    tbl.treatment = removecats(tbl.treatment);
    lme = fitlme(tbl,'total_distance_moved_p2 ~ 1 + treatment + (1 | animal)')
    output = anova(lme)
    ylim = get(gca,'ylim');
    yy = ylim(2) - (range(ylim) * .10);
    xlim = get(gca,'xlim');
    xx = xlim(1) + (range(xlim) * .10);
    text(xx,yy, strcat({'P = '}, num2str(round(output.pValue(2), 3))));
subplot(3,2,4)    
    barplot_jp(PTNW_p2);
    ylabel('Prop. of time spent near wall');
    title('Prop Time by Wall (S2)');
    tbl = table(pct_time_near_wall_p2', treatment', animal', 'VariableNames', {'pct_time_near_wall_p2', 'treatment', 'animal'});
    tbl.treatment = categorical(tbl.treatment);
    tbl.animal = categorical(tbl.animal);
    tbl = tbl(tbl.pct_time_near_wall_p2 > 0,:);
    tbl = tbl(tbl.treatment ~= 'WT',:);
    tbl.treatment = removecats(tbl.treatment);
    lme = fitlme(tbl,'pct_time_near_wall_p2 ~ 1 + treatment + (1 | animal)')
    output = anova(lme)
    ylim = get(gca,'ylim');
    yy = ylim(2) - (range(ylim) * .10);
    xlim = get(gca,'xlim');
    xx = xlim(1) + (range(xlim) * .10);
    text(xx,yy, strcat({'P = '}, num2str(round(output.pValue(2), 3))));
subplot(3,2,5)
    barplot_jp(TDM_p3);
    ylabel('Dist. Moved (cm/min)');
    title('Norm. Euclidian Dist. (S3)');
    tbl = table(total_distance_moved_p3', treatment', animal', 'VariableNames', {'total_distance_moved_p3', 'treatment', 'animal'});
    tbl.treatment = categorical(tbl.treatment);
    tbl.animal = categorical(tbl.animal);
    tbl = tbl(tbl.total_distance_moved_p3 > 0,:);
    tbl = tbl(tbl.treatment ~= 'WT',:);
    tbl.treatment = removecats(tbl.treatment);
    lme = fitlme(tbl,'total_distance_moved_p3 ~ 1 + treatment + (1 | animal)')
    output = anova(lme)
    ylim = get(gca,'ylim');
    yy = ylim(2) - (range(ylim) * .10);
    xlim = get(gca,'xlim');
    xx = xlim(1) + (range(xlim) * .10);
    text(xx,yy, strcat({'P = '}, num2str(round(output.pValue(2), 3))));
subplot(3,2,6)
    barplot_jp(PTNW_p3);
    ylabel('Prop. of time spent near wall');
    title('Prop Time by Wall (S3)');
    tbl = table(pct_time_near_wall_p3', treatment', animal', 'VariableNames', {'pct_time_near_wall_p3', 'treatment', 'animal'});
    tbl.treatment = categorical(tbl.treatment);
    tbl.animal = categorical(tbl.animal);
    tbl = tbl(tbl.pct_time_near_wall_p3 > 0,:);
    tbl = tbl(tbl.treatment ~= 'WT',:);
    tbl.treatment = removecats(tbl.treatment);
    lme = fitlme(tbl,'pct_time_near_wall_p3 ~ 1 + treatment + (1 | animal)')
    output = anova(lme)
    ylim = get(gca,'ylim');
    yy = ylim(2) - (range(ylim) * .10);
    xlim = get(gca,'xlim');
    xx = xlim(1) + (range(xlim) * .10);
    text(xx,yy, strcat({'P = '}, num2str(round(output.pValue(2), 3))));
    
    %%
    
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])  
print('~/Desktop/otherBPSCharacteristics.pdf', '-dpdf')

    %{
%% plot the discrimination values

figure('units', 'inch', 'pos', [10 10 10 10])
subplot(2,2,1)
    barplot_jp(DR_p2);
    ylabel('Discrimination Ratio (A - B, P2)');
    title('Phase 2')
subplot(2,2,2)
    barplot_jp(DR_7_p3);
    ylabel('Discrimination Ratio (moved - unmoved, P3)');
    title('Dist = 7')
subplot(2,2,3)
    barplot_jp(DR_14_p3);
    ylabel('Discrimination Ratio (moved - unmoved, P3)');
    title('Dist = 14')
subplot(2,2,4)
    barplot_jp(DR_21_p3);
    ylabel('Discrimination Ratio (moved - unmoved, P3)');
    title('Dist = 21')
%}

%% plot all of the computer discrimination ratios in a single plot

figure('units', 'inch', 'pos', [10 10 8 6])


scatter(normrnd(7, .1, length(DR_7_p3.KA), 1), DR_7_p3.KA, 40, 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r', 'MarkerFaceAlpha', .5, 'MarkerEdgeAlpha', 0)
hold on
scatter(normrnd(7, .1, length(DR_7_p3.SA), 1), DR_7_p3.SA, 40, 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'MarkerFaceAlpha', .5, 'MarkerEdgeAlpha', 0)
errorbar(7, nanmean(DR_7_p3.KA), nanstd(DR_7_p3.KA) / sqrt(length(DR_7_p3.KA)), 'linewidth', 2, 'Color', 'r')
plot(7, nanmean(DR_7_p3.KA), 'r.', 'MarkerSize', 45)
errorbar(7, nanmean(DR_7_p3.SA), nanstd(DR_7_p3.SA) / sqrt(length(DR_7_p3.SA)), 'linewidth', 2, 'Color', 'k')
plot(7, nanmean(DR_7_p3.SA), 'k.', 'MarkerSize', 45)
scatter(normrnd(14, .1, length(DR_14_p3.KA), 1), DR_14_p3.KA, 40, 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r', 'MarkerFaceAlpha', .5, 'MarkerEdgeAlpha', 0)
scatter(normrnd(14, .1, length(DR_14_p3.SA), 1), DR_14_p3.SA, 40, 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'MarkerFaceAlpha', .5, 'MarkerEdgeAlpha', 0)
errorbar(14, nanmean(DR_14_p3.KA), nanstd(DR_14_p3.KA) / sqrt(length(DR_14_p3.KA)), 'linewidth', 2, 'Color', 'r')
plot(14, nanmean(DR_14_p3.KA), 'r.', 'MarkerSize', 45)
errorbar(14, nanmean(DR_14_p3.SA), nanstd(DR_14_p3.SA) / sqrt(length(DR_14_p3.SA)), 'linewidth', 2, 'Color', 'k')
plot(14, nanmean(DR_14_p3.SA), 'k.', 'MarkerSize', 45)
scatter(normrnd(21, .1, length(DR_21_p3.KA), 1), DR_21_p3.KA, 40, 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r', 'MarkerFaceAlpha', .5, 'MarkerEdgeAlpha', 0)
scatter(normrnd(21, .1, length(DR_21_p3.SA), 1), DR_21_p3.SA, 40, 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'MarkerFaceAlpha', .5, 'MarkerEdgeAlpha', 0)
errorbar(21, nanmean(DR_21_p3.KA), nanstd(DR_21_p3.KA) / sqrt(length(DR_21_p3.KA)), 'linewidth', 2, 'Color', 'r')
plot(21, nanmean(DR_21_p3.KA), 'r.', 'MarkerSize', 45)
errorbar(21, nanmean(DR_21_p3.SA), nanstd(DR_21_p3.SA) / sqrt(length(DR_21_p3.SA)), 'linewidth', 2, 'Color', 'k')
plot(21, nanmean(DR_21_p3.SA), 'k.', 'MarkerSize', 45)



xlabel('Distance Moved (cm)')
ylabel('Computer Tracked Discrimination Ratio')


%% plot manual discrimination Ratios

% build the table
tbl = table(DRM_p3', distObjectMoved_p3', treatment', animal', 'VariableNames',{'DRM_p3', 'distObjectMoved_p3', 'treatment', 'animal'});
tbl.treatment = categorical(tbl.treatment);
tbl.animal = categorical(tbl.animal);
tbl = tbl(tbl.distObjectMoved_p3 > 0,:);
tbl = tbl(tbl.treatment ~= 'WT',:);
tbl.treatment = removecats(tbl.treatment);


%%
temp = grpstats(tbl, {'animal', 'treatment'}, {'mean'}, 'DataVars',{'DRM_p3'});

%%

% build the test
lme = fitlme(tbl,'DRM_p3 ~ 1 + distObjectMoved_p3 + treatment + (1 + distObjectMoved_p3 | animal)')
anova(lme)
lm = fitlme(tbl,'DRM_p3 ~ distObjectMoved_p3 + treatment')
anova(lm)
compare(lm, lme)

% build the figure
h = figure('units', 'inch', 'pos', [10 10 8 6])  
scatter(normrnd(7, .1, length(DRM_p3_7.KA), 1), DRM_p3_7.KA, 40, 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r', 'MarkerFaceAlpha', .5, 'MarkerEdgeAlpha', 0)
hold on
scatter(normrnd(7, .1, length(DRM_p3_7.SA), 1), DRM_p3_7.SA, 40, 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'MarkerFaceAlpha', .5, 'MarkerEdgeAlpha', 0)
errorbar(7, nanmean(DRM_p3_7.KA), nanstd(DRM_p3_7.KA) / sqrt(length(DRM_p3_7.KA)), 'linewidth', 2, 'Color', 'r')
plot(7, nanmean(DRM_p3_7.KA), 'r.', 'MarkerSize', 45)
errorbar(7, nanmean(DRM_p3_7.SA), nanstd(DRM_p3_7.SA) / sqrt(length(DRM_p3_7.SA)), 'linewidth', 2, 'Color', 'k')
plot(7, nanmean(DRM_p3_7.SA), 'k.', 'MarkerSize', 45)
scatter(normrnd(14, .1, length(DRM_p3_14.KA), 1), DRM_p3_14.KA, 40, 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r', 'MarkerFaceAlpha', .5, 'MarkerEdgeAlpha', 0)
scatter(normrnd(14, .1, length(DRM_p3_14.SA), 1), DRM_p3_14.SA, 40, 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'MarkerFaceAlpha', .5, 'MarkerEdgeAlpha', 0)
errorbar(14, nanmean(DRM_p3_14.KA), nanstd(DRM_p3_14.KA) / sqrt(length(DRM_p3_14.KA)), 'linewidth', 2, 'Color', 'r')
plot(14, nanmean(DRM_p3_14.KA), 'r.', 'MarkerSize', 45)
errorbar(14, nanmean(DRM_p3_14.SA), nanstd(DRM_p3_14.SA) / sqrt(length(DRM_p3_14.SA)), 'linewidth', 2, 'Color', 'k')
plot(14, nanmean(DRM_p3_14.SA), 'k.', 'MarkerSize', 45)
scatter(normrnd(21, .1, length(DRM_p3_21.KA), 1), DRM_p3_21.KA, 40, 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r', 'MarkerFaceAlpha', .5, 'MarkerEdgeAlpha', 0)
scatter(normrnd(21, .1, length(DRM_p3_21.SA), 1), DRM_p3_21.SA, 40, 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k', 'MarkerFaceAlpha', .5, 'MarkerEdgeAlpha', 0)
errorbar(21, nanmean(DRM_p3_21.KA), nanstd(DRM_p3_21.KA) / sqrt(length(DRM_p3_21.KA)), 'linewidth', 2, 'Color', 'r')
plot(21, nanmean(DRM_p3_21.KA), 'r.', 'MarkerSize', 45)
errorbar(21, nanmean(DRM_p3_21.SA), nanstd(DRM_p3_21.SA) / sqrt(length(DRM_p3_21.SA)), 'linewidth', 2, 'Color', 'k')
plot(21, nanmean(DRM_p3_21.SA), 'k.', 'MarkerSize', 45)
xlabel('Distance Moved (cm)')
ylabel('Manually Tracked Discrimination Ratio')

% save the figure
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])  
print('~/Desktop/BPSdiscrimination.pdf', '-dpdf')

%% plot discrim ratio manual vs. computer.

%{
plot(DRM_p3_7.SA, DR_7_p3.SA, '*k')
hold on
plot(DRM_p3_14.SA, DR_14_p3.SA, 'sk')
plot(DRM_p3_21.SA, DR_21_p3.SA, 'ok')
plot(DRM_p3_7.KA, DR_7_p3.KA, '*r')
plot(DRM_p3_14.KA, DR_14_p3.KA, 'sr')
plot(DRM_p3_21.KA, DR_21_p3.KA, 'or')
legend('SA 7', 'SA 14', 'SA 21', 'KA 7', 'KA 14', 'KA 21')
%}

index = ~isnan(DRM_p3) & ~isnan(DR_p3) & DR_p3 ~= 0;
mdl = fitlm(DRM_p3(index)', DR_p3(index)', 'linear')

% build the figure
figure('units', 'inch', 'pos', [10 10 8 6])

plot(mdl)
hold on

legend off
scatter(DRM_p3(index & KAind_p3)', DR_p3(index & KAind_p3)', 'or', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r')
scatter(DRM_p3(index & SAind_p3)', DR_p3(index & SAind_p3)', 'or', 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'k')
xlabel('Manually Scored Discrimination Ratio')
ylabel('Computer Scored Discrimination Ratio')
xlim([-1, 1])
ylim([-1, 1])



%% plot manually scored discrimination Ratio against total distance moved and time spent near wall

index = ~isnan(DRM_p3) & ~isnan(DR_p3) & pct_time_near_wall_p3 > 0;
mdl = fitlm(DRM_p3(index)', pct_time_near_wall_p3(index)', 'linear')

figure
plot(DRM_p3, pct_time_near_wall_p3, 'o')
xlabel('Manually Scored Discrimination Ratio')
ylabel('Percent Time Spent Near Wall')

index = ~isnan(DRM_p3) & ~isnan(DR_p3) & total_distance_moved_p3 > 0;
mdl = fitlm(DRM_p3(index)', total_distance_moved_p3(index)', 'linear')

figure
plot(DRM_p3, total_distance_moved_p3, 'o')
xlabel('Manually Scored Discrimination Ratio')
ylabel('Total Distance Moved')

%% find a list of unique animals and show some data that way.

T2 = T(strcmp(T.treatment, 'SA'), :)

[a, b, c] = unique(strcat(T2.mouseID, T2.group));

figure
hold on
for i = 1:max(c)
    a = distObjectMoved_p3(c' == i & KAind_p3);
    b = pct_time_near_wall_p3(c' == i & KAind_p3);
    [sorteda, sortedindex] = sort(a);
    plot(sorteda, b(sortedindex), '-r')
    
    a = distObjectMoved_p3(c' == i & SAind_p3);
    b = pct_time_near_wall_p3(c' == i & SAind_p3);
    [sorteda, sortedindex] = sort(a);
    plot(sorteda, b(sortedindex), '-k')
end
  
xlabel('Distance of Moved Object')
ylabel('Percent Time Near Wall')

figure
hold on
for i = 1:max(c)
    a = distObjectMoved_p3(c' == i & KAind_p3);
    b = total_distance_moved_p3(c' == i & KAind_p3);
    [sorteda, sortedindex] = sort(a);
    plot(sorteda, b(sortedindex), '-r')
    
    a = distObjectMoved_p3(c' == i & SAind_p3);
    b = total_distance_moved_p3(c' == i & SAind_p3);
    [sorteda, sortedindex] = sort(a);
    plot(sorteda, b(sortedindex), '-k')
end
    
xlabel('Distance of Moved Object')
ylabel('Total Distance Moved by Animal')

%% plot the time exploring vs. the discrimination

figure
plot(timeExploring_p3(find(KAind_p3)), DR_p3(find(KAind_p3)), 'ro')
hold on
plot(timeExploring_p3(find(SAind_p3)), DR_p3(find(SAind_p3)), 'ko')

xlabel('timeExploring_p3')
ylabel('Discrimination Ratio')

%% plot the pct time near wall vs. the discrimination

figure
plot(pct_time_near_wall_p3(find(KAind_p3)), DR_p3(find(KAind_p3)), 'ro')
hold on
plot(pct_time_near_wall_p3(find(SAind_p3)), DR_p3(find(SAind_p3)), 'ko')

xlabel('percent time near wall')
ylabel('Discrimination Ratio')

%% plot the total distance moved vs. the discrimination

figure
plot(total_distance_moved_p3(find(KAind_p3)), DR_p3(find(KAind_p3)), 'ro')
hold on
plot(total_distance_moved_p3(find(SAind_p3)), DR_p3(find(SAind_p3)), 'ko')

xlabel('total_distance_moved_p3')
ylabel('Discrimination Ratio')

%% plot the epilepsyIndex


% build the table
tbl = table(DRM_p3', distObjectMoved_p3', EI_p3', treatment', animal', 'VariableNames',{'DRM_p3', 'distObjectMoved_p3', 'EI_p3', 'treatment', 'animal'});
tbl.treatment = categorical(tbl.treatment);
tbl.animal = categorical(tbl.animal);
tbl = tbl(tbl.distObjectMoved_p3 > 0,:);
tbl = tbl(tbl.treatment ~= 'WT',:);
tbl.treatment = removecats(tbl.treatment);

writetable(tbl,'~/Desktop/updatedEpilepsyIndexandBehavioralData_falconHawk.csv')

lme = fitlme(tbl,'DRM_p3 ~ 1 + distObjectMoved_p3 + treatment + EI_p3 + (1 + distObjectMoved_p3 | animal)')
anova(lme)

lme2 = fitlme(tbl,'DRM_p3 ~ 1 + distObjectMoved_p3 + EI_p3 + (1 + distObjectMoved_p3 | animal)')

compare(lme, lme2)

figure
scatter3(EI_p3(find(KAind_p3)), DR_p3(find(KAind_p3)), distObjectMoved_p3(find(KAind_p3)), 'ro')
hold on
scatter3(EI_p3(find(SAind_p3)), DR_p3(find(SAind_p3)), distObjectMoved_p3(find(SAind_p3)), 'ko')

xlabel('Epilepsy Index')
ylabel('Discrimination Ratio')
zlabel('Distance Object Moved');

%% 

% import the mahalanobis distances.


T2 = readtable('/Volumes/cookieMonster/mj1lab_mirror/falconHawk/behavior_data/placeRecognition/falconHawkBehavDiscrim_Mahal.csv')




%%


scatter3(T2.discrim7(strcmp('normal', T2.treatment)), T2.discrim14(strcmp('normal', T2.treatment)), T2.discrim21(strcmp('normal', T2.treatment)), T2.mahalDistances(strcmp('normal', T2.treatment)) * 35, 'k', 'filled')
hold on
scatter3(T2.discrim7(strcmp('epileptic', T2.treatment)), T2.discrim14(strcmp('epileptic', T2.treatment)), T2.discrim21(strcmp('epileptic', T2.treatment)), T2.mahalDistances(strcmp('epileptic', T2.treatment)) * 35, 'r', 'filled')
xlabel('Discrimination at 7 cm')
ylabel('Discrimination at 14 cm')
zlabel('Discrimination at 21 cm')


mdl = fitlm(T2, 'mahalDistances ~ treatment')
anova(mdl)

%%

% make a barplot inset for the 3d plot

scatter(normrnd(ones(length(T2.mahalDistances(strcmp('normal', T2.treatment))), 1), .1),  T2.mahalDistances(strcmp('normal', T2.treatment)), [100], 'k', 'filled', 'markerfacealpha', .5)
hold on
errorbar(1, mean(T2.mahalDistances(strcmp('normal', T2.treatment))), std(T2.mahalDistances(strcmp('normal', T2.treatment))) / sqrt(length(T2.mahalDistances(strcmp('normal', T2.treatment)))) , 'k', 'linewidth', 2)
scatter(normrnd(ones(length(T2.mahalDistances(strcmp('epileptic', T2.treatment))), 1) * 2, .1),  T2.mahalDistances(strcmp('epileptic', T2.treatment)), [100], 'r', 'filled', 'markerfacealpha', .5)
errorbar(2, mean(T2.mahalDistances(strcmp('epileptic', T2.treatment))), std(T2.mahalDistances(strcmp('epileptic', T2.treatment))) / sqrt(length(T2.mahalDistances(strcmp('epileptic', T2.treatment)))), 'r', 'linewidth', 2)
xlim([.5 2.5])
xticks([1, 2])
xticklabels({'Ctrl', 'KA'})
ylabel('Mahalanobis Distances')

saveas(gcf,'/Users/jesse/Desktop/mahalDistancesBarplot.pdf')
 

%% 

scatter(T2.mahalDistances(strcmp('normal', T2.treatment)), T2.epilepsyIndex(strcmp('normal', T2.treatment)), 45, 'k', 'filled')
hold on
scatter(T2.mahalDistances(strcmp('epileptic', T2.treatment)), T2.epilepsyIndex(strcmp('epileptic', T2.treatment)), 45, 'r', 'filled')

tbl.treatment = removecats(tbl.treatment);

[h, p, ~, stat] = ttest2(T2.mahalDistances(strcmp('normal', T2.treatment)), T2.mahalDistances(strcmp('epileptic', T2.treatment)))

%mdl = fitlm(T2, 'mahalDistances ~ epilepsyIndex')
%anova(mdl)

xlabel('Mahalanobis Distances for BPS Discrimination')
ylabel('Hourly Epilepsy Index')

