function [X, u, s] = getIcmLabels( Y, M, K, X, u, s, beta )
   [r, c] = size(Y);
   X_c = X;
   
   for count = 1:10
       for i = 2:r-1
           for j = 2:c-1
               if (M(i, j) == 0)
                   continue;
               end;
                   
               values = zeros(1, K);
               for x = 1:K
                   prior = getPrior(X, x, i, j, M, beta);
                   posterior = exp(- ( 1 - beta ) * (Y(i, j) - u(1, x))^2 / (2 * s(1, x) * s(1, x)));
                   values(1, x) = posterior * prior;
               end;
               [value, index] = max(values);
               X_c(i, j) = index;
           end;
       end;
       X = X_c .* M;
   end;
   
end

