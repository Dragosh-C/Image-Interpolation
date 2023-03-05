function out = bicubic_resize_RGB(img, p, q)
    % =========================================================================
    % Resize the img image so that this save is of p x q size.
    % The img image is colored.
    % =========================================================================

   % Extract the red channel of the image.
    R = img(:, :, 1);
    % Extract the green channel of the image.
    G = img(:, :, 2);
    % Extract the blue channel of the image.
    B = img(:, :, 3);
    % Apply the bicubic function to the 3 channels of the image.
    
    R_matrix = bicubic_resize(R, p, q);
    G_matrix = bicubic_resize(G, p, q);
    B_matrix = bicubic_resize(B, p, q);
    % Forms the final image concatenating the 3 color channels.
    out = cat(3, R_matrix, G_matrix, B_matrix);
endfunction
