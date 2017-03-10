# CS 131: Numerical Methods
# Programming Exercise 3.2: Kleibest Fit

X = [400, 70, 45, 2, 0.3, 0.16];
Y = [270, 82, 50, 4.8, 1.45, 0.97];
m = 125;

A = fliplr(vander([[400, 70, 45, 2, 0.3, 0.16]]))(1:6,1:2);
x = (A\Y')';

dom = linspace(min(X), max(X), 6);
poly = x(1) + x(2)*(X.^0.75);
plot(dom, poly, 'b-o'); hold on;
poly = x(1) + x(2)*(m^0.75);
disp(poly);
plot(m, poly, 'ro');