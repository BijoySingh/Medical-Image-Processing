function N = getSparseAcquisitionDerivative( noisy_image, estimate , imageKspaceMask)
    N = 2*( ifft2(imageKspaceMask'*imageKspaceMask*fft2(estimate)) - ifft2(imageKspaceMask'*fft2(noisy_image)));
end

