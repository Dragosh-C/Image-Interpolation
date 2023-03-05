function R = bicubic_resize(I, p, q)
    % =========================================================================
    % The image is scaled using the Bicubic Interpolation algorithm.
    % Transform image I from size m x n to size p x q.
    % =========================================================================

    [m n nr_colors] = size(I);

    % Initializes the final matrix as a null matrix.
    R = zeros(m,n);
    % if the image is black and white, ignore it
    if nr_colors > 1
        R = -1;
        return
    endif

    % Note:
    % When scaling is applied, the point (0, 0) of the image will not move.
    % In Octave, image pixels are indexed from 1 to n.
    % If you work in indices from 1 to n and multiply x and y by s_x
    % respectively s_y, then the origin of the image will move from (1, 1) to (sx, sy)!
    % Therefore, you must work with indices in the range [0, n - 1]!
    
    
    % Calculates scaling factors
    s_x = (q-1) / (n-1);
    s_y = (p-1) / (m-1);
    % Defines the transformation matrix for resizing.
    T = zeros(2);
    T(1, 1) = s_x;
    T(2, 2) = s_y;
    % Calculate the inverse of the transformation.
    T_inv = inv(T);
    % Precalculates the derivatives.
    [Ix, Iy, Ixy] = precalc_d(I);
    
    % Go through every pixel in the image.
    for y = 0 : p - 1
        for x = 0 : q - 1
            % Apply the inverse transformation on (x, y) and calculate x_p and y_p
            % of the initial image space.
            Temp = T_inv*[x;y];
            x_p = Temp(1);
            y_p = Temp(2);
            % Pass (xp, yp) from the coordinate system 0, n - 1 in
            % coordinate system 1, n to apply interpolation.
            x_p = x_p+1;
            y_p = y_p+1;
            % Find the 4 points that surround the point x, y
            x1 = floor(x_p);
            y1 = floor(y_p);
            x2 = x1 + 1;
            y2 = y1 + 1;
            if x2 >= n % check if they are not outside the matrix
              x2 = n;
              x1 = n-1;
            endif
            if y2 >= m
              y2 = m;
              y1 = m-1;
            endif
          
            % Calculate the interpolation coefficients A.
            A = bicubic_coef(I, Ix, Iy, Ixy, x1, y1, x2, y2);
            % Pass the coordinates (xp, yp) in the unit square, subtracting (x1, y1).
            x_p = x_p - x1;
            y_p = y_p - y1;
            % Calculates the interpolated value of the pixel (x, y).
             % Obs: For writing in the image, x and y are in coordinates of
             % to 0 to n - 1 and must be brought in coordinates from 1 to n.
             X = [1 x_p x_p^2 x_p^3];
             Y = [1; y_p; y_p^2; y_p^3];
             R(y + 1, x + 1) = X*A*Y; 
        endfor
    endfor

    % Convert the resulting array to uint8 to be a valid image.
    R = uint8(R);
    endfunction





