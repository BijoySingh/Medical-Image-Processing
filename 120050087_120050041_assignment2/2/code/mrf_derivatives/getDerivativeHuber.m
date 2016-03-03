function D = getDerivativeHuber( image, gamma )
    D = zeros(size(image, 1), size(image, 2));
    for dim = 1:4
        Df = getDiffU(image, 1);
        Dt = getModU(image, 1);
        limit = (Dt <= gamma);
        Dt(limit) = Dt(limit);
        Dt(~limit) = gamma;
        Dt = Dt * sign(Df);
        D = D + Dt;
    end
end

