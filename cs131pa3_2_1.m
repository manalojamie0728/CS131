# CS 131: Numerical Methods
# Programming Exercise 3.2: Kleibest Fit

X = [400, 70, 45, 2, 0.3, 0.16];
Y = [270, 82, 50, 4.8, 1.45, 0.97];
m = 125;

A = fliplr(vander([[400, 70, 45, 2, 0.3, 0.16]]))(1:6,1:2);
x = (A\Y')';

poly = x(1) + x(2)*X;
dom = linspace(min(X), max(X), 6);
plot(dom, poly, 'r-o'); hold on;

poly = x(1) + x(2)*m;
plot(m, poly, 'bo');
disp(poly);

#s = (size(X))(2);
#A = zeros(s);
#A = ones(s, 1);
#for i = 2:s
#  for j = 2:i
#    prod = 1;
#    for k = 1:j-1
#      prod = prod*(X(i)-X(k));
#    end
#    A(i, j) = prod;
#  end
#end
#x = (A\Y')';

#dom = linspace(min(X), max(X), 100);
#poly = 0;
#for i = 1:s
#  prod = 1;
#  for j = 1:i-1
#    prod = prod.*(dom' - X(j));
#  end
#  poly = poly + dom'.*prod;
#end
#plot(dom, poly, 'r', X, Y, 'ro');
#hold on;

#poly = [];
#for i = 1:s
#  prod = 1;
#  for j = 1:i-1
#    prod = prod*(m - X(j));
#  end
#  poly = [poly, x(i)*prod];
#end
#disp(sum(poly));
#plot(m, sum(poly), 'bo');