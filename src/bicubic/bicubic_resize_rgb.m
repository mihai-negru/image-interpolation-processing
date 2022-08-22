% @brief Function to rescale a rgb image from m x n dimensions
% to p x q dimensions using bicubic interpolation
%
% @param in_img rgb image to resize
%
% @param p, q new dimensions of the input image
%
% @return out_img resized rgb input image
function [out_img] = bicubic_resize_rgb(in_img, p, q)

    % Extract red channel from image
    red = in_img(:, :, 1);
   
    % Extract green channel from image
    green = in_img(:, :, 2);
    
    % Extract blue channel from image
    blue = in_img(:, :, 3);
    
    % Resize the red channel
    out_img = bicubic_resize(red, p, q);
    
    % Resize the green channel
    out_img(:, : , 2) = bicubic_resize(green, p, q);
    
    % Resize the blue channel
    out_img(:, : , 3) = bicubic_resize(blue, p, q);
end
