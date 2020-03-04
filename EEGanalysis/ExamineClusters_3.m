%% Examine SA & KA IIS data and clustering.

clear all
close all

cd('/Users/jonesmat/Documents/DATA/Antoine/FalconHawk IIS & PatchClamp Comparisons')
basedir = pwd;

disp('Loading...')
tic
    load('matlab.mat')
toc



%% Analysis Parameters
ds = 2;                 % binwidth (in units of PC axes)
kernel_sigma = 2;       % SD of gaussian filtering kernel
matsaveflag = 0;     	% whether to save all data as a matfile plus figs (large matfile, Gbytes)
figsaveflag = 1;        % whether to write figs
summarysaveflag = 1;    % whether to save summary data as a matfile





scattercolors                   = zeros(size(pcadata,1),3); % Specify scaterplot colors
scattercolors(find(SAind),:)    = repmat( [0 0 0], length(find(SAind)), 1);
scattercolors(KAind,:)          = repmat( [1 0 0], length(find(KAind)), 1);

 %{   

%% plot cluster centroids to see how stable they are..
% clusterNumber = 15; 
clusterNumber = nclusts(1); 

disp('Displaying...')
figure('units', 'inch', 'pos', [0 1 10.5 7.5], 'name', 'Eigenvectors_&_Cluster_Centroids');
subplot(1,2,1)
    plot( [2.*PCA.V(:,1)+1, 2.*PCA.V(:,2)+2, 2.*PCA.V(:,3)+3] );
    box off
    axis square
    ylabel('Eigenvectors')
    set(gca, 'ytick', [1:3])
subplot(1,2,2)
    clear datacloud
    for i = 1:size(optimizationOutput, 2)
        if optimizationOutput(i).nClusters == clusterNumber
            datacloud{i} = [optimizationOutput(i).gm.mu(:,1), optimizationOutput(i).gm.mu(:,2), optimizationOutput(i).gm.mu(:,3)];
        end
    end
    allpoints = cat(1, datacloud{:});   % bad name. allpoints are the centroids from GM fitting to the PCA data.
    scatter3(allpoints(:,2), allpoints(:,1), allpoints(:,3), 3, allpoints(:,1) + allpoints(:,3), 'filled') 
    grid on
    hold on
    colormap('redgreenblue')
    rotate3d on
    axis equal
    view(60,40)
%     view(3)
    xlabel('PC 1')
    ylabel('PC 2')
    zlabel('PC 3')
    set(gca, 'xlim', [-100 50], 'ylim', [-60 40], 'zlim', [-60 60])
    title('Fitted Centroids')
disp('...Done')

%}

% Bin data in 3D and estimate probability densities
levels = [1:5];
cmap = jet(length(levels));
cmap = [nan nan nan; cmap];

% vectors of bin starts
xbins = [ min(pcadata(:,1)) : ds : max(pcadata(:,1)) ];
ybins = [ min(pcadata(:,2)) : ds : max(pcadata(:,2)) ];
zbins = [ min(pcadata(:,3)) : ds : max(pcadata(:,3)) ];




% All Points from SA & KA (an estimate of the PRIOR distribution, DP)
% Accumulate the 3D histogram
    rawdata = pcadata;
    groupcolors = scattercolors ;
    [DP edges mid loc] = histcn(rawdata, xbins, ybins, zbins); % see MatlabCentral for histcn
% Filter 
   % DP = imgaussfilt3(DP,kernel_sigma);
% Normalize to a PDF
   % DP = DP./nansum(DP(:));
   DP = DP./(totalHoursKA+totalHoursSA);
   
   %{
% Create a meshgrid (watch out for X/Y swapping)
    [X, Y, Z] = meshgrid(mid{2}, mid{1}, mid{3});   % Note reversal of X & Y to make dims match in display commands
% Draw & make pretty
    figure('units', 'inch', 'pos', [0 0 10.5 7.5], 'name', 'All_Points_Density_(Prior_Distribution)');
        sl = slice(X,Y,Z,DP, ybins(1:5:end), xbins(1:5:end), ybins(1:5:end)); hold on % Note XY swapping
            for n = 1:length(sl)
                sl(n).FaceAlpha = 'flat';
                sl(n).AlphaData = normalize( sl(n).CData.^.8, 'scale' ).^0.8;
            end
            shading interp
        sc = scatter3(rawdata(:,2), rawdata(:,1), rawdata(:,3), 3, groupcolors, 'filled') ; % Note XY swapping
            colormap(white2jet)
            axis equal
            axis vis3d
            view(60, 40)
    set(gca, 'xlim', [-100 50], 'ylim', [-60 40], 'zlim', [-60 60])            
    coordlabels
    rotate3d on
    title('All Points (Prior Distribution)')

    %}

% Points from Saline-Treated Animals (Prob of SA)
% Accumulate the 3D histogram
    rawdata = pcadata(SAind,:);
    groupcolors = scattercolors(SAind,:) ;    
    [DSA edges mid loc] = histcn(rawdata, xbins, ybins, zbins); % see MatlabCentral for histcn
% Filter 
    %DSA = imgaussfilt3(DSA,kernel_sigma);
% Normalize to a PDF
    %DSA = DSA./nansum(DSA(:));
    DSA = DSA./totalHoursSA;
    
    %{
% Create a meshgrid (watch out for X/Y swapping)
    [X, Y, Z] = meshgrid(mid{2}, mid{1}, mid{3});   % Note reversal of X & Y to make dims match in display commands
% Draw & make pretty
    figure('units', 'inch', 'pos', [6 0 10.5 7.5], 'name', 'Saline_Density');
        sl = slice(X,Y,Z,DSA, ybins(1:5:end), xbins(1:5:end), ybins(1:5:end)); hold on % Note XY swapping
            for n = 1:length(sl)
                sl(n).FaceAlpha = 'flat';
                sl(n).AlphaData = 0.1.*normalize( sl(n).CData, 'scale' ).^0.8;
            end
            shading interp
        sc = scatter3(rawdata(:,2), rawdata(:,1), rawdata(:,3), 3, groupcolors, 'filled') ; % Note XY swapping
            colormap(white2jet)
            axis equal
            axis vis3d
            view(60, 40)   
    set(gca, 'xlim', [-100 50], 'ylim', [-60 40], 'zlim', [-60 60])            
    coordlabels
    rotate3d on
    title('Saline Points')
    
    %}
% Points from Kainate-Treated Animals (Prob of KA)
% Accumulate the 3D histogram
    rawdata = pcadata(KAind,:);
    groupcolors = scattercolors(KAind,:) ;    
    [DKA edges mid loc] = histcn(rawdata, xbins, ybins, zbins); % see MatlabCentral for histcn
% Filter 
    DKA = imgaussfilt3(DKA,kernel_sigma);
% Normalize to a PDF
   % DKA = DKA./nansum(DKA(:));
    DKA = DKA./totalHoursKA;
% Create a meshgrid (watch out for X/Y swapping)

[X, Y, Z] = meshgrid(mid{2}, mid{1}, mid{3});   % Note reversal of X & Y to make dims match in display commands
%{
% Draw & make pretty
    figure('units', 'inch', 'pos', [12 0 10.5 7.5], 'name', 'Kainate_Density');
        sl = slice(X,Y,Z,DKA, ybins(1:5:end), xbins(1:5:end), ybins(1:5:end)); hold on % Note XY swapping
            for n = 1:length(sl)
                sl(n).FaceAlpha = 'flat';
                sl(n).AlphaData = 0.1.*normalize( sl(n).CData, 'scale' ).^0.8;
            end
            shading interp
        sc = scatter3(rawdata(:,2), rawdata(:,1), rawdata(:,3), 3, groupcolors, 'filled') ; % Note XY swapping
            colormap(white2jet)
            axis equal
            axis vis3d
            view(60, 40)   
    set(gca, 'xlim', [-100 50], 'ylim', [-60 40], 'zlim', [-60 60])            
    coordlabels
    rotate3d on
    title('Kainate Points')    


%}

%{
%% Ratio of Kainate to Total (DRTot)
    rawdata = pcadata;
    groupcolors = scattercolors ;        
    [DKA edges mid loc] = histcn(rawdata(KAind,:), xbins, ybins, zbins); % see MatlabCentral for histcn
    
% Compute the ratio of KA to Total (DRTot)
    DRTot = DKA./(DSA+DKA);
    DRTot(isnan(DRTot(:))) = 0;             % set NaNs to zero
%     DRTot_log = log10(DRTot);               % take the log (because the spread is on order of 10^8)
%     DRTot_log( isinf(DRTot_log(:)) ) = 0;	% set -Infs to zero

%}

%{
% Create a meshgrid (watch out for X/Y swapping)
    [X, Y, Z] = meshgrid(mid{2}, mid{1}, mid{3});   % Note reversal of X & Y to make dims match in display commands
% Draw & make pretty
    figure('units', 'inch', 'pos', [9 3 10.5 7.5], 'name', 'Kainate_to_Total_Density');
        sl = slice(X,Y,Z,DRTot, ybins(1:5:end), xbins(1:5:end), ybins(1:5:end)); hold on % Note XY swapping
%         sl = slice(X,Y,Z,DRTot_log, ybins(1:5:end), xbins(1:5:end), ybins(1:5:end)); hold on % Note XY swapping
            for n = 1:length(sl)
                sl(n).FaceAlpha = 'flat';
                sl(n).AlphaData = 0.1.*normalize( sl(n).CData, 'scale' ).^0.8;
            end
            shading interp
        sc = scatter3(rawdata(:,2), rawdata(:,1), rawdata(:,3), 1, 'm', 'filled') ; hold on % Note XY swapping
            colormap(white2jet)
            axis equal
            axis vis3d
            view(60, 40)   
%         scatter3(allpoints(:,2), allpoints(:,1), allpoints(:,3), 10, 'm', 'filled') 
    set(gca, 'xlim', [-100 50], 'ylim', [-60 40], 'zlim', [-60 60])
    coordlabels
    rotate3d on
    title('Kainate/(Kainate+Saline)')    
    colorbar

    %}
% Ratio of Kainate to Saline (Odds Ratio, DROdds)

% Compute the ratio    
    DROdds = DKA./DSA;
    
    %DROdds(isnan(DROdds(:))) = 0;           % set NaNs to zero
    %DROdds(isinf(DROdds(:))) = 1;           % set Infs to one
    
    
    
    %{
    % set Infs to one
    DROdds_log = log10(DROdds);             % take the log (because the spread is on order of 10^8)
    DROdds_log( isinf(DROdds_log(:)) ) = 0;	% set -Infs to zero
    
    
% Create a meshgrid (watch out for X/Y swapping)
    [X, Y, Z] = meshgrid(mid{2}, mid{1}, mid{3});   % Note reversal of X & Y to make dims match in display commands
% Draw & make pretty
    figure('units', 'inch', 'pos', [9 9 10.5 7.5], 'name', 'Kainate_to_Saline_Density_(Odds_Ratio)');
        sl = slice(X,Y,Z,DROdds_log, ybins(1:5:end), xbins(1:5:end), ybins(1:5:end)); hold on % Note XY swapping
            for n = 1:length(sl)
                sl(n).FaceAlpha = 'flat';
                sl(n).AlphaData = 0.1.*normalize( sl(n).CData, 'scale' ).^0.8;
            end
            shading interp
        sc = scatter3(rawdata(:,2), rawdata(:,1), rawdata(:,3), 1, 'm', 'filled') ; hold on % Note XY swapping
            colormap(white2jet)
            axis equal
            axis vis3d
            view(60, 40)   
%         scatter3(allpoints(:,2), allpoints(:,1), allpoints(:,3), 10, 'm', 'filled') 
    set(gca, 'xlim', [-100 50], 'ylim', [-60 40], 'zlim', [-60 60])
    coordlabels
    rotate3d on
    title('log10( Kainate/Saline ) (Odds Ratio)')    
    colorbar    
    
    
    
    
drawnow 

    %}
    
% Make Summary
Summary.PCA                      = PCA;
%Summary.fitted_centroids         = allpoints;
Summary.pcadata                  = pcadata;
Summary.Voxels.X                        = X;
Summary.Voxels.Y                        = Y;
Summary.Voxels.Z                        = Z;
Summary.Voxels.DP                       = DP;
Summary.Voxels.DS                       = DSA;
Summary.Voxels.DKA                      = DKA;
%Summary.Voxels.DRTot                    = DRTot;
Summary.Voxels.DROdds                   = DROdds;
Summary.Voxels.bincenters            	= mid;
Summary.Voxels.binedges                 = edges;
    disp('Finding voxel child points')
    tic    
    len = 0;
    dummy = [];    
    allbincenters = combvec( Summary.Voxels.bincenters{1}, Summary.Voxels.bincenters{2}, Summary.Voxels.bincenters{3} )';
        % knnsearch works, but takes 1.2 hours    
        %     for n = 1:size(pcadata,1)
        %        idx(n) = knnsearch(allbincenters, pcadata(n,:)); 
        %     end

    %}
    
% this is pretty fast (30 sec) and low on memory consumption, by breaking it up into
% smaller blocks
disp('Finding parent voxels of each data point')
step = 1000;
count = 1;
idx = zeros(size(pcadata,1), 1);
tic
    while count <= size(pcadata,1)
        bns = count:count+step-1;
        bns(find(bns>size(pcadata,1))) = [];
        dummy = pdist2( pcadata(bns,:), allbincenters );
        [~, idx(bns)] = min(dummy');
        whos allbincenters pcadata distmat idx bns
        disp('Finding parent voxels...')
        count = bns(end) + 1;
    toc        
    end
    disp('Done')

Summary.Voxels.voxel_centers        = allbincenters;
Summary.Points.xyz_loc              = pcadata;
Summary.Points.parent_voxel_idx   	= idx;
Summary.Points.parent_voxel_ctr   	= Summary.Voxels.voxel_centers(Summary.Points.parent_voxel_idx, :);
Summary.Points.DP                   = DP(Summary.Points.parent_voxel_idx);
Summary.Points.DSA                 	= DSA(Summary.Points.parent_voxel_idx);
Summary.Points.DKA                 	= DKA(Summary.Points.parent_voxel_idx);
%Summary.Points.DRTot              	= DRTot(Summary.Points.parent_voxel_idx);
Summary.Points.DROdds              	= DROdds(Summary.Points.parent_voxel_idx);

    figure('units', 'inch', 'pos', [9 9 10.5 7.5], 'name', 'Pointwise_Probabilities');
    subplot(2,2,1)
        scatter3(Summary.Points.xyz_loc(:,1), Summary.Points.xyz_loc(:,2), Summary.Points.xyz_loc(:,3), 1, Summary.Points.DP)
        title('DP')
    subplot(2,2,2)
        scatter3(Summary.Points.xyz_loc(:,1), Summary.Points.xyz_loc(:,2), Summary.Points.xyz_loc(:,3), 1, Summary.Points.DSA)
        title('DSA')
    subplot(2,2,3)
        scatter3(Summary.Points.xyz_loc(:,1), Summary.Points.xyz_loc(:,2), Summary.Points.xyz_loc(:,3), 1, Summary.Points.DKA)
        title('DKA')
   % subplot(2,3,4)
       % scatter3(Summary.Points.xyz_loc(:,1), Summary.Points.xyz_loc(:,2), Summary.Points.xyz_loc(:,3), 1, log10(Summary.Points.DRTot))
       % title('log10(DRTot)')
    subplot(2,2,4)
        scatter3(Summary.Points.xyz_loc(:,1), Summary.Points.xyz_loc(:,2), Summary.Points.xyz_loc(:,3), 1, Summary.Points.DROdds)
        title('log10(DROdds)')


%% Output
if figsaveflag
    disp('Saving figs')
    figdir = [basedir filesep 'Output' filesep 'Figures'];
    mkdir(figdir);
    figh = findobj('type', 'fig');
    for n = 1:length(figh)
        figure(figh(n))
        outfilespec = [figdir filesep get(gcf, 'name') '.png']
        print(outfilespec, '-dpng')
    end
end

if summarysaveflag
    disp('Saving summary')
    sumdir = [basedir filesep 'Output' filesep 'Matlab_Data' filesep 'Summary'];
    mkdir(sumdir)
    save([sumdir filesep 'Summary.mat'], 'Summary')
end    

if matsaveflag
    disp('Saving all (be patient)')    
    matdir = [basedir filesep 'Output' filesep 'Matlab_Data'];
    save([matdir filesep 'AllData.mat'])
end

disp('Done with all.')
load handel
sound(y, Fs)

    
    
    
    
    
    