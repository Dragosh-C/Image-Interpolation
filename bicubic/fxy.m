function r = fxy(f, x, y)
    % =========================================================================
    % Approximate the x and y derivative of f at the point (x, y).
    % =========================================================================
    
    r = double((f(x-1, y-1) + f(x+1, y+1) - f(x+1, y-1) - f(x-1, y+1)) / 4);
endfunction
