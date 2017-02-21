# CS 131: Numerical Methods
# Programming Exercise 2.1: The Composer

A = magic(5);
#A = [3, 9, 0, -3; 0, 1, 0, 3; 2, 6, 4, -2; 0, 3, 0, 11];

U = A;
L = eye(size(A));
for i = 1:size(A,1)
  [Pi,Di,Li] = mygauss(U,i);
  U = Li*Di*Pi*U;
  Di(i,i) = 1/Di(i,i);
  Li(i+1:end,i) = -Li(i+1:end,i);
  L = L*Pi*Di*Li;
end

Ap = L*U;
disp(norm(A-Ap));