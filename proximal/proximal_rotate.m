function R = proximal_rotate(I, rotation_angle)
    % =========================================================================
    % Rotate the black and white image I of size m x n by rotation_angle,
     % applying Proximal Interpolation.
     % rotation_angle is expressed in radians.
    % =========================================================================
    [m n nr_colors] = size(I);
    
    if nr_colors > 1
        R = -1;
        return
    endif

   

    % Calculates cosine and sine of rotation angle.
    cos = cos(rotation_angle);
    sin = sin(rotation_angle);

    R = zeros(m, n);
    % Calculate the transformation matrix.
    T = [cos -sin; sin cos];
    % Inverts the transformation matrix
    T_inv = inv(T);
 
    for y = 0 : m - 1
        for x = 0 : n - 1
            % Apply the inverse transformation on (x, y) and calculate x_p and y_p
             % of the initial image space.
            Temp = T_inv*[x;y];
            x_p = Temp(1);
            y_p = Temp(2);
            x_p = x_p+1;
            y_p = y_p+1;
            % If xp or yp is outside the image,
             % put a black pixel and move on.
            if x_p>n || x_p<1 || y_p >m || y_p<1
              R(y+1, x+1) = 0;
              continue;
            endif
            
            x1 = floor(x_p);
            y1 = floor(y_p);
            x2 = x1 + 1;
            y2 = y1 + 1;
            
            % Calculate the interpolation coefficients denoted by a

            a = proximal_coef(I, x1, y1, x2, y2);
            R(y+1, x+1) =  a(1) + a(2)*x_p + a(3)*y_p + a(4)*x_p*y_p;
        endfor
    endfor

    R = uint8(R);
endfunction
