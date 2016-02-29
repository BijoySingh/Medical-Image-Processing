function [rrmse_phantom, ram_lak_inverse] = rrmseForPartB(phantom_image, thetas, image_title, image_size)
    phantom_radon = radon(phantom_image, thetas);
    phantom_fft = fft(phantom_radon, [], 1);
    phantom_fft = fftshift(phantom_fft, 1);
    L = floor(size(phantom_fft, 1) / 2);
    phantom_ram_lak_fft = applyRamLak(phantom_fft, L);
    ram_lak_inverse = getImageFromFiltered(phantom_ram_lak_fft, thetas, image_size);
    rrmse_phantom = rrmse(phantom_image, ram_lak_inverse);
    showImage(ram_lak_inverse, image_title);
end