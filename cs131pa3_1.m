# CS 131: Numerical Methods
# Programming Exercise 3.1: Planet first before doing it!

X = [1.02, 0.95, 0.87, 0.77, 0.67, 0.56, 0.44, 0.30, 0.16, 0.01];
Y = [0.39, 0.32, 0.27, 0.22, 0.18, 0.15, 0.13, 0.12, 0.13, 0.15];

M = [];
for i = 1:10
  M = [M;[Y(i).^2, X(i).*Y(i), X(i), Y(i), 1]];
end
b = X.^2;
x = (M\b')';

plot(X(:), Y(:), 'bo');
hold on;

domain = linspace(min(X), max(X), 10);
a = x(1);
b = x(2).*domain + x(4);
c = x(3).*domain + x(5) - (domain.^2);
plot(domain, real(roots([a, b, c])(1)), 'ro');
hold on;
plot(domain, real(roots([a, b, c])(2)), 'go');
hold on;