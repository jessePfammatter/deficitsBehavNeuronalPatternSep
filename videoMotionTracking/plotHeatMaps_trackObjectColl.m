function [ output_args ] = plotHeatmaps_trackObjectColl( heatmapObject, T, dumInd, videoPath, yLabel, main )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% plot for plotting Saline vs. KA
tempData = heatmapObject(dumInd)';
tempTrt = T.treatment(dumInd);
forPlot.Saline = tempData(find(strcmp(tempTrt, 'Saline')));
forPlot.KA = tempData(find(strcmp(tempTrt, 'KA')));


% calculate the mean for the heatmaps..
meanSaline = forPlot.Saline(1).fN;
for i = 2:length(temp)
    meanSaline = meanSaline + forPlot.Saline(i).fN;
end
meanSaline = meanSaline ./length(forPlot.Saline);


figure('units', 'inch', 'pos', [8 8 15 8]);

subplot(1,3,1)
    imagesc(xx, yy, fN_mean', 'alphadata', 0.4); 
    axes('units', 'norm', 'pos', [0 0 1 1])
    axis off

clear forPlot

% side vs. overhead lighting
tempData = yVariable(dumInd)';
tempTrt = T.lighting(dumInd);
forPlot.overheadLighting = tempData(find(strcmp(tempTrt, 'overhead')));
forPlot.sideLighting = tempData(find(strcmp(tempTrt, 'side')));

subplot(1,3,2)
    imagesc(xx, yy, fN_mean', 'alphadata', 0.4); 
    axes('units', 'norm', 'pos', [0 0 1 1])
    axis off
    title(main)

clear forPlot

% every group of animals separately
tempData = yVariable(dumInd)';
tempTrt = T.group(dumInd);
forPlot.onefourb = tempData(find(strcmp(tempTrt, '1-4b')));
forPlot.onefivea = tempData(find(strcmp(tempTrt, '1-5a')));
forPlot.onefiveb = tempData(find(strcmp(tempTrt, '1-5b')));

subplot(1,3,3)
    imagesc(xx, yy, fN_mean', 'alphadata', 0.4); 
    axes('units', 'norm', 'pos', [0 0 1 1])
    axis off

figname = [videoPath 'figure/' main '.tif'];
print(figname, '-dtiff', '-r300')

clear forPlot
close all

end

