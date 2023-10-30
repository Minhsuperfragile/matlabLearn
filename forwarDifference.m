function df = forwarDifference(f,x,h)
    df = (f(x+h)-f(x))/h;
end