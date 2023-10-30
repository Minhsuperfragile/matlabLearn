function df = backwardDifference(f,x,h)
    df = (f(x-h)-f(x))/h;
end