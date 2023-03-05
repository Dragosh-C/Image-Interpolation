function out = proximal_2x2(f, STEP = 0.1)
    % ===================================================================================
    % Apply Proximal Interpolation to the 2 x 2 f image with equidistant intermediate points.
     % f has known values at the points (1, 1), (1, 2), (2, 1) and (2, 2).
     % Parameters:
     % - f = the image to be interpolated;
     % - STEP = distance between two successive points.
    % ===================================================================================
    
    % Defines the x and y coordinates of the intermediate points
    x_int = y_int = 1: STEP: 2;
 
    n = length(x_int);

    x1 = y1 = 1;
    x2 = y2 = 2;
    matrix = zeros(n);
    
    % Goes through every pixel in the final image.
    for i = 1 : n
        for j = 1 : n
            % Find the closest pixel in the original image.
           if x_int(i) - x1 < x2 - x_int(i) 
              x_pix = x1;
            else
              x_pix = x2;
            endif
             
            if y_int(j) - y1 < y2 - y_int(j)
              y_pix = y1;
            else
              y_pix = y2;
            endif
  
            % Calculates the pixel in the final image.
             matrix(i, j) = f(x_pix, y_pix);
        endfor
    endfor
out = matrix;
endfunction
