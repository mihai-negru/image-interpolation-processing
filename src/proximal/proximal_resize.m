% @brief Function to rescale a greyscale image from m x n dimensions
% to p x q dimensions using proximal interpolation
%
% @param in_img greyscaled image to resize
%
% @param p, q new dimensions of the input image
%
% @return out_img resized greyscaled input image
function [out_img] = proximal_resize(in_img, p, q)
    
    % Extract the dimensions of the input image
    [m, n, nr_colors] = size(in_img);

    % Image has to be greyscaled
    if nr_colors > 1
        out_img = -1;
        return
    end

    % Initialize the rescaled image
    out_img = zeros(p, q);
    
    % Compute scaling factors
    s_x = (n - 1) ./ (q - 1);
    s_y = (m - 1) ./ (p - 1);
    
    % Iterate through every pixel from image
    for iter_y = 0 : p - 1
        for iter_x = 0 : q - 1
            
            % Compute the orthogonal transformation
            x_p = round(iter_x .* s_x + 1);
            y_p = round(iter_y .* s_y + 1);

            % Set the resulting pixel with the most closing pixel
            % from the original image
            out_img(iter_y + 1, iter_x + 1) = in_img(y_p, x_p);
        end
    end

    % Transform the matrix into a valid image matrix
    out_img = uint8(out_img);
end
