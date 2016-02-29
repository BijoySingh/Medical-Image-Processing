function plotForPartC(phantom_image, thetas, image_title, image_size)
    figure;
    phantom_radon = radon(phantom_image, thetas);
    phantom_fft = fft(phantom_radon, [], 1);
    phantom_fft = fftshift(phantom_fft, 1);
    L_max = floor(size(phantom_fft, 1) / 2);
    x = 1:L_max;
    y = zeros(1, L_max);
    parfor L = 1:L_max
        phantom_ram_lak_fft = applyRamLak(phantom_fft, L);
        ram_lak_inverse = getImageFromFiltered(phantom_ram_lak_fft, thetas, image_size);
        rrmse_phantom = rrmse(phantom_image, ram_lak_inverse);
        y(1, L) = rrmse_phantom;
    end
    plot(x, y);
    title(image_title);
end