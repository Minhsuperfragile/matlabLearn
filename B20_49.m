linear_displacement = [0.1 0.17 0.27 0.35];
poly_displacement = [0.39 0.42 0.43 0.44];
linear_force = [10 20 30 40];
poly_force = [50 60 70 80];

lf = polyfit(linear_displacement,linear_force,1);
pf = polyfit(poly_displacement,poly_force,2);
lf(1)
pff = @(x) pf(1)*x^2 + pf(2)*x +pf(3);
lff = @(x) lf(1)*x + lf(2);
figure
fplot(pff,[0 0.5]);
hold on;
fplot(lff,[0 0.5]);
