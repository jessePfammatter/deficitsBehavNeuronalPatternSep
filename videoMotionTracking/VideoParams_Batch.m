clear
close all

% alert soundwave params (used later in code)
t=0:0.001:2;                    % 2 secs @ 1kHz sample rate
y=chirp(t,0,1,150);             % Start @ DC, cross 150Hz at t=1sec
sndwave = y./10;
 
defaultfig
close(gcf)

% process video files to get geometry of the arena, location of objects, which one is on camera-side, which was moved and mouse starting point.

% *** (note: All videos should be already processed in quicktime
% such that they are divided by phase of 3 minutes and objects are on the bottom of the screen. 
% The camera is the only stable referential across our experiments. Left
% and Right notations in the .csv file are inconsistent from one cohort to
% the other but consistent for a given cohort. ***

CohortFolders; % contains "cohort", a cell array of length n with n paths corresponding to the n cohorts folders. 

for n = 1:length(cohort) %loop[ through cohorts
    
        cd(cohort{n});
        D = dir;
        D = D(~ismember({D.name}, {'.', '..', '.DS_Store', 'Figures'}));
        
            for k = 1:length(D) % loop through weeks
                
                subDir = fullfile(D(k).folder , D(k).name);
                cd(subDir); % go into subfolder
                Videos = dir('*.mov'); 
                
                for l = 1:length(Videos) % loop through videos
                  
                    videofilename = Videos(l).name;
                    videopath = Videos(l).folder;
                    videofilespec = fullfile(videopath , videofilename);
 
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
                    sound(sndwave)
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
                   sound(sndwave)
                   uiwait(msgbox('Double click the starting location of the mouse', 'Select Mouse Location', 'modal'));
                   [x, y] = getpts(gca);
                   geom.mouseStart = [x y];  clear x y
                   plot(geom.mouseStart(1), geom.mouseStart(2), 'dr')

                    % Query task parameters: phase, object location and side, side of the moved object
                        sound(sndwave)
                        options.videofilespec = videofilespec;
                        taskparams = querytaskparams(options);   % Call GUI for user input
                        figlabel = [videofilename ' - Phase ' num2str(taskparams.TrialPhaseNum)] ;
                        if strcmp(taskparams.TrialPhase, '3 - Object Moved') || strcmp(taskparams.TrialPhase, '2 - Objects Centered')
                            success = 0;
                            while ~success
                                figure(f1)
                                sound(sndwave)
                                uiwait(msgbox('First click on object opposite to camera-side, then double-click on camera-side object ','Select Objects','modal'));
                                [x, y] = getpts(gca);
                                if length(x)==2
                                    success = 1;
                                    geom.ObjPos = [x y]; % second point -- i.e. (x(2),y(2)) -- is the camera-side object
                                    plot(geom.ObjPos(1,1), geom.ObjPos(1,2), 'og'); %non-camera-side
                                    plot(geom.ObjPos(2,1), geom.ObjPos(2,2), 'sg'); %camera-side object
                                end
                            end
                        end

                                     
                    % save data for this video file
                    disp('Writing figure to disk')
                    print(f1, [videofilename '.ScrnCapGeom.png'], '-dpng')
                    
                    disp('Writing summary matfile to disk')
                        summary.geom = geom; 
                        summary.taskparams = taskparams;
                        summary.vid.videofilespec    = videofilespec;
                        summary.vid.videopath     = videopath;
                        summary.vid.videofilename = videofilename;
                        summary.vid.vidWidth    = vidWidth;
                        summary.vid.vidHeight    = vidHeight;
                        summary.vid.maxframe    = maxframe;

                        save( [videofilespec '.VideoParams.mat'], 'summary' )
                        TrackObjOutput = summary;


                    sound(fliplr(sndwave))
                    disp('DONE')
                    
                end

            end
end
    
   

