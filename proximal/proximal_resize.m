function R = proximal_resize(I, p, q)
    % =========================================================================
    %The image is scaled using the Proximal Interpolation algorithm.
     % Transform image I from m x n size to p x q size.
    % =========================================================================
    [m n nr_colors] = size(I);

    % The input image is converted to black and white, if necessary.
    if nr_colors > 1
        R = -1;
        return
    endif

    matrix = zeros(p, q);
    

    % Calculates scaling factors.
    sx = (q-1) / (n-1);
    sy = (p-1) / (m - 1);
    % Obs: If working with indices from the interval [0, n - 1], the last pixel
     % of the image will move from (m - 1, n - 1) to (p, q).
     % s_x will not be q ./ n
    
    % Defines the transformation matrix for resizing.
    T = zeros(2); 
    T(1,1) = sx;
    T(2,2) = sy;
    % Invert the transformation matrix
    T_inv = zeros(2); 
    det = T(1,1)*T(2,2) - T(2,1)*T(1,2); 
    T_inv(1,1) =  T(2,2) / det;
    T_inv(1,2) =  -T(2,1) / det;
    T_inv(2,1) =  -T(1,2) / det;
    T_inv(2,2) =  T(1,1) / det;
    % Goes through every pixel in the image.
    for y = 0 : p - 1
        for x = 0 : q - 1
            % Apply the inverse transformation on (x, y) and calculate x_p and y_p
             % of the initial image space.
            Temp = T_inv*[x;y];
            x_p = Temp(1);
            y_p = Temp(2);
            % Pass (xp, yp) from the coordinate system [0, n - 1] in
             % coordinate system [1, n] to apply the interpolation.
            x_p = x_p + 1;
            y_p = y_p + 1;
            % Calculates the nearest pixel.
            x_p = round(x_p);
            y_p = round(y_p);
              % Calculates the pixel value in the final image.
            matrix(y + 1, x + 1) = I(y_p, x_p);
        endfor
    endfor

    R = uint8(matrix);
endfunction
