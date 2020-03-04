function TrackObjOutput = TrackObject_jp(SetupFile)

% TrackObjOutput = TrackObject(trackoptions);
% 
% Track position of a moving object in an environment with specified geometry and objects.
%     For example, specifically for tracking a mouse in an arena with 0 or 2 objects.
% TRACKOPTIONS is a struct of various options...
%     (not ready yet)
%     If TRACKOPTIONS is not provided, the user will be prompted for manual input.
% TRACKOBJECTOUTPUT is a struct with output data.
%     (not ready yet)
%     This function will also save output data to disk:
%         - filename.screencap.avi    - a video of the tracking and geometry
%         - filename.stats.png        - a figure with some measurements etc
%         - filename.traj.png         - a figure with the object trajectory, geometry and heatmap
%         - filename.summary.mat      - a matfile with analysis summary
%     
%         
% - MJones 2016, JPfammatter 2018


% %% Initialize
% clear all
% close all
 

if ~nargin
%     videopath = '/Users/jonesmat/Desktop/WebcamTests'
%     % videofilename   = 'testmouse.mp4.avi';
%     % videofilename   = '030316PRB.avi';
%     % videofilename       = '030316PRB-18376-21663.mov'
%     % videofilename       = '030316PRB-24670-27375.mov'
%     videofilename       = '030316PRB-30722-33472.mov'
    manualparamentry = 1;
end    
 

if ~exist('SetupFile', 'var')

    %% Make an alert soundwave
    t=0:0.001:2;                    % 2 secs @ 1kHz sample rate
    y=chirp(t,0,1,150);             % Start @ DC, cross 150Hz at t=1sec
    sndwave = y./10;

    defaultfig
    close(gcf)



    %% Get video data

    if manualparamentry
        [basePath merlinPath cookieMonster user] = getUserPath();
        defpath = basePath;
        cd(defpath)
        %sound(sndwave)
        [videofilename videopath] = uigetfile('*.*', 'Choose a video file:');
        cd(videopath)   
    end

    videofilespec = [videopath videofilename];
    screencapname       = [videofilespec '.screencap'];

    % Get vid properties
    disp(['Getting video data from ' videofilespec])
    vidObj     	= VideoReader(videofilespec);
    vidWidth    = vidObj.Width;
    vidHeight   = vidObj.Height;
    maxframe    = vidObj.NumberOfFrames;

    % Recreate the object to allow further processing
    vidObj          = VideoReader(videofilespec);




    %% Draw maze and select important locations
    initFrame = readFrame(vidObj);
    f1 = figure('units', 'pixels', 'pos', [100 1000 vidWidth vidHeight]);
    im = image(initFrame); 
        axis image
        hold on
    title(videofilename)
    screencapdata(1) = getframe(gca);

    % select the edges of the maze and allocate them to geom object
    %sound(sndwave)
    uiwait(msgbox('Select some points defining the borders  (Double-Click the last point) ','Select Maze Boundary','modal'));
    drawnow
    [x, y] = getpts(gca);
    geom.edges = [x y];
    geom.ctr   = mean(geom.edges);
    geom.perim = (0.8 .* (geom.edges - repmat(geom.ctr, size(geom.edges, 1), 1))) + repmat(geom.ctr, size(geom.edges, 1), 1);

    % Draw boundaries
    geom.dspedges = [geom.edges; geom.edges(1,:)];
    geom.dspperim = [geom.perim; geom.perim(1,:)];
    brdh = plot(geom.dspedges(:,1), geom.dspedges(:,2), 'y-');
    prmh = plot(geom.dspperim(:,1), geom.dspperim(:,2), 'c-');
    ctrh = plot(geom.ctr(1), geom.ctr(2), 'r+');
    drawnow

    % select starting location of the mouse
       %sound(sndwave)
       uiwait(msgbox('Double click the starting location of the mouse', 'Select Mouse Location', 'modal'));
       [x, y] = getpts(gca);
       geom.mouseStart = [x y];

    % Query task parameters
        %sound(sndwave)
        options.videofilespec = videofilespec;
        taskparams = querytaskparams(options);   % Call GUI for user input
        figlabel = [videofilename ' - Phase ' num2str(taskparams.TrialPhaseNum)] ;
        if strcmp(taskparams.TrialPhase, '3 - Object Moved') | strcmp(taskparams.TrialPhase, '2 - Objects Centered')
            success = 0;
            while ~success
                figure(f1)
                %sound(sndwave)
                uiwait(msgbox('First click on OBJECT A (Left-hand), then double-click on OBJECT B (Right-hand) ','Select Objects','modal'));
                [x, y] = getpts(gca);
                if length(x)==2 & x(2)>x(1)
                    success = 1;
                    geom.ObjPos = [x y];
                end
            end
        end
else
    load(SetupFile)
    %SetupFile = '/Users/jesse/Desktop/L0R0_11.29.16b.mov_SetupFile.mat';
    %load('/Users/jesse/Desktop/L0R0_11.29.16b.mov_humanTracking.mat') % mouse tracking i did with the computer mouse -- human tracking
end




%% Read all frames

% import video
vidObj          = VideoReader(videofilespec);

% Make a screencap video object
screencapObj    = VideoWriter(screencapname, 'MPEG-4');
screencapObj.Quality = 10;
open(screencapObj);

% figure out how many frames to read
desiredseconds = vidObj.Duration;    % inf to read the entire video 
nframes = floor(desiredseconds.*vidObj.FrameRate);

% mov = ReadAllVidFrames(vidObj, nframes);
tic; 
    % Recreate the object to allow further processing
    disp(['Reading ' num2str(nframes) ' frames  - This may take ' num2str(0.0484.*nframes) ' secs'])
    mov = read(vidObj, [1 nframes]);
toc
   
%{
% this time dilation is probably no longer needed and takes quite a long time.
tic
    % Dilate along the time dimension
    disp(['Dilating along time dimension - This may take ' num2str(0.0803.*nframes) ' secs'])
    %msg = msgbox(['Dilating 5 frames along time dimension - This may take ' num2str(0.0803.*nframes) ' secs'], 'Implementing Time Dilation', 'modal') ;
    dil = imdilate(mov, ones(1,1,1,5)); 
    %delete(msg)
toc
%}

% establish a bunch of starting things for the tracking
x = zeros(nframes, 1);
y = x;
x(1) = geom.mouseStart(1);
y(1) = geom.mouseStart(2);
z = x;
stime = tic;
etime = [];

% plot the figure and the mouse features
figure(f1)
hold on
pl1 = plot(0, 0, 'ro', 'markerfacecolor', 'r', 'markersize', 16);
pl2 = plot(0, 0, 'r.-' );
if taskparams.TrialPhaseNum ~= 1
	obj1h = plot(geom.ObjPos(1,1), geom.ObjPos(1,2), 'yo', 'markersize', 16, 'linewidth', 2)    
    obj2h = plot(geom.ObjPos(2,1), geom.ObjPos(2,2), 'yo', 'markersize', 16, 'linewidth', 2) 
end

%% Tracking Code



% cycle through all of the frames
for n = 2:nframes-1
 
    % add some info on processing stuff to output for user to see
    if mod(n, 100) == 0
        etime(n) = toc(stime);
        disp(['Analyzing ' num2str(n) '/' num2str(nframes) '/' num2str(maxframe) ' frames from ' videofilename])
        disp(['     elapsed time ' num2str(etime(n)) ' sec'])
    end
 
    % establish the raw image for screen capture purposes
    rawimg = mov(:,:,:,n);
    
    % convert images to greyscale
    %thisframe = dil(:,:,:,n); % use if doing the time dilation.. don?t think we need this anymore
    thisframe = mov(:,:,:,n);
    
    % restrict tracking to within the maze
    mask = roipoly(thisframe, geom.edges(:,1), geom.edges(:,2));
        
    % skip two frames to subtract movement unless there are not 2 frames to subtract.. (i.e. on the second frame.
    if n > 2
        lastframe = mov(:,:,:,n-2);
    else
        lastframe = mov(:,:,:,n - 1);
    end
    
    % convert the frames to greyscale
    thisframe = rgb2gray(thisframe);
    lastframe = rgb2gray(lastframe);
    
    % subtract the two images to find the movement
    d = imabsdiff( thisframe, lastframe );
    
    % blurr the subtraction to weed out any noise
    d = imgaussfilt(d, 4);
    
    % set the binary image and cut out really low values of the subtraction
    BW = d;
    %prctile(BW(:), 95)
    cutttttt = 25;
    BW(find(BW < cutttttt)) = 0; % value for RGB cutoff seems to be a random value but where the 'elbow for these data were'
    BW(find(BW >= cutttttt)) = 1;
    
    % and the values outside the mask
    BW(find(mask == 0)) = 0;
    
    % record the current mouse position to get a better idea of where the animal is moving
    humanTracking = 0;
    if humanTracking 
        humanTracked = get(0, 'PointerLocation');
        humanTrackedX(n) = humanTracked(1);
        humanTrackedY(n) = humanTracked(2);
    end
           
    % find the centroid of the biggest blob
    s = regionprops(BW, d, {'Centroid','PixelValues','BoundingBox', 'Area', 'Extent'});
    if length(s) > 0 
        
    % how many different objects were created
    numObj = numel(s);

    %{
    imshow(d);
    title('Standard Deviation of Regions');
    hold on
    for k = 1 : numObj
        s(k).StandardDeviation = std(double(s(k).PixelValues));
        text(s(k).Centroid(1),s(k).Centroid(2), ...
            sprintf('%2.1f', s(k).StandardDeviation), ...
            'EdgeColor','b','Color','r');
            rectangle('Position',s(k).BoundingBox,'FaceColor','r');

    end
    hold off
    %}
    
    x(n) = s(numObj).Centroid(1);
    y(n) = s(numObj).Centroid(2);
    
  
    area(n) = s(numObj).Area;
    extent(n) = s(numObj).Extent;
 
    else
        x(n) = x(n - 1);
        y(n) = y(n - 1);
        area(n) = 0;
        extent(n) = 0;
    end
 
    %{
    %% alternate method that showed some promise.
    % remove all of the pixel groups of a certain small size
    d = bwareaopen(d, 1);
    d = imfill(d, 'holes');
    vectorD = d(:);
    [B, C] = maxk(vectorD, 10000);
    [c, r, p] = ind2sub(size(d),C);
    %mean_coordDist = mean(mean(pdist2(r, c)));
    std_coordDist = std(std(pdist2(r, c)));
    %}

    %{
    % this section of code is used to exclude points that don?t have certain properties. This gets kinda dangerous    especially with the jump stuff because if the dot gets left behind then you?re screwed. Best to leave this section alone and deal with things above properly.
    % Ignore this point if it is outside the boundary, or if the jump is too large
    areathresh = 1000;
    %jumpthresh = 150; % sometimes this jump threshold causes the ball to be dropped and not picked up for a while.. best to leave it out if possible.
    inpoly = inpolygon(x(n), y(n), geom.edges(:,1), geom.edges(:,2));
    %jump   = sqrt( (x(n)-x(n-1)).^2 + (y(n)-y(n-1)).^2 ); 
    if ~inpoly | (area<areathresh) %| (jump>jumpthresh)
        x(n) = x(n-1);
        y(n) = y(n-1);
    end    
    %}

    % display image and estimated location
    set(im, 'cdata', rawimg)
    set(pl1, 'xdata', x(n), 'ydata', y(n))
    set(pl2, 'xdata', x(1:n), 'ydata', y(1:n))
    title(num2str(n))
    drawnow
   
    % Save Screen frame for video
    screencapdata(n) = getframe(gca);
end

  
%% Clean up jump artifacts by filtering mildly


%{
flt = gradient(erf(-3:2:3));
flt = flt./sum(flt);
cleanx = filter(flt, 1, x);
cleany = filter(flt, 1, y);

%}

%cleanxy = movmean([x,y], 5, 1);

z = smoothn({x,y}, 500);
%{
figure
plot(x,y,'r.',z{1},z{2},'k','linewidth',2)
% plot(x,y, 'r.',z{1},z{2},'k',  humanTrackedX, -humanTrackedY, 'b')
%}
cleanx = z{1};
cleany = z{2};

%{
plot([x, y])
hold on
plot([cleanx cleany])
plot([humanTrackedX', -humanTrackedY'])
legend('x', 'y', 'cleanx', 'cleany', 'humanx', 'humany')

%}

%{
% line length as a measure of comparison between human tracking and the
cleaned computer tracking.

ecdf(abs(diff(x)))
hold on
ecdf(abs(diff(y)))
ecdf(abs(diff(cleanx)))
ecdf(abs(diff(cleany)))
ecdf(abs(diff(humanTrackedX)))
ecdf(abs(diff(humanTrackedY)))
%}

%{
%% compare between the clean coordinates, raw coordinates, and human scoring if it exists

clear computerDist cleanComputerDist humanDist

dummy = [x'; y']';
for j = 2:length(dummy)
    computerDist(j-1) = pdist([dummy(j-1,:);dummy(j,:)]); 
end


dummy = [cleanx'; cleany']';
for j = 2:length(dummy)
    cleanComputerDist(j-1) = pdist([dummy(j-1,:);dummy(j,:)]); 
end

dummy = [humanTrackedX; humanTrackedY]';
for j = 2:length(dummy)
    humanDist(j-1) = pdist([dummy(j-1,:);dummy(j,:)]); 
end

% plot these features
%plot(normalize(computerDist))

humanDist(find(humanDist > 200)) = 0
plot(normalize(humanDist))
hold on;
plot(normalize(cleanComputerDist))
legend('humanDist', 'cleanComputerDist')
xlabel('frame number')
ylabel('Euclidian Dist')



%}

%% Show trajectory and heat map
xx = [1:vidWidth];
yy = [1:vidHeight];
N = hist3([x y], {xx, yy});
H = fspecial('gaussian', 50, 10);
fN = imfilter(N,H); 

f2 = figure;
axes( 'pos', [0.2 0.5 0.6 0.5] )
    im = image(mov(:,:,:,2)); 
    axis image
axes( 'pos', [0.2 0.05 0.6 0.5] )
    im = image(mov(:,:,:,2)); 
    axis image
    hold on
    brdh = plot(geom.dspedges(:,1), geom.dspedges(:,2), 'y-');
    prmh = plot(geom.dspperim(:,1), geom.dspperim(:,2), 'c-');
    ctrh = plot(geom.ctr(1), geom.ctr(2), 'r+');
    if taskparams.TrialPhaseNum ~= 1
        obj1h = plot(geom.ObjPos(1,1), geom.ObjPos(1,2), 'yo', 'markersize', 16, 'linewidth', 2)    
        obj2h = plot(geom.ObjPos(2,1), geom.ObjPos(2,2), 'yo', 'markersize', 16, 'linewidth', 2)  
    end    
        plot(cleanx(2:end), cleany(2:end), 'w.-'); hold on
    im2 = imagesc(xx, yy, fN', 'alphadata', 0.4); 
axes('units', 'norm', 'pos', [0 0 1 1])
axis off
text(0.5, 0.975, figlabel, 'fontname', 'times', 'fontsize', 18, 'horiz', 'center')    
    
%% Calculate some stats and display
stats.insideperim                   = inpolygon(x, y, geom.perim(:,1), geom.perim(:,2));
stats.pct_time_near_wall            = 1-length(find(stats.insideperim))./length(x);
stats.distfromctr                   = sqrt( (cleanx-geom.ctr(1)).^2 + (cleany-geom.ctr(2)).^2 );
[h, bins]                           = hist(stats.distfromctr, [0:10:300]);
stats.distfromctrpdf                = h./sum(h);
stats.distfromctrcdf                = cumsum( stats.distfromctrpdf );
stats.distfromctrbins               = bins;

% Find distances from the two objects
if taskparams.TrialPhaseNum ~= 1
    closethresh = 50;
    stats.distfromA                 = sqrt( (cleanx-geom.ObjPos(1,1)).^2 + (cleany-geom.ObjPos(1,2)).^2 ); 
    stats.distfromB              	= sqrt( (cleanx-geom.ObjPos(2,1)).^2 + (cleany-geom.ObjPos(2,2)).^2 );   
    [stats.distfromApdf, stats.distfromAbins]        = hist(stats.distfromA, [0:20:450]);
    [stats.distfromBpdf, stats.distfromBbins]        = hist(stats.distfromB, [0:20:450]);
    stats.distfromApdf              = stats.distfromApdf./sum(stats.distfromApdf);
    stats.distfromBpdf              = stats.distfromBpdf./sum(stats.distfromBpdf);
    stats.distfromAcdf            	= cumsum(stats.distfromApdf);
    stats.distfromBcdf            	= cumsum(stats.distfromBpdf);    
    stats.probclosetoA = length( find( stats.distfromA <= closethresh ) )./nframes;
    stats.probclosetoB = length( find( stats.distfromB <= closethresh ) )./nframes;
end   


f3 = figure;
subplot(2, 2, 1)
    bar(stats.distfromctrbins, stats.distfromctrpdf); hold on
    plot(stats.distfromctrbins, stats.distfromctrcdf.*max(stats.distfromctrpdf)); hold on
    set(gca, 'xlim', bins([1,end]))
    box off
    xlabel('Distance from Center (pixels)')
    ylabel('Probablity')
subplot(2, 2, 2)
    bar([1 2], [stats.pct_time_near_wall 1-stats.pct_time_near_wall])
    text(1, 0.5.*stats.pct_time_near_wall, num2str(stats.pct_time_near_wall, 2), 'color', 'w', 'fontname', 'times', 'fontsize', 18, 'horiz', 'center')
    text(2, 0.5.*[1-stats.pct_time_near_wall], num2str(1-stats.pct_time_near_wall, 2), 'color', 'w', 'fontname', 'times', 'fontsize', 18, 'horiz', 'center')
    set(gca, 'xlim', [0,3])
    box off
    set(gca, 'xtick', [1 2], 'xticklabel', strvcat('Near Wall', 'Open Field'))
    ylabel('% Time')
if taskparams.TrialPhaseNum ~= 1
subplot(2, 2, 3)
  	b = bar(stats.distfromAbins, [stats.distfromApdf',stats.distfromBpdf']); hold on
    b(1).FaceColor = [0 0 0.5];     b(1).EdgeColor = [0 0 0.5];
    b(2).FaceColor = [1 0.25 0.25]; b(2).EdgeColor = [0.5 0.25 0.25];
    mx = max([stats.distfromApdf(:); stats.distfromBpdf(:)]);
  	b = plot(stats.distfromAbins, [stats.distfromAcdf',stats.distfromBcdf'].*mx); hold on
    set(gca, 'xlim', stats.distfromAbins([1,end]))
    box off
    xlabel('Distance from Objects (pixels)')
    ylabel('Probablity (or nCDF)')
    lg = legend('Obj A', 'Obj B'); lg.Box = 'off';
subplot(2, 2, 4)
    bar([1 2], [stats.probclosetoA stats.probclosetoB], 'facecolor', 0.75.*[1 1 1])
    text(1, 0.5.*stats.probclosetoA, num2str(stats.probclosetoA, 2), 'color', 'b', 'fontname', 'times', 'fontsize', 18, 'horiz', 'center')
    text(2, 0.5.*stats.probclosetoB, num2str(stats.probclosetoB, 2), 'color', 'r', 'fontname', 'times', 'fontsize', 18, 'horiz', 'center')
    set(gca, 'xlim', [0,3])
    box off
    set(gca, 'xtick', [1 2], 'xticklabel', strvcat('Object A', 'Object B'))
    ylabel('% Time Near Object')    
    figtitle = ['Distance moved = ' num2str(taskparams.DistMoved) ' cm'];
    tit = title(figtitle);
    if taskparams.ObjectMovedNum == 1; 
        set(tit, 'color', 'b')
    else
        set(tit, 'color', 'r')
    end
end    
axes('units', 'norm', 'pos', [0 0 1 1])
axis off
text(0.5, 0.975, figlabel, 'fontname', 'times', 'fontsize', 18, 'horiz', 'center')


%% Save data
disp('Writing figures to disk')
    % print(f1, [videofilename '.traj.raw.png'], '-dpng')
    print(f2, [videofilespec '.traj.png'], '-dpng')
    print(f3, [videofilespec '.stats.png'], '-dpng')

disp('Writing screencap video to disk')
    %open(screencapObj)
    writeVideo(screencapObj,screencapdata); 
    close(screencapObj);

disp('Writing summary matfile to disk')
    summary.geom = geom;
    summary.stats = stats;
    summary.taskparams = taskparams;
    summary.traj.x = x;
    summary.traj.y = y;
    summary.traj.cleanx = cleanx;
    summary.traj.cleany = cleany;
    
    if humanTracking 
        summary.traj.humanTrackedX = humanTrackedX;
        summary.traj.humanTrackedY = humanTrackedY;
    end
    
    summary.vid.videopath     = videopath;
    summary.vid.videofilename = videofilename;
    summary.vid.vidWidth    = vidWidth;
    summary.vid.vidHeight    = vidHeight;
    summary.vid.maxframe    = maxframe;
    summary.vid.nframes     = nframes;

    save( [videofilespec '.summary.mat'], 'summary' )
    TrackObjOutput = summary;


%sound(fliplr(sndwave))
disp('DONE')
