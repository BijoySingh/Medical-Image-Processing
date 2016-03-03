g = [1, 0; 0.866, 0.5; 0.5, 0.866; ...
    0, 1; -0.5, 0.866; -0.866, 0.5];
S = [0.5045 - 0.0217i; 0.6874 + 0.0171i; 0.3632 + 0.1789i; ...
    0.3483 + 0.1385i; 0.2606 - 0.0675i; 0.2407 + 0.1517i];
S0 = 1;
b0 = 0.1;

getDMatrix(S0, b0, S, g);