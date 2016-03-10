function [ likelyhood, derivative ] = getLikelyhoodAndDerivative( imageNoisy, estimate, algorithm, alpha, gamma, imageKspaceMask)
    likelyhood = alpha * getSparseAcquistion(imageNoisy, estimate, imageKspaceMask);
    derivative = alpha * getSparseAcquistionDerivative(imageNoisy, estimate, imageKspaceMask);
    
    if algorithm == 1
        likelyhood = likelyhood + (1 - alpha) * getMRFQuadratic(estimate);
     	derivative = derivative + (1 - alpha) * getDerivativeQuadratic(estimate);
    elseif algorithm == 2
        likelyhood = likelyhood + (1 - alpha) * getMRFHuber(estimate, gamma);
     	derivative = derivative + (1 - alpha) * getDerivativeHuber(estimate, gamma);
    else
        likelyhood = likelyhood + (1 - alpha) * getMRFAdaptive(estimate, gamma);
     	derivative = derivative + (1 - alpha) * getDerivativeAdaptive(estimate, gamma);
    end
end

