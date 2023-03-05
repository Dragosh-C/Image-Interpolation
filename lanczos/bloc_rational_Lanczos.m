function [Vm, Wm] = bloc_rational_Lanczos(A, B, C, Delta)
  [n, m] = size(B);
  In = eye(n);
  S{0} = inv((A-Delta[1]*In))*B;
  R{0} = inv((A-Delta[1*In]))'*C';
  H{1}{0} = B;
  V{1} = inv((A-Delta[1*In]));
  W{1} = inv((A-Delta[1*In]))';
  G{1}{0} = C';
  
  V{1} = [V{1}];
  W{1} = [W{1}];
  for k=1:m
     if k < m
       if Delta[k+1] = Inf
         S{k} = A*V{k};
         R{k} = A'*W{k};
       else
         S{k} = inv(A - Delta[k+1]*In)*V{k};
         R{k} = inv(A - Delta[k+1]*In)'*W{k};
       endif
       H{k} = W{k}'*S{k};
       G{k} = V{k}'*R{k};
       S{k} = S{k} - V{k}*H{k};
       R{k} = R{k} - W{k}*G{k};
       
       
       B = S{k};
    % Modified Gram-Schmidt algorithm
    [~, n] = size(B);
    Q = zeros(n);
    R = zeros(n);
    for i = 1:n
	    R(i,i) = norm(B(:,i),2);
	    Q(:,i) = B(:,i)/R(i,i);
        for j = i+1:n
	        R(i,j) = Q(:,i)'*B(:,j);
	        B(:,j) = B(:,j) - Q(:,i)*R(i,j);
        endfor
    endfor
    
    V{k+1} = Q;
    H{k+1}{k} = R;
    
    B = R{k};
    % Modified Gram-Schmidt algorithm
    [~, n] = size(B);
    Q = zeros(n);
    R = zeros(n);
    for i = 1:n
	    R(i,i) = norm(B(:,i),2);
	    Q(:,i) = B(:,i)/R(i,i);
        for j = i+1:n
	        R(i,j) = Q'(:,i)*B(:,j);
	        B(:,j) = B(:,j) - Q(:,i)*R(i,j);
        endfor
    endfor
    
    W{k+1} = Q;
    G{k+1}{k} = R;
    % SVD
      [P{k},D{k},Q'{k}] = svd(W'{k+1}*V{k+1});
       
       V{k+1} = V{k+1}*Q{k}*D{k}^(-1/2);
       W{k+1} = W{k+1}*P{k}*D{k}^(-1/2);
       
       H{k+1}{k} = D{k}^(1/2)*Q'{k}*H{k+1}{k};
       G{k+1}{k} = D{k}^(1/2)*P'{k}*G{k+1}{k};
       V{k+1} = [V{k},V{k+1}];
       W{k+1} = [W{k},W{k+1}];
     else
       if Delta[m+1] = inf
         S{m} = A*B;
         R{m} = A'*C;
       else
         S{m} = inv(A)*B;
         R{m} = inv(A)'*C';
       endif
       H{m} = W'{m}*S{m};
       G{m} = V{m}'*R{m};
       S{m} = S{m} - V{m}*H{m};
       R{m} = R{m} - W{m}*G{m};
       
       B = S{m};
    % Modified Gram-Schmidt algorithm
    [~, n] = size(B);
    Q = zeros(n);
    R = zeros(n);
    for i = 1:n
	    R(i,i) = norm(B(:,i),2);
	    Q(:,i) = B(:,i)/R(i,i);
        for j = i+1:n
	        R(i,j) = Q'(:,i)*B(:,j);
	        B(:,j) = B(:,j) - Q(:,i)*R(i,j);
        endfor
    endfor
    
    V{m+1} = Q;
    H{m+1}{m} = R;
    
    B = R{m};
    % Modified Gram-Schmidt algorithm
    [~, n] = size(B);
    Q = zeros(n);
    R = zeros(n);
    for i = 1:n
	    R(i,i) = norm(B(:,i),2);
	    Q(:,i) = B(:,i)/R(i,i);
        for j = i+1:n
	        R(i,j) = Q'(:,i)*B(:,j);
	        B(:,j) = B(:,j) - Q(:,i)*R(i,j);
        endfor
    endfor
    
    W{m+1} = Q;
    G{m+1}{m} = R;
    
    % SVD
    [P{m},D{m},Q'{m}] = svd(W'{m+1}*V{m+1});
       
    V{m+1} = V{m+1}*Q{m}*D{m}^(-1/2);
    W{m+1} = W{k+1}*P{m}*D{m}^(-1/2);
       
    H{m+1}{m} = D{m}^(1/2)*Q'{m}*H{m+1}{m};
    G{m+1}{m} = D{m}^(1/2)*P'{m}*G{m+1}{m};
    V{m+1} = [V{m},V{m+1}];
    W{m+1} = [W{m},W{m+1}];
     endif
  endfor
