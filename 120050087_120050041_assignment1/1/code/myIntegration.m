function integral = myIntegration(image, t, theta, delta)
theta = theta * pi / 180.0;
cos_theta = cos(theta);
sin_theta = sin(theta);

max_width = size(image, 2);
max_height = size(image, 1);
integral = 0;
max_s = ceil(max(size(image)) / delta);

C = floor((size(image)+1)/2);

for k = (-1 * max_s) : max_s
    s = k * delta;    
    point_x = C(2) + t*cos_theta - s*sin_theta;
    point_y = C(1) + t*sin_theta + s*cos_theta;
     
    if (or(point_x < 1, point_y < 1))
        continue;
    end
    
    if (or(point_x >= max_width, point_y >= max_height))
        continue;
    end
      
    integral = integral + delta * interpolate(image, point_x, point_y);
end

end

function A = interpolate(image, x, y)
    x_low = floor(x);
    x_high = ceil(x);
    y_low = floor(y);
    y_high = ceil(y);
    
    if and(x_low == x_high, y_low == y_high)
       A = image(y_low, x_low);
    elseif x_low == x_high
       A = image(y_low, x_low)*(y_high - y) +  image(y_high, x_high)*(y - y_low);
    elseif y_low == y_high
       A = image(y_low, x_low)*(x_high - x) +  image(y_high, x_high)*(x - x_low);
    else
        A = image(y_low, x_low)*(x_high - x)*(y_high - y) ...
            + image(y_high, x_low)*(x_high - x)*(y - y_low) ...
            + image(y_low, x_high)*(x - x_low)*(y_high - y) ...
            + image(y_high, x_high)*(x - x_low)*(y - y_low);
    end
end

