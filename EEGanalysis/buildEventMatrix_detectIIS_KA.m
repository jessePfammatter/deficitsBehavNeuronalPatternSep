storageLocationBase = '/Volumes/cookieMonster/mj1lab_mirror';
load(strcat(storageLocationBase, '/falconHawk/EEG_data/masterDataFrame_KA.mat'), 'masterDataFrame');

%%

% make the event Matrix.
clear eventMatrix durations eventStart eventFilespec animalID recordDay recordLength treatment drugTrt
counter = 1;
fs = 512; % I set this as a hard variable here because I've converted everything below to 512Hz
padder = fs;

for i = 1:size(masterDataFrame, 2)
    if masterDataFrame(i).didProcess == 1
        clear outdata
        load(masterDataFrame(i).dataStorageSpec)
        disp( strcat(num2str(i), {' of '}, num2str(length(masterDataFrame))))
        disp('Data Loaded.')
        if isfield(outdata, 'normSignal')
            disp('File Processing...')
            
            % calculate wavelet decomposition
            DC = 4;
            [C,L]  = wavedec(outdata.normSignal,DC,'db4');
            L2 = [0; L];
            Decomp = C(1:L(1));

    
            for j = 1:size(masterDataFrame(i).output.starts, 2)
                if masterDataFrame(i).output.starts(j) > padder & masterDataFrame(i).output.starts(j) < size(outdata.normSignal, 1) - padder
                    eventMatrix(:,counter) = outdata.normSignal(masterDataFrame(i).output.starts(j)-padder:masterDataFrame(i).output.starts(j)+padder);
                    %eventEMGMatrix(:,counter) = outdata.normEMG(masterDataFrame(i).output.starts(j)-padder:masterDataFrame(i).output.starts(j)+padder);
                    durations(counter) = masterDataFrame(i).output.durations(j);            
                    eventStart(counter, :) = masterDataFrame(i).output.starts(j);
                    eventFilespec{counter} = masterDataFrame(i).edffilespec;
                    animalID{counter} = masterDataFrame(i).uniqueID;
                    recordDay(counter) = masterDataFrame(i).day;
                    recordLength(counter) = size(outdata.normSignal, 1);
                    treatment{counter} = masterDataFrame(i).treatment;
                    
                    % build event Matrix for decomposed Signal
                    eventMatrix_DB4(:, counter) = C(((masterDataFrame(i).output.starts(j)-fs)/16):((masterDataFrame(i).output.starts(j)+fs)/16));
                                
                    counter = counter + 1;     
                end
            end
            

            disp('File Processing Complete.')
        end
    else
        disp( strcat(num2str(i), {' of '}, num2str(length(masterDataFrame))))
        disp('File Skipped Due to Poor Quality.')
    end
end
eventMatrix = eventMatrix';
eventMatrix_DB4 = eventMatrix_DB4';
%eventEMGMatrix = eventEMGMatrix';
eventMatrixSummary = table(durations', eventStart, eventFilespec', animalID', recordDay', recordLength', treatment');
eventMatrixSummary.Properties.VariableNames = {'durations', 'eventStart', 'eventFilespec', 'animalID', 'recordDay', 'recordLength', 'treatment'};

% only keep the events shorter than 200ms       
eventMatrix = eventMatrix(durations <= (fs / 1 / 5), :);
eventMatrix_DB4 = eventMatrix_DB4(durations <= (fs / 1 / 5), :);
%eventEMGMatrix = eventEMGMatrix(durations <= (fs / 1 / 5), :);
eventMatrixSummary = eventMatrixSummary(durations <= (fs / 1 / 5),:);

save(strcat(storageLocationBase, '/falconHawk/EEG_data/eventMatrixKA.mat'), 'eventMatrix', 'eventMatrix_DB4', 'eventMatrixSummary', '-v7.3')

