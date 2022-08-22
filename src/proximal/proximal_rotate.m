% @brief Function to rotate a greyscaled image by a rotation angle using
% proximal interpolation
%
% @param in_img greyscaled image to rotate
%
% @param rotation_angle angle to rotate the image anticlockwise
%
% @return out_img rotated greyscaled input image
function [out_img] = proximal_rotate(in_img, rotation_angle)
    % =========================================================================
    % Roteste imaginea alb-negru I de dimensiune m x n cu unghiul rotation_angle,
    % aplic�nd Interpolare Proximala.
    % rotation_angle este exprimat �n radiani.
    % =========================================================================
    
    % Extract input image dimensions
    [m, n, nr_colors] = size(in_img);
    
    % Function works just for greyscaled images
    if nr_colors > 1
        out_img = -1;
        return
    end
    
    % Compute sine and cosine of the rotation angle
    s_phi = sin(rotation_angle);
    c_phi = cos(rotation_angle);
    
    % Initialize the rotated greysclaed image
    out_img = zeros(m, n);
    
    % Iterate through every pixel
    for iter_y = 0 : m - 1
        for iter_x = 0 : n - 1
          
            % Compute the initial pixel points
            x_p = c_phi .* iter_x + s_phi .* iter_y + 1;
            y_p = -s_phi .* iter_x + c_phi .* iter_y + 1;
         
            % Check if the calculated pixel is a valid one
            if (x_p <= n) && (x_p >= 1) && (y_p <= m) && (y_p >= 1)
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
              
              % Compute the interpolation factors
              fact = proximal_interpolation_fact(in_img, x1, y1, x2, y2);

              % Compute the interpolated pixel
              out_img(iter_y + 1, iter_x + 1) = fact(1) + fact(2) .* x_p + fact(3) .* y_p + fact(4) .* x_p .* y_p;  
            end
        end
    end

    % Transform the result matrix into a valid image matrix
    out_img = uint8(out_img);
end
