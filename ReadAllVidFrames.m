function mov = ReadAllVidFrames(vidObj, nframes);

videofilename = [vidObj.Path filesep vidObj.Name];

% Get vid properties
disp(['Getting video data from ' videofilename])
vidObj     	= VideoReader(videofilename);
vidWidth    = vidObj.Width;
vidHeight   = vidObj.Height;
maxframe    = vidObj.NumberOfFrames;

% figure('units', 'norm', 'pos', [0 0 1 1])
vidObj          = VideoReader(videofilename);
mov = zeros(vidHeight, vidWidth, 3, nframes, 'uint8') ;
tic
for k = 1:nframes
    if mod(k, 100) == 0;
        disp(['Pre-Reading ' num2str(k) '/' num2str(nframes) '/' num2str(maxframe) ' frames from ' videofilename])
        disp(['     elapsed time ' num2str(toc) ' sec'])
    end
    % Acquire frame for processing
%     mov(:,:,:,k) = readFrame(vidObj);
    mov(:,:,:,k) = read(vidObj, k);

end

% Reinitialize to allow further processing
vidObj          = VideoReader(videofilename);


disp('DONE Pre-reading frames.')

