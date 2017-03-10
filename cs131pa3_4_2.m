# CS 131: Numerical Methods
# Programming Exercise 3.4: Those who make peace are wise...

t = [145.9, 142.9, 141.3, 139.7, 138.0, 136.2, 134.4, 132.8, 129.1, 126.9, 124.8, 122.5, 120.5, 118.0, 116.6, 114.8, 113.1, 111.4, 110.3, 109.0, 108.0, 107.5, 107.1]';
y = [6.5, 6.9, 7.1, 7.3, 7.6, 7.9, 8.2, 8.7, 10.2, 10.6, 11.0, 11.4, 11.9, 12.2, 12.3, 13.5, 14.4, 15.4, 16.5, 17.9, 19.4, 20.4, 21.5]';

n = length(t);
tmp = sortrows([t,y],1);
t = tmp(:,1);
y = tmp(:,2);

% Setup the piecewise interpolation linear system naively
A = [];
b = [];
base = 1;
for i = 1:n
	r1 = zeros(1,4*(n-1));
	tmp = [];
	for j = 0:3
		tmp = [tmp,t(i)^j];
	end
	r1(base:base+3) = tmp;
	A = [A;r1]; % the usual cubic polynomial interpolant
	b = [b;y(i)];
	
	if (i ~= 1 & i ~= n)
		first = [];
		second = [];
		for j = 0:3
			first = [first,j*(t(i)^(j-1))];
			second = [second,j*((j-1)*(t(i)^(j-2)))];
			first(isnan(first)) = 0;
			second(isnan(second)) = 0;
		end
		first = [first,-first]; % first derivative should be equal at knots (from Hermite)
		second = [second,-second]; % second derivative should be equal at knots (required for cubic spline)
		r2 = zeros(1,4*(n-1));
		r3 = zeros(1,4*(n-1));
		r2(base:base+7) = first;
		r3(base:base+7) = second;
		A = [A;r2;r3];
		b = [b;0;0];
		
		base = 4*(i-1)+1;
		r1 = zeros(1,4*(n-1));
		r1(base:base+3) = tmp;
		A = [A;r1]; % force the knot with the previous equation
		b = [b;y(i)];
	end
end
second_1 = [];
second_n = [];
for j = 0:3
	second_1 = [second_1,j*((j-1)*(t(1)^(j-2)))];
	second_n = [second_n,j*((j-1)*(t(n)^(j-2)))];
	second_1(isnan(second_1)) = 0;
	second_n(isnan(second_n)) = 0;
end
second_1 = [second_1,zeros(1,4*(n-2))]; % second derivative should be zero at the first point to get a 'natural spline'
second_n = [zeros(1,4*(n-2)),second_n]; % second derivative should be zero at the last point to get a 'natural spline'
A = [A;second_1;second_n];
b = [b;0;0];

% Solve the piecewise interpolation linear system
x = A\b;

% Reshape the solution to n-1 cubic functions
coefficients = [reshape(x,[4,n-1])]';

% Evaluate the piecewise interpolant over the domain naively
domain = linspace(min(t),max(t),500);
y = 0; flag = 0;
for i = 1:length(domain)
	if (domain(i) <= t(2)) % negative infinity to second point
		range(i) = polyval(coefficients(1,4:-1:1),domain(i));
	elseif (domain(i) >= t(n-1)) % second to the last point to positive infinity
		range(i) = polyval(coefficients(n-1,4:-1:1),domain(i));
	else
		for j = 2:n-1
      if (domain(i) <= t(j+1)) % in between the points, increasingly checking
        if ((domain(i) > 131.1) & (flag == 0))
          y = polyval(coefficients(j,4:-1:1), 131.1);
          flag = 1;
        end
        range(i) = polyval(coefficients(j,4:-1:1),domain(i));
				break;
			end
		end
	end
end
plot(domain,range,'b');
hold on;
plot(131.1, y, 'ro');

printf("Relative Error: "); disp(abs(abs(y-9.3)/9.3));