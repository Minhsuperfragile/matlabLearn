function integral = newtonCote(f,low,up,points)
    fx = zeros(points,1);
    h = (up - low)/(points-1)
    count = 1;
    for ii = low:h:up
        fx(count) = f(ii);
        count = count + 1;
    end
    fx
    if points == 2
        integral = (up-low)*(fx(1)+fx(2))/2;
    end
    if points == 3
        integral = (up-low)*(fx(1)+4*fx(2)+fx(3))/6;
    end
    if points == 4
        integral = (up-low)*(fx(1)+3*fx(2)+3*fx(3)+fx(4))/8;
    end
    if points == 5
        integral = (up-low)*(7*fx(1)+32*fx(2)+12*fx(3)+32*fx(4)+7*fx(5))/90;
    end
    if points == 6
        integral = (up-low)*(19*fx(1)+75*fx(2)+50*fx(3)+50*fx(4)+75*fx(5)+19*fx(6))/288;
    end
end