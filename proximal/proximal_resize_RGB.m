function out = proximal_resize_RGB(img, p, q)
    % =========================================================================
    % Resize the img image so that this save is of p x q size.
     % The img image is colored.
    % =========================================================================

    % Extract RGB chanels
    R = img(:, :, 1);
    G = img(:, :, 2);
    B = img(:, :, 3);
    
    % Apply the proximal function on the 3 channels of the image.
    R_matrix = proximal_resize(R, p,q);
    G_matrix = proximal_resize(G, p,q);
    B_matrix = proximal_resize(B, p,q);
    % It forms the final image by concatenating the 3 color channels.
    out = cat(3, R_matrix, G_matrix, B_matrix);
endfunction
