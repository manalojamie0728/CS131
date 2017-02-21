function [Pi,Di,Li] = mygauss(A, i)
  Pi = eye(size(A, 1));
  m = Inf;
  k = 0;
  for j = i:size(A,1)
    if (m = Inf)
      m = A(j, i);
      k = j;
    elseif (m < A(j, i))
      m = A(j, i);
      k = j;
    endif
  end
    temp = Pi(k,:); Pi(i,:) = Pi(k,:); Pi(k,:) = temp;
  Di = eye(size(A, 1));
  Di(i, i) = 1/A(i, i);
  Li = eye(size(A, 1));
  for j = i:size(A, 1)
    Li(j, i) = -A(j, i)/A(i, i);
  end
  return;
endfunction