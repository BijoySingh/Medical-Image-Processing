function estimate = applyGradientDescent( imageNoisy, algorithm, alpha, gamma )
    [rows, columns] = size(imageNoisy);
    lambda = 0.1*ones(rows, columns);
    estimate = imageNoisy;
    for i = 1:100
        [likelyhood, derivative] = getLikelyhoodAndDerivative(imageNoisy, estimate, algorithm, alpha, gamma);
        new_estimate = estimate - derivative .* lambda;
        [new_likelyhood] = getLikelyhoodAndDerivative(imageNoisy, new_estimate, algorithm, alpha, gamma);

        limits = (new_likelyhood < likelyhood);
        lambda(limits) = 1.1 * lambda(limits);
        estimate(limits) = new_estimate(limits);
        lambda(~limits) = lambda(~limits) / 2;
    end
end

