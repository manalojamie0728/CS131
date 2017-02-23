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

#disp(K);

x(1:15,1) = 0;

while (norm(W-K*x) > 1e-11)
  for i = 1:N
    #x(i) = K(i, i)\(W(i) - (K(i,:)*x - K(i, i)*x(i)));
    x(i) = K(i, i)\(W(i) - K(i,1:i-1)*x(1:i-1) - K(i,i+1:N)*x(i+1:N));
  end
end
disp(x);
  
#for i = 1:N
#  x(i) = K(i, i)\(W(i,1) - K(i,1:i-1)*x(1:i-1) - K(i,i+1:N)*x(i+1:N));
  #x(i) = K(i, i)\(W(i,1) - (K(i,:)*x(:) - K(i, i)*x(i)));
#end
#disp(x);
plot(zeros(15,1),3-x,'rs')