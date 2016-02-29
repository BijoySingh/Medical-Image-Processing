function plotForPartC(R, theta, image_title, delta_theta)
    figure;
    plot(R(:, (theta / delta_theta) + 1)');
    title(image_title);
end