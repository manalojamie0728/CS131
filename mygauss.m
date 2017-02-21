function [Pi,Di,Li] = mygauss(A, i)
  Pi = eye(size(A, 1));
  k = i;
  for j = i+1:size(A, 1)
    if (A(k, i) < A(j, i))
      k = j;
    endif
  end
  temp = Pi(k,:);
  Pi(k,:) = Pi(i,:);
  Pi(i,:) = temp;
  Di = eye(size(A, 1));
  Di(i, i) = 1/A(i, i);
  Li = eye(size(A, 1));
  for j = i+1:size(A, 1)
    Li(j, i) = -A(j, i);
  end
  return;
endfunction