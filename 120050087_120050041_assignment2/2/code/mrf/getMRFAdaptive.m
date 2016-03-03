function G = getMRFAdaptive( image, gamma )
    G = zeros(size(image, 1), size(image, 2));
    
    for dim = 1:4
        Gt = getModU(image, 1);
        Gt = gamma * Gt - gamma * gamma * log (1 + Gt / gamma);
        G = G + Gt;
    end
end

