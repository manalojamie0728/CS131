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

for i = 1:N
  if (i > 1)
    K(i:N,i:N) = K(i:N,i:N) - K(i:N,i-1)*K(i:N,i-1)';
  endif
  if (K(i, i) < 0)
    K(i, i) = K(i, i)*-1;
  endif
  K(i, i) = sqrt(K(i, i));
  K(i+1:N,i) = K(i+1:N,i)/K(i, i);
  K(i,i+1:N) = 0;
end

#disp(K);

x = (K*K')\W;
plot(zeros(15,1),3-x,'bs')