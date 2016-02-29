function B = defaultFilter(L, w)
    if w < -L
        B = 0;
    elseif w > L
        B = 0;
    else
        B = abs(w);
    end
end