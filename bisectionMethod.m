function [result,xi] = bisectionMethod(f,xl,xu,maxIter)
    result = zeros(maxIter,2);
    xi = zeros(maxIter,1);
    if f(xl)*f(xu) >= 0
        error('no possible solution between interval');
    end
    result(1,:) = [xl xu];
    for ii = 1:1:maxIter
        xc = (result(ii,2)+result(ii,1))/2;
        xi(ii) = xc;
        if f(xc) > 0
            result(ii+1,2) = xc;
            result(ii+1,1) = result(ii,1);
        elseif f(xc) < 0
            result(ii+1,1) = xc;
            result(ii+1,2) = result(ii,2);
        end
    end
end
% result is a matrix that have 2 column, the first column is x-low, other is x-high
% xi is a list of centered x used for calculate error with function calculateError
% example code:
% f = @(x) x^3 - x -2;
% [re,xi] = bisectionMethod(f,1,2,13)
% err = calculateError(xi)