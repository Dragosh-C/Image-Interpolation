function a = proximal_coef(f, x1, y1, x2, y2)
    % =========================================================================
    % Calculates the coefficients for Proximal Interpolation between points
     % (x1, y1), (x1, y2), (x2, y1) and (x2, y2).
    % =========================================================================
    
    A =[1 x1 y1 x1*y1;
        1 x1 y2 x1*y2;
        1 x2 y1 x2*y1;
        1 x2 y2 x2*y2];
           
    b = [f(y1, x1); f(y2, x1); f(y1, x2); f(y2, x2)];
    
    % Calculate the coefficients.
    a = A\double(b);
endfunction
