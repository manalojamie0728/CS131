# CS 131: Numerical Methods
# Machine Problem #1

A = zeros(61766, 117);
A(:,1:116) = dlmread("dota2_train", ",");
labels = dlmread("dota2_train_labels");
y = ones(size(A, 1), 1);
y(labels <= 0) = -1;
w = A\y;
train_err = sum(y.*(A*w) <= 0)/size(A, 1);
train_acc = 1 - train_err;

A = zeros(41178, 117);
A(:,1:116) = dlmread("dota2_test", ",");
labels = dlmread("dota2_test_labels");
y = ones(size(A, 1), 1);
y(labels <= 0) = -1;
test_err = sum(y.*(A*w) <= 0)/size(A, 1);
test_acc = 1 - test_err;