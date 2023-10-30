function [result, error] = newtonRaphson(f,df,xi,maxIteration,es)
    if ~exist('maxIteration','var')
       maxIteration = 20; 
    end
    if ~exist('es','var')
        es = 0.1;
    end
    result = zeros(maxIteration+1,1);
    error = zeros(maxIteration+1,1);
    result(1) = xi;
    for ii = 2:1:(maxIteration+1)
       result(ii) = result(ii-1) - f(result(ii-1))/df(result(ii-1));
       error(ii) = abs((result(ii) - result(ii-1))/result(ii))*100;
       if error(ii) <= es
           break;
       end
    end    
end