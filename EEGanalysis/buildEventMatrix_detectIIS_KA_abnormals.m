load('/Volumes/cookieMonster/mj1lab_mirror/falconHawk/eeg_data/abnormals/181114abnDataSF4.mat');

%%
% find the abnormals and put them in an event matrix.
clear eventMatrix eventMatrixSummary

fs = 512;
counter = 1;
for i = 1:size(abnData, 2)
    
    % calculate wavelet decomposition
    DC = 4;
    [C,L]  = wavedec(abnData(i).signal,DC,'db4');
    L2 = [0; L];
    Decomp = C(1:L(1));

    for j = 1:size(abnData(i).starts,2)

        if length(abnData(i).signal) > abnData(i).starts(j)+fs & abnData(i).starts(j) > fs
            
            % build the event Matrix from the EEG signal
            eventMatrix(:, counter) = abnData(i).signal(abnData(i).starts(j)-fs:abnData(i).starts(j)+fs);
            eventMatrixSummary(counter).treatment = abnData(i).treatment;
            eventMatrixSummary(counter).fileID = abnData(i).fileID;
            eventMatrixSummary(counter).tracebackNumber = i;
            eventMatrixSummary(counter).recordLength = size(abnData(i).signal, 1);
            
            % build the eventMatrix from the decomposed signal
            eventMatrix_DB4(:, counter) = C(((abnData(i).starts(j)-fs)/16):((abnData(i).starts(j)+fs)/16));
             
            % increment the counter
            counter = counter + 1;
            
        end
    end
end

for i = 1:size(eventMatrixSummary, 2)
    treatment{i} = eventMatrixSummary(i).treatment;
    fileID{i} = eventMatrixSummary(i).fileID;
    tracebackNumber(i) = eventMatrixSummary(i).tracebackNumber;
    recordLength(i) = eventMatrixSummary(i).recordLength;
end

eventMatrixSummary = table(treatment', fileID', tracebackNumber', recordLength', 'VariableNames', {'treatment', 'fileID', 'tracebackNumber', 'recordLength'});


save('/Volumes/cookieMonster/mj1lab_mirror/falconHawk/eeg_data/abnormals/eventMatrix_KA_abnormals.mat', 'eventMatrix', 'eventMatrix_DB4', 'eventMatrixSummary', '-v7.3')