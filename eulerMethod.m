function [result,error] = eulerMethod(dy,t_interval,y,step,implicit,Y)
    if ~exist('Y','var')    
        noY = 1;
    else 
        noY = 0;
    end
    size = (t_interval(2)-t_interval(1))/step+1;
    result = zeros(size,1);
    error = zeros(size,1);
    j = 1;
    result(j) = y;
    syms s;
    a = -diff(dy,s);
    for t = t_interval(1):step:t_interval(2)
        if j < size && implicit == 1
            result(j+1) = (result(j)+(dy(t,result(j))+a*result(j))*step)/(1+a*step);
        elseif j < size && implicit ~= 1
            result(j+1) = result(j) + dy(t,result(j))*step;
        end
        if noY ~= 1;
            error(j) = abs((Y(t) - result(j))/Y(t))*100;
        end
        j = j+1;
    end
end
% euler's method is used to calculate approximately Y when we know dy/dx
% dy is derivative function of y, but y is not a function, it is the
% initial value that we use to apply into dy.
% t_interval is the interval of t, for example, t go from 0 to 4
% step is the gap between each t values 
% implicit take 1 if you want to use implicit form
% Y is original function or integral of y, use for calculate error
% without Y, error outputs are all 0
% The parenthetical quantity (1 ? ah) is called an amplification factor. If
% h < 2/a, euler's method is stable.
% if you want to use implicit, remember to define dy with t,s with s stands
% for Y
% for example, dy = @(t,s) 

% example problem:
% dy = @(t,s) -1000*s+3000-2000*exp(-t);
% y = @(x) 4/1.3*(exp(0.8*x)-exp(-0.5*x)) + 2*exp(-0.5*x);
% tInterval = [0 0.4];
% [f,er] = eulerMethod(dy,tInterval,0,0.05,1,y)
% t = 0:0.05:0.4;
% figure
% hold on
% plot(t,f,'.');