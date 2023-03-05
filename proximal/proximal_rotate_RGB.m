function out = proximal_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Apply Proximal Interpolation to rotate an RGB image by a given angle.
    % =========================================================================
    
    R = img(:, :, 1);
    G = img(:, :, 2);
    B = img(:, :, 3);
    
    R_matrix = proximal_rotate(R, rotation_angle);
    G_matrix = proximal_rotate(G, rotation_angle);
    B_matrix = proximal_rotate(B, rotation_angle);
    
    out = cat(3, R_matrix, G_matrix, B_matrix);
    
endfunction
