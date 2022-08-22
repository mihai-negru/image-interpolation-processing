% @brief Function to rescale a greyscale image from m x n dimensions
% to p x q dimensions using bicubic interpolation
%
% @param in_img greyscaled image to resize
%
% @param p, q new dimensions of the input image
%
% @return out_img resized greyscaled input image
function [out_img] = bicubic_resize(in_img, p, q)

    % Get image dimensions
    [m, n, nr_colors] = size(in_img);
    
    % Convert image matrix to a double matrix
    in_img = double(in_img);
    
    % Initialize the output matrix
    out_img = zeros(p, q);
    
    % Check if image is a greyscaled one
    if nr_colors > 1
        out_img = -1;
        return
    end

    % Compute the scaling factors of the image
    s_x = (n - 1) ./ (q - 1);
    s_y = (m - 1) ./ (p - 1);

    % Compute derivative images
    [img_x, img_y, img_xy] = compute_diffs(in_img);
    
    % Iterate through every pixel from image
    for iter_y = 0 : p - 1
        for iter_x = 0 : q - 1

            x_p = iter_x .* s_x + 1;
            y_p = iter_y .* s_y + 1;
 
            x1 = floor(x_p);
            y1 = floor(y_p);
            
            if (x1 == n)
              x2 = n - 1;
            else
              x2 = x1 + 1;
            end
              
            if (y1 == m)
              y2 = m - 1;
            else
              y2 = y1 + 1;
            end
            
            % Compute interpolation bicubic factors
            bic_fact = bicubic_fact(in_img, img_x, img_y, img_xy, x1, y1, x2, y2);
            
            x_p = x_p - x1;
            y_p = y_p - y1;
            
            % Compute the interpolation pixel
            for i = 0 : 3
              for j = 0 : 3
                out_img(iter_y + 1, iter_x + 1) = out_img(iter_y + 1, iter_x + 1) + bic_fact(i + 1, j + 1) .* (x_p .^ i) .* (y_p .^ j);
              end
            end
        end
    end

    % Convert matrix to a valid image matrix
    out_img = uint8(out_img);
end





