load('../data/assignmentSegmentBrainGmmEmMrf.mat');

Y = imageData;
M = imageMask;
K = 3;
X = getStartingLabel(Y, M, K);
u = zeros(1, K);
s = zeros(1, K);
beta = 0.35;
   
for label = 1:K
    positions = X == label;
    u(1, label) = mean(Y(positions));
    s(1, label) = std(Y(positions));
end;

L = getEMLabels(Y, M, K, X, u, s, beta);
showImage(imageData, 'Original Image');
showImage(X, 'Initial Image Segmentation');
showImage(L, 'GMM-MRF-EM Optimised Image Segmentation');