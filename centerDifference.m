function df = centerDifference(f,x,h)
    df = (f(x+h)-f(x-h))/(2*h);
end