addpath 'mrf';
addpath 'mrf_derivatives';
addpath '../../common/';
load('../data/assignmentImageReconstructionPhantom.mat');

global imageKspaceData;
global imageKspaceMask;

%% todo : add sparse acq transform model 

min_rrmse = 10000000;
best_estimate = 0;
best_alpha = 1;
best_gamma = 1;
algorithm = 3;

rough_precision = 0.2;
fine_precision = 0.04;

[best_estimate, min_rrmse, best_alpha, best_gamma] = ...
    applyRangedGradientDescent(0:rough_precision:1, ...
    0:rough_precision:1, best_estimate, min_rrmse, abs(ifft2(imageKspaceData)), ...
    imageNoiseless, algorithm, best_alpha, best_gamma, imageKspaceMask);

display(best_alpha); display(best_gamma);
display(abs(rrmse(imageNoiseless, abs(ifft2(imageKspaceData)))));
display(abs(rrmse(imageNoiseless, best_estimate)));

[best_estimate, min_rrmse, best_alpha, best_gamma] = ...
    applyRangedGradientDescent( ...
    max(0, best_alpha - 0.1):fine_precision:min(best_alpha + 0.1, 1), ...
    max(0, best_gamma - 0.1):fine_precision:min(best_gamma + 0.1, 1), ...
    best_estimate, min_rrmse, abs(ifft2(imageKspaceData)), ...
    imageNoiseless, algorithm, best_alpha, best_gamma, imageKspaceMask);

display(best_alpha); display(best_gamma);
display(abs(rrmse(imageNoiseless, abs(ifft2(imageKspaceData)))));
display(abs(rrmse(imageNoiseless, best_estimate)));

figure; imshow(abs(ifft2(imageKspaceData)));
figure; imshow(abs(best_estimate));
figure; imshow(imageNoiseless);