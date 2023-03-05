function A = bicubic_coef(f, Ix, Iy, Ixy, x1, y1, x2, y2)
    % =========================================================================
    % Calculates the Bicubic Interpolation coefficients for 4 adjacent points
    % =========================================================================

    % Calculate the intermediate matrices.
    matrix1 = [1 0 0 0;
               0 0 1 0;
               -3 3 -2 -1;
               2 -2 1 1;];
    matrix2 = [1 0 -3 2;
               0 0 3 -2;
               0 1 -2 1;
               0 0 -1 1];
           
      matrix = zeros(4,4);
      matrix(1,1) = f(y1, x1);
      matrix(1,2) = f(y2, x1);
      matrix(2,1) = f(y1, x2);
      matrix(2,2) = f(y2, x2);
      
      matrix(1,3) = Iy(y1, x1);
      matrix(1,4) = Iy(y2, x1);
      matrix(2,3) = Iy(y1, x2);
      matrix(2,4) = Iy(y2, x2);
      
      matrix(3,1) = Ix(y1, x1);
      matrix(3,2) = Ix(y2, x1);
      matrix(4,1) = Ix(y1, x2);
      matrix(4,2) = Ix(y2, x2);
      
      matrix(3,3) = Ixy(y1, x1);
      matrix(3,4) = Ixy(y2, x1);
      matrix(4,3) = Ixy(y1, x2);
      matrix(4,4) = Ixy(y2, x2);
               
  
    % Converts intermediate matrices to doubles.
     matrix1 = double(matrix1);
     matrix2 = double(matrix2);
     matrix = double(matrix);
    % Calculate the final matrix.
      A = matrix1*matrix*matrix2;
endfunction
