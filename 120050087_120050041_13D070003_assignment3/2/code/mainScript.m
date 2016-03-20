addpath 'mrf';
addpath 'mrf_derivatives';
addpath '../../common/';
load('../data/assignmentImageReconstructionBrain.mat');

min_rrmse = 10000000;
best_estimate = 0;

display(strcat(['RRMSE (Noiseless Image, Inverse Fourier-kspaceData) : ' ... 
	num2str(abs(rrmse(imageNoiseless, abs(ifft2(imageKspaceData))))) ]));
figure; imshow(abs(ifft2(imageKspaceData))); title('Inverse Fourier-kspaceData');
figure; imshow(imageNoiseless); title('Noiseless Image');

%% Quadratic Prior 1 
algorithm = 1;
best_alpha = 0.0001;
best_gamma = 0.00;
estimate = applyGradientDescent(imageKspaceData, algorithm, best_alpha ,best_gamma, imageKspaceMask);
display('Quadratic Prior');
display(strcat( ['Best alpha :' num2str(best_alpha)] )); 
display(strcat( ['Best gamma :' num2str(best_gamma)] )); 
display( strcat(['RRMSE (Noiseless Image, Reconstructed Image) : ' num2str(abs(rrmse(imageNoiseless, estimate))) ]));
figure; imshow(abs(estimate)); title('Quadratic Prior Reconstructed Image');

%% Huber Prior 2 
algorithm = 2;
best_alpha = 0.000001;
best_gamma = 0.012;
estimate = applyGradientDescent(imageKspaceData, algorithm, best_alpha , best_gamma , imageKspaceMask);
display('Huber Prior');
display(strcat( ['Best alpha :' num2str(best_alpha)] )); 
display(strcat( ['Best gamma:' num2str(best_gamma)] )); 
display(strcat([ 'RRMSE (Noiseless Image, Reconstructed Image) : ' num2str(abs(rrmse(imageNoiseless, estimate))) ] ));
figure; imshow(abs(estimate)); title('Huber Prior Reconstructed Image');

%% Adaptive Prior 3
algorithm = 3;
best_alpha = 0.00001;
best_gamma = 0.09;
estimate = applyGradientDescent(imageKspaceData, algorithm, best_alpha , best_gamma , imageKspaceMask);
display('Adaptive Prior');
display(strcat( ['Best alpha :' num2str(best_alpha)] )); 
display(strcat( ['Best gamma:' num2str(best_gamma)] )); 
display(strcat( [ 'RRMSE (Noiseless Image, Reconstructed Image) : ' num2str(abs(rrmse(imageNoiseless, estimate)))] ));
figure; imshow(abs(estimate)); title('Adaptive Prior Reconstructed Image');