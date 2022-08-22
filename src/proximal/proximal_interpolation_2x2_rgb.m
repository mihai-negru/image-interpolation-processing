% @brief Function to apply the proximal interpolation on a rgb image of 2 x 2
% dimension with 4 equidistant points. The input image is known in the
% following points (1, 1), (1, 2), (2, 1), (2, 2)
%
% @param in_img rgb image that will be interpolated
%
% @param step distance between two successive points
%
% @return out_img initial rgb image interpolated
function [out_img] = proximal_interpolation_2x2_rgb(in_img, step)

    % Extract red channel from image
    red = in_img(:, :, 1);
   
    % Extract green channel from image
    green = in_img(:, :, 2);
    
    % Extract blue channel from image
    blue = in_img(:, :, 3);
    
    % Interpolate the red channel
    out_img = proximal_interpolation_2x2(red, step);
    
    % Interpolate the green channel
    out_img(:, : , 2) = proximal_interpolation_2x2(green, step);
    
    % Interpolate the blue channel
    out_img(:, : , 3) = proximal_interpolation_2x2(blue, step);
end
