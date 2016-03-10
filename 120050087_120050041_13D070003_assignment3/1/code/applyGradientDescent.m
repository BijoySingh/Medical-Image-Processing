function estimate = applyGradientDescent( imageNoisy, algorithm, ...
    alpha, gamma, imageKspaceMask)
    [rows, columns] = size(imageNoisy);
    lambda = ones(rows, columns);
    estimate = imageNoisy;
    
%      likelyhood_series = zeros(1, 100);
%     rrmse_series = zeros(1, 100);
    
    for i = 1:100
        [likelyhood, derivative] = ... 
            getLikelyhoodAndDerivative(imageNoisy, ...
            estimate, algorithm, alpha, gamma, imageKspaceMask);
        
        new_estimate = estimate - derivative .*(2*lambda);
        
        [new_likelyhood] = ...
            getLikelyhoodAndDerivative(imageNoisy, ...
            new_estimate, algorithm, alpha, gamma, imageKspaceMask);

        limits = (real(new_likelyhood) < real(likelyhood));
        lambda(limits) = 1.1 * lambda(limits);
        estimate(limits) = new_estimate(limits);
        lambda(~limits) = lambda(~limits) / 2;
        
%         likelyhood_series(1, i) = norm(likelyhood);
%         rrmse_series(1, i) = rrmse(imageNoiseless, estimate);
    end
    
%     figure; plot(1:100, rrmse_series);
%      figure; plot(1:100, likelyhood_series);
end

