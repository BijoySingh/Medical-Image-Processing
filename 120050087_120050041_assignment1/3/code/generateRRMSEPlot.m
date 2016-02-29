function generateRRMSEPlot(image, plot_title, image_title, image_size)
    theta_range = 0:180;
    rrmses = zeros(1, length(theta_range));
    
    parfor theta = theta_range
        thetas = theta:(theta + 150);
        reconstructed = reconstruct(image, thetas, image_size);
        rrmses(1, theta + 1) = rrmse(image, reconstructed);
    end
        
    figure;
    plot(theta_range,  rrmses);
    title(plot_title);
    
    [rmin, index] = min(rrmses);
    theta_min = index - 1;
    reconstructed = reconstruct(image, theta_min:theta_min+150, image_size);
    showImage(reconstructed, image_title);
end