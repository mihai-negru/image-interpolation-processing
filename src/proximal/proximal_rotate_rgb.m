% @brief Function to rotate a rgb image by a rotation angle using
% proximal interpolation
%
% @param in_img rgb image to rotate
%
% @param rotation_angle angle to rotate the image anticlockwise
%
% @return out_img rotated rgb input image
function out_img = proximal_rotate_rgb(in_img, rotation_angle)

    % Extract red channel from image
    red = in_img(:, :, 1);
   
    % Extract green channel from image
    green = in_img(:, :, 2);
    
    % Extract blue channel from image
    blue = in_img(:, :, 3);
    
    % Rotate the red channel
    out_img = proximal_rotate(red, rotation_angle);
    
    % Rotate the green channel
    out_img(:, : , 2) = proximal_rotate(green, rotation_angle);
    
    % Rotate the blue channel
    out_img(:, : , 3) = proximal_rotate(blue, rotation_angle);
end