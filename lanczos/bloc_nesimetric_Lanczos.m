function out = bloc_nesimetric_Lanczos(A, V, W, m)
  
    B = W'*V;
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
    
    Delta = Q;
    Beta = R;
    V{1} = V*inv(Beta);
    W{1} = W*Delta;
    V{2} = A*V1;
    W{2} = A'*W1;
    
    
   for j = 1:m
      alfa{j} = W{j}'*V{j+1};
      V{j+1} = V{j+1} - V{j}*alfa{j};
      W{j+1} = W{j+1} - W{j}*alfa{j}';
      
      % QR determination
      B = V{j+1};  
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
     V{j+1} = Q;
     Beta{j+1} = R;
   
     % QR determination 
     B = W{j+1};
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
      W{j+1} = Q;
      Delta'{j+1} = R;
      
      % Decomposition of singular values
      [U{j},S{j},Z'{j}] = svd(W'{j+1}*V{j+1}); 
    
      Delta{j+1} = Delta{j+1}*U{j}*S{j}^(1/2);
      Beta{j+1} = S{j}^(1/2)*Z{j}'*Beta{j+1};
      V{j+1} = V{j+1}*Z{j}*S{j}^(-1/2);
      W{j+1} = W{j+1}*U{j}*S{j}^(-1/2);
      V{j+2} = A*V{j+1} - V{j}*Delta{j+1};
      W{j+2} = A'*W{j+1} - W{j}*Beta{j+1}';
   endfor
  
  
 endfunction
