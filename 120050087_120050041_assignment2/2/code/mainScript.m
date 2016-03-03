addpath 'mrf';
addpath 'mrf_derivatives';
addpath '../../common/';
load('../data/assignmentImageDenoisingPhantom.mat');

alpha_range = 0:0.05:1;
gamma_range = 0:0.05:1;

estimates = zeros(size(alpha_range, 2), size(gamma_range, 2));
min_rrmse = 10000000;
best_estimate = 0;
r = 1;
for alpha = alpha_range
    c = 1;
    for gamma = gamma_range
        estimate = applyGradientDescent(imageNoisy, 3, alpha, gamma);
        estimates(r, c) = rrmse(imageNoiseless, estimate);
        
        if min_rrmse > estimates(r, c)
            best_estimate = estimate;
            min_rrmse = estimates(r, c);
        end
        c = c + 1;
    end
    r = r + 1;
end

surf(estimates);

abs(rrmse(imageNoiseless, imageNoisy))
abs(rrmse(imageNoiseless, best_estimate))
figure;
imshow(imageNoisy);
figure;
imshow(best_estimate);
figure;
imshow(imageNoiseless);