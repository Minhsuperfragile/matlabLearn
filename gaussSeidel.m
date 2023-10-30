function [x,er] = gaussSeidel(A,b,maxIter)
    n = size(A);
    cols = n(2);
    x = zeros(maxIter,cols);
    er = zeros(maxIter-1,cols);
    for ii = 2:1:maxIter
        for c = 1:1:cols
            x(ii,c) = b(c) + A(c,c)*x(ii-1,c);
            for j = c:1:cols
                x(ii,c) = x(ii,c) - A(c,j)*x(ii-1,j);
            end
            for k = 1:1:c-1
                x(ii,c) = x(ii,c) - A(c,k)*x(ii,k);
            end
            x(ii,c) = x(ii,c)/A(c,c);
            er(ii-1,c) = abs((x(ii,c)-x(ii-1,c))/x(ii,c))*100;
        end    
    end
end
% this function takes A and b as input of a system of linear equations
% and return all calculated x1 to xn as a table for each iterations
% output also includes a table of error between each x between each 2
% iterations.
% initial guesses are all 0