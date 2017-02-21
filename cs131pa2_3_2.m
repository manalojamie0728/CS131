# CS 131: Numerical Methods
# Programming Exercise 2.3: I am Willing to Weight

N = 15;
k(1:N) = 10000;
W = zeros(15, 1); W(1, 1) = 100;
K = zeros(15, 15);
for i = 2:N
  W(i,1) = W(i-1,1) - 5;
end
for i = 1:N
  K(i, i) = k(i);
  if (i > 1)
    K(i, i-1) = -k(i);
  endif
  if (i < N)
    K(i, i+1) = -k(i+1);
    K(i, i) = K(i, i) + k(i+1);
  endif
end

disp(norm(K-chol(K)));

#plot(zeros(15,1),3-cumsum(x),'bs')