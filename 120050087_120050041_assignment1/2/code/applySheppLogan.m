function I = applySheppLogan(fourier_image, L)
    w_max = floor(size(fourier_image, 1)/2);
    I = fourier_image;
    w = -w_max;
    for pos = 1:size(fourier_image, 1)
        sheppScale = sin(0.5 * pi * w / L) * (L / (0.5 * pi * w ));
        if isnan(sheppScale)
            sheppScale = 0;
        end
        
        I(pos, :) = defaultFilter(L, w) * sheppScale * fourier_image(pos, :);
        w = w + 1;
    end
    I = I ./ w_max;
end