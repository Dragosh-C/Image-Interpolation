function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % Precalculates the Ix, Iy and Ixy matrices that contain the derivatives dx, dy, dxy of them
    % of image I for each pixel of it.
    % =========================================================================
    
    [m n nr_colors] = size(I);
    
    I = double(I);
    
    Ix = zeros(m, n);
    Iy = zeros(m, n);
    Ixy = zeros(m, n);
   
    % Calculate the matrices with derivatives
    for x = 1 : m
      for y = 2 : n - 1
        Ix(x, y) = fx(I', y, x);
      endfor
    endfor

  
    for x = 2 : m - 1
      for y = 1 : n
        Iy(x, y) = fy(I', y, x);
      endfor
    endfor
   
    for x = 2 : m - 1
      for y = 2 : n - 1
        Ixy(x, y) = fxy(I', y, x);
      endfor
    endfor
endfunction
