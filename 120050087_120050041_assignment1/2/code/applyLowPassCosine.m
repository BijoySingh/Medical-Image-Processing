function I = applyLowPassCosine(fourier_image, L)
    w_max = floor(size(fourier_image, 1)/2);
    I = fourier_image;
    w = -w_max;
    for pos = 1:size(fourier_image, 1)
        I(pos, :) = defaultFilter(L, w) * cos(0.5 * pi * w / L) * ...
            fourier_image(pos, :);
        w = w + 1;
    end
    I = I ./ w_max;
end