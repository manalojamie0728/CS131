function decode(t, y)
  if ((size(t))(1) < 3)
    printf("Failed\n");
  else
    A = zeros((size(t))(1));
    A = ones((size(t))(1), 1);
    for i = 2:(size(t))(1)
      for j = 2:i
        prod = 1;
        for k = 1:j-1
          prod = prod*(t'(i)-t'(k));
        end
        A(i, j) = prod;
      end
    end
    b = y;
    x = (A\b)';
    
    fact = 0;
    for i = 1:size(x, 2)
      prod = x(i);
      for j = 1:i-1
        prod = prod*(-t(j));
      end
      fact = fact+prod;
    end
    
    if (round(fact) == dlmread("dontlook"))
      disp("Success");
    else
      disp("Impostor");
    endif
  endif
endfunction