function inverse = getImageFromFiltered(fft_image, thetas, image_size)
    modified_fft_image = ifftshift(fft_image, 1);
    modified_ifft_image = real(ifft(modified_fft_image, [], 1));
    inverse = iradon(modified_ifft_image, thetas, ...
        'linear', 'none', 1.0, image_size);
end