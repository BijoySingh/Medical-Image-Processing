function N = getGaussianDerivative( noisy_image, estimate, sigma )
    N = (noisy_image - estimate);
    N = 2*N/(2 * sigma * sigma);
end

