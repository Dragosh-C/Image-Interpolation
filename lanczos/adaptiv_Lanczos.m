function [A, B, C] = adaptiv_Lanczos(A, B, C, Delta1, Delta2, H)
  
  top = Delta1 - Delta2;
  {n, p} = size(C);
  H(0) = eye(p);
  eps = 1;
  m = 1;
  while eps > tol 
    [V{m}, W{m}] = bloc_rationat_Lanczos(A, B, C);
    A{m} = W'{m}*A*V{m};
    B{m} = W'{m}*B;
    C{m} = C*V{m};
    eps = norm(H(m)-H(m-1),inf);
    m = m+1;
  endwhile
  A = A{m};
  B = B{m};
  C = C{m};
endfunction
  