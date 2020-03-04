function TrackObjOutput = TrackObjectSetup(videofilespec, trackoptions)

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

if nargin == 1
    [videopath videofilename] = fileparts(videofilespec);
    manualparamentry = 0;
elseif ~nargin
%     videopath = '/Users/jonesmat/Desktop/WebcamTests'
%     % videofilename   = 'testmouse.mp4.avi';
%     % videofilename   = '030316PRB.avi';
%     % videofilename       = '030316PRB-18376-21663.mov'
%     % videofilename       = '030316PRB-24670-27375.mov'
%     videofilename       = '030316PRB-30722-33472.mov'
    manualparamentry = 1;
end    
 
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
    videofilespec = [videopath videofilename];
end

screencapname       = [videofilespec '.screencap'];
 
% Get vid properties
disp(['Getting video data from ' videofilespec])
vidObj     	= VideoReader(videofilespec);
vidWidth    = vidObj.Width;
vidHeight   = vidObj.Height;
maxframe    = vidObj.NumberOfFrames;

% Recreate the object to allow further processing
vidObj          = VideoReader(videofilespec);

% Make a screencap video object
screencapObj    = VideoWriter(screencapname, 'MPEG-4');
screencapObj.Quality = 10;
open(screencapObj);




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
disp('Select some points defining the borders  (Double-Click the last point)');
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
   disp('Double click the starting location of the mouse');
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
            disp('First click on OBJECT A (Left-hand), then double-click on OBJECT B (Right-hand)');
            [x, y] = getpts(gca);
            if length(x)==2 & x(2)>x(1)
                success = 1;
                geom.ObjPos = [x y];
            end
        end
    end

save(strcat(videofilename, '_SetupFile.mat'));



disp('DONE')
