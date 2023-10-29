Depth = [0 0.5 1.0 1.5 2.0 2.5 3.0];
Temparature = [70 68 55 22 13 11 10];

pp = polyfit(Depth,Temparature,3);

f = @(x) pp(1)*x^3 + pp(2)*x^2 + pp(3)*x + pp(4);
d1f = @(x) pp(1)*3*x^2 + pp(2)*2*x + pp(3);
d2f = @(x) pp(1)*6*x + pp(2)*2;

x1 = linspace(10,70,7);
y1 = polyval(pp,x1);

thermocline_depth = (-pp(2)*2)/(pp(1)*6)
J = -0.02*d1f(thermocline_depth)

figure;
plot(Depth,Temparature,'o');
hold on;
fplot(f,[0 3]);
hold off;
