function r = fy(f, x, y)
    % =========================================================================
    % Approximates the y-derivative of f at the point (x, y).
    % =========================================================================
    
    % TODO: Calculeaza derivata.
     r = double((f(x, y+1) - f(x, y-1)) / 2);
endfunction
