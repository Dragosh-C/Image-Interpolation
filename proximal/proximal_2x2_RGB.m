function out = proximal_2x2_RGB(img, STEP = 0.1)
    % ==============================================================================================
    % Apply Proximal Interpolation on the 2 x 2 image defined by img with equidistant intermediate 						points.
     % img is an RGB colored image - Red, Green, Blue.
    % =============================================================================================

    % Extract red channel
    R = img(:, :, 1);
    % Extract green channel
    G = img(:, :, 2);
    % Extract blue channel
    B = img(:, :, 3);
    
    
    % Apply the proximal function on the 3 image channels.
    R_matrix = proximal_2x2(R, STEP);
    G_matrix = proximal_2x2(G, STEP);
    B_matrix = proximal_2x2(B, STEP);
    % Forms the final image by concatenating the 3 color channels.
    out = cat(3, R_matrix, G_matrix, B_matrix);
endfunction
