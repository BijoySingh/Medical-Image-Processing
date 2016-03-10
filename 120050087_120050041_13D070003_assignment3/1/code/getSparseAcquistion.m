function N = getSparseAcquistion( noisy_image, estimate, imageKspaceMask )
    N = abs(fft2(noisy_image)-imageKspaceMask*fft2(estimate)).^2;
end

