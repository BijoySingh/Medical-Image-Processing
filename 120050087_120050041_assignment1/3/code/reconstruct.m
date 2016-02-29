function reconstructed = reconstruct(image, thetas, image_size)
    phantom_radon = radon(image, thetas);
    phantom_fft = fft(phantom_radon, [], 1);
    phantom_fft = fftshift(phantom_fft, 1);
    L = floor(size(phantom_fft, 1) / 2) / 2;

    cosine_fft = applyLowPassCosine(phantom_fft, L);
    reconstructed = getImageFromFiltered(cosine_fft, thetas, image_size);
end