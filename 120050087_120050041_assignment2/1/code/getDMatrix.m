function D = getDMatrix(S0, b0, S, g)
    count = size(g, 1);
    P = log(S / S0)/b0;
    display(P);
  
end