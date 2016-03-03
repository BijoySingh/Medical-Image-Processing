function D = getDMatrix(S0, b0, S, g)
    count = size(g, 1);
    gtDg = log(S / S0)/b0;
    display(gtDg);
    
    d = [0.4, 0.4];
    
    for data = 1:count
        x2 = g(data, 1) * g(data, 1);
        xy = g(data, 1) * g(data, 2);
        y2 = g(data, 2) * g(data, 2);
        
        r_value = x2 * d(1, 1) + xy * (d(1, 1) + d(1, 2)) + y2 * d(1, 2);
        l_value = gtDg(data, 1);
    end
end