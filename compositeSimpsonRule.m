function integral = compositeSimpsonRule(f,low,up,points)
    h = (up-low)/(points-1);
    fx = zeros(points,0);
    count = 1;
    for ii = low:h:up
        fx(count) = f(ii);
        count = count + 1;
    end
    integral = fx(1);
    for ii = 2:1:(points-1)
        if mod(ii,2)==0
            integral = integral + 4*fx(ii);
        else
            integral = integral + 2*fx(ii);
        end
    end
    integral = (up-low)*(integral+fx(points))/(3*(points-1));
end 
% n points means n-1 segments and reverse