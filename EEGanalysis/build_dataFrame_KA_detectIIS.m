
% build TBI masterDataFrame
%clear animal masterDataFrame dataFrame

% load the namefile
falconHawk_namefile_CURRENT

counter = 1;    
% build master data frame
for i = 1:length(animal)
    for j = 1:size(animal(i).day, 2)
        if exist(animal(i).day(j).edffilespec, 'file') > 0

                % assign variables to the masterDataFrame
                masterDataFrame(counter).cohort = animal(i).cohort;
                animal(i).cohort
                masterDataFrame(counter).day = j;
                j
                masterDataFrame(counter).edffilespec = animal(i).day(j).edffilespec;
                animal(i).day(j).edffilespec
                masterDataFrame(counter).treatment = animal(i).treatment;
                masterDataFrame(counter).treatmentDate = animal(i).treatmentDate;
                masterDataFrame(counter).DOB = animal(i).DOB;
                masterDataFrame(counter).uniqueID = animal(i).uniqueID;
                animal(i).uniqueID
                masterDataFrame(counter).sex = animal(i).sex;
                masterDataFrame(counter).strain = animal(i).strain;
                masterDataFrame(counter).channel = animal(i).day(j).channel;
                masterDataFrame(counter).analyzeEEG = animal(i).day(j).analyzeEEG;


                %{
                % no sleep data for these animals
                if isfield(animal(i).day(j), 'sleepScore')
                    masterDataFrame(counter).humanSleepScore = animal(i).day(j).sleepScore;
                else
                    masterDataFrame(counter).humanSleepScore = [];
                end
                %}
                
                % increment the counter
                counter = counter + 1;
            end

    end
end

for counter = 1:length(masterDataFrame)
    cohortList{counter} = masterDataFrame(counter).cohort;
end

uniqueCohortList = unique(cohortList);

%
for i = 1:size(masterDataFrame, 2)
    masterDataFrame(i).didProcess = [];
end


%% build a newer and better method for processing and storing these data.

for i = 1:size(masterDataFrame, 2)

    disp( strcat(num2str(i), {' of '}, num2str(length(masterDataFrame))))
    [path] = fileparts(masterDataFrame(i).edffilespec);
    masterDataFrame(i).dataStorageSpec = strcat(path, filesep, masterDataFrame(i).uniqueID, '_day', num2str(masterDataFrame(i).day), '.mat');

    if ~isempty(masterDataFrame(i).didProcess)
        if masterDataFrame(i).didProcess == 1
            dontSkipMe = 0;
        else
            dontSkipMe = 1;
        end
    else
        dontSkipMe = 1;
    end
    
    if masterDataFrame(i).analyzeEEG == 1
        %if ~exist(masterDataFrame(i).dataStorageSpec)
        if dontSkipMe == 1

            [header] = edfread(masterDataFrame(i).edffilespec);
            targetSignal = masterDataFrame(i).channel; % this is an important step since xltec rearranges the order of signals, set it as empty to start

            if ~isempty(targetSignal)
                disp('Signal Found!')
                [header, signal] = edfread(masterDataFrame(i).edffilespec,'targetSignals',targetSignal);
                masterDataFrame(i).fs = header.frequency(1);
                masterDataFrame(i).original_fs = header.frequency(1);
   
                % downsample the EEG data to 512 if larger to start with and upsample to 512 if smaller
                if masterDataFrame(i).fs > 1023 && masterDataFrame(i).fs < 1025
                    divisionFactor = 2;
                    signal = downsample(signal, divisionFactor);
                    masterDataFrame(i).fs = masterDataFrame(i).fs / divisionFactor;
                elseif masterDataFrame(i).fs > 255 && masterDataFrame(i).fs < 257
                    multFactor = 2;
                    signal = interp(signal, multFactor);
                    masterDataFrame(i).fs = masterDataFrame(i).fs * multFactor;
                end

                % normalize signal
                [normSignal, masterDataFrame(i).sig, masterDataFrame(i).modelfit, masterDataFrame(i).mu] = normalizeEEG(signal, masterDataFrame(i).fs);
                normSignal = normSignal';
                outdata.signal = signal;
                outdata.normSignal = normSignal;

                % calculate the amount of noise left in the signal
                fs = masterDataFrame(i).fs;
                T = 1/fs;                       % Sampling period       
                L = size(normSignal, 1);  % Length of signal
                t = (0:L-1)*T;                  % Time vector
                Y = fft(normSignal);
                P2 = abs(Y/L);
                P1 = P2(1:L/2+1); 
                P1(2:end-1) = 2*P1(2:end-1);
                f = fs*(0:(L/2))/L;

                masterDataFrame(i).at180 = sum(P1(find(round(f) == 180))); % find the value at 120 Hz
                masterDataFrame(i).at120 = sum(P1(find(round(f) == 120))); % find the value at 120 Hz
                masterDataFrame(i).at4 = sum(P1(find(round(f) == 4))); % find the value at 4 Hz
                masterDataFrame(i).ratio120to4 = masterDataFrame(i).at120 / masterDataFrame(i).at4;
                masterDataFrame(i).ratio180to4 = masterDataFrame(i).at180 / masterDataFrame(i).at4;

                masterDataFrame(i).rms_signal = rms(normSignal);
                %masterDataFrame(i).rms_fft = rms(P1);


                if masterDataFrame(i).modelfit >= .90 && masterDataFrame(i).ratio180to4 < .5 && masterDataFrame(i).at4 > 20

                    masterDataFrame(i).didProcess = 1;

                    % filter the data again if it passes criteria
                    outdata.normSignal = oneTwentyHzFilt_EEG(outdata.normSignal,  masterDataFrame(i).fs);


                    % detect and store events
                    masterDataFrame(i).output = detectEvents_IIS(outdata.normSignal, masterDataFrame(i).fs);
                    outdata.eventDetection = masterDataFrame(i).output;
                    disp('High Amplitude Events Found and Stored!')

                    % add EMG signal
                    [header] = edfread(masterDataFrame(i).edffilespec);
                    targetSignal = find(strcmp(header.label, strcat('EMGR', num2str( masterDataFrame(i).channel)))); % this is an important step since xltec rearranges the order of signals
                    if ~isempty(targetSignal)
                        [~, EMG] = edfread(masterDataFrame(i).edffilespec,'targetSignals',targetSignal);
                        
                         % downsample the EEG data to 512 if larger to start with and upsample to 512 if smaller
                        if masterDataFrame(i).original_fs > 1023 && masterDataFrame(i).original_fs < 1025
                            divisionFactor = 2;
                            EMG = downsample(EMG, divisionFactor);
                        elseif masterDataFrame(i).original_fs > 255 && masterDataFrame(i).original_fs < 257
                            multFactor = 2;
                            EMG = interp(EMG, multFactor);
                        end
                
                        outdata.emgSignal = EMG;
                        outdata.normEMG = normalizeEEG(outdata.emgSignal, masterDataFrame(i).fs);
                        disp('EMG Found and Stored!')
                    end
                else
                    masterDataFrame(i).didProcess = 0;
                    disp('EMG and High Amplitude Event Processing Skipped Due to Poor Data.')
                end

                % save the file for each animal/day combination
                outdata.masterDataPull = masterDataFrame(i);


                save(masterDataFrame(i).dataStorageSpec, 'outdata', '-v7.3') 
                clear outdata
            end
        end
    end
end

%%
save(strcat(storageLocationBase, '/falconHawk/EEG_data/masterDataFrame_KA.mat'), 'masterDataFrame', '-v7.3');

%{
%%

for w = 3%:size(uniqueCohortList, 2)
    
    dataFrame = masterDataFrame(strcmp(cohortList, uniqueCohortList(w)));
    
    for counter = 1:100
        disp( strcat(num2str(counter), {' of '}, num2str(length(dataFrame)), {' from Cohort '}, uniqueCohortList(w)))
        [header] = edfread(dataFrame(counter).edffilespec);
        targetSignal = []; % this is an important step since xltec rearranges the order of signals, set it as empty to start
        for ww = 1:size(header.label, 2)
            if contains(header.label(ww), strcat('RF', num2str( dataFrame(counter).channel)))
                targetSignal = ww;
            end
        end
        if ~isempty(targetSignal)
            [header, signal] = edfread(dataFrame(counter).edffilespec,'targetSignals',targetSignal);
            dataFrame(counter).fs = header.frequency(1);

            % normalize signal
            [dataFrame(counter).normSignal, dataFrame(counter).sig, dataFrame(counter).modelfit, dataFrame(counter).mu] = normalizeEEG(signal, dataFrame(counter).fs);
            dataFrame(counter).normSignal = dataFrame(counter).normSignal';
            
            % calculate the amount of noise left in the signal
            fs = dataFrame(counter).fs;
            T = 1/fs;                       % Sampling period       
            L = size(dataFrame(counter).normSignal, 1);  % Length of signal
            t = (0:L-1)*T;                  % Time vector

            Y = fft(dataFrame(counter).normSignal);

            P2 = abs(Y/L);
            P1 = P2(1:L/2+1); 
            P1(2:end-1) = 2*P1(2:end-1);

            f = fs*(0:(L/2))/L;
        
            dataFrame(counter).at180 = sum(P1(find(round(f) == 180))); % find the value at 120 Hz
             dataFrame(counter).at120 = sum(P1(find(round(f) == 120))); % find the value at 120 Hz
             dataFrame(counter).at4 = sum(P1(find(round(f) == 4))); % find the value at 4 Hz
             dataFrame(counter).ratio120to4 =  dataFrame(counter).at120/ dataFrame(counter).at4;
             dataFrame(counter).ratio180to4 =  dataFrame(counter).at180/ dataFrame(counter).at4;

             dataFrame(counter).rms_signal = rms(dataFrame(counter).normSignal);
     
            if dataFrame(counter).modelfit >= .90 && dataFrame(counter).ratio180to4 < .5

                % detect and store events
                dataFrame(counter).output = detectEvents_IIS(dataFrame(counter).normSignal, dataFrame(counter).fs);

                % add EMG signal
                [header] = edfread(dataFrame(counter).edffilespec);
                targetSignal = find(strcmp(header.label, strcat('EMGR', num2str( dataFrame(counter).channel)))); % this is an important step since xltec rearranges the order of signals
                if ~isempty(targetSignal)
                    [~, dataFrame(counter).EMG] = edfread(dataFrame(counter).edffilespec,'targetSignals',targetSignal);
                end
            end
        end
        
        % save an early version becuase it's crapping out somewhere


    end

    % save the matrix
    save(strcat(storageLocationBase, '/TBI/TBIdata_cohort_', uniqueCohortList{w}, 'a.mat'), 'dataFrame', 'animal', '-v7.3');
    disp(strcat({'Finished Cohort: '} , uniqueCohortList(w)))
    

end
%}
