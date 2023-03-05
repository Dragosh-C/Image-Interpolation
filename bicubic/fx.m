function r = fx(f, x, y)
    % =========================================================================
    % Approximates the x-derivative of f at the point (x, y).
    % =========================================================================

    % Calculate the derivative.
    r = double((f(x+1, y) - f(x-1, y)) / 2);
endfunction
