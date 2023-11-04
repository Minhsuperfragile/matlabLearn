function intergral = gaussLegendre(f,lower,upper,points)
    h = (upper - lower)/2;
    g = (upper + lower)/2;
    if points == 1
       intergral = h*(2*f(0));
    end
    if points == 2
        intergral = h*(f(-1/sqrt(3)*h+g) + f(1/sqrt(3)*h+g));
    end
    if points == 3
        intergral = h*(5/9*f(-sqrt(3/5)*h+g)+8/9*f((0*h+g)+5/9)*f(sqrt(3/5)*h+g));
    end
    if points == 4
        c0 = (18-sqrt(30))/36;
        c1 = (18+sqrt(30))/36;
        c3 = (18-sqrt(30))/36;
        c2 = (18+sqrt(30))/36;
        x0 = -sqrt(525+70*sqrt(30))/35;
        x1 = -sqrt(525-70*sqrt(30))/35;
        x2 = sqrt(525-70*sqrt(30))/35;
        x3 = sqrt(525+70*sqrt(30))/35;
        intergral = h*(c0*f(x0*h+g) + c1*f(x1*h+g) + c2*f(x2*h+g) + c3*f(x3*h+g));
    end
    if points == 5
        c0 = (322-13*sqrt(70))/900;
        c1 = (322+13*sqrt(70))/900;
        c2 = 128/225;
        c3 = (322+13*sqrt(70))/900;
        c4 = (322-13*sqrt(70))/900;
        x0 = -sqrt(245+14*sqrt(70))/21;
        x1 = -sqrt(245-14*sqrt(70))/21;
        x3 = sqrt(245-14*sqrt(70))/21;
        x4 = sqrt(245+14*sqrt(70))/21;
        intergral = h*(c0*f(x0*h+g) + c1*f(x1*h+g) + c2*f(0*h+g) + c3*f(x3*h+g) + c4*f(x4*h+g));
    end
    if points == 6
        c0 = 0.1713245;
        c1 = 0.3607616;
        c2 = 0.4679139;
        c3 = 0.4679139;
        c4 = 0.3607616;
        c5 = 0.1713245;
        x0 = -0.9324695;
        x1 = -0.6612094;
        x2 = -0.2386192;
        x3 = 0.2386192;
        x4 = 0.6612094;
        x5 = 0.9324695;
        intergral = h*(c0*f(x0*h+g) + c1*f(x1*h+g) + c2*f(x2*h+g) + c3*f(x3*h+g) + c4*f(x4*h+g) + c5*f(x5*h+g));
    end
end