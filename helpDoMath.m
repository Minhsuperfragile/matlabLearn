dy = @(t,s) -1000*s+3000-2000*exp(-t);
% y = @(x) 4/1.3*(exp(0.8*x)-exp(-0.5*x)) + 2*exp(-0.5*x);
tInterval = [0 0.4];
[f,er] = eulerMethod(dy,tInterval,0,0.05,1)
