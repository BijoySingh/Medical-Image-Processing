function [R, T, Th] = myRadonTransform(image, delta_t, delta_theta, delta_s)
    [r, c] = size(image);
    t_max = ceil(sqrt(r*r + c*c) / 2.0);
    
    Th = 0:delta_theta:175;
    T = -t_max:delta_t:t_max;
    
    t_size = size(T, 2);
    th_size = size(Th, 2);
    
    R = zeros(t_size, th_size);
    parfor t_pos = 1:t_size
        t = T(1,t_pos);
        for th_pos = 1:th_size
            Thetas = 0:delta_theta:175;
            th = Thetas(1,th_pos);
            R(t_pos, th_pos) = myIntegration(image, t, th, delta_s);
        end
    end
end 