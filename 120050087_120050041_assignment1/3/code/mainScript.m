%% Question 3

addpath '../../2/code';

% Loading the variables
load('../data/CT_Chest.mat');
chest_phantom = imageAC;

load('../data/myPhantom.mat');
my_phantom = imageAC;

showImage(chest_phantom, 'Chest CT Scan');
showImage(my_phantom, 'Phantom Image');

generateRRMSEPlot(chest_phantom, 'Chest CT Scan RRMSE vs Theta', ...
    'Best Reconstructed Chest CT Scan', size(chest_phantom, 1));
generateRRMSEPlot(my_phantom, 'Phantom Image RRMSE vs Theta', ...
    'Best Reconstructed Phantom Image', size(my_phantom, 1));
