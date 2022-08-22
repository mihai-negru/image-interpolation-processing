% @brief Function to apply the proximal interpolation on a image of 2 x 2
% dimension with 4 equidistant points. The input image is known in the
% following points (1, 1), (1, 2), (2, 1), (2, 2)
%
% @param in_img image that will be interpolated
%
% @param step distance between two successive points
%
% @return out_img initial image interpolated
function [out_img] = proximal_interpolation_2x2(in_img, step)

    % Set the all pixels
    pixel_x = 1 : step : 2;
    pixel_y = 1 : step : 2;
    
    % Find the number of pixels
    pixel_dim = length(pixel_x);
    
    % Initialize the result image
    out_img = zeros(pixel_dim);

    % Iterate through every pixel
    for iter_i = 1 : pixel_dim
        for iter_j = 1 : pixel_dim

            % Compute the distances of the points
            dist1 = abs(pixel_y(iter_j) - 1);
            dist2 = abs(pixel_y(iter_j) - 2);
            dist3 = abs(pixel_x(iter_i) - 1);
            dist4 = abs(pixel_x(iter_i) - 2);
            
            % Find the smallest distance from the pixel
            if dist1 < dist2
              if dist3 < dist4
                out_img(iter_i,iter_j) = in_img(1, 1);
              else
                out_img(iter_i,iter_j) = in_img(2, 1);
              end
            else
              if dist3 < dist4
                out_img(iter_i,iter_j) = in_img(1, 2);
              else
                out_img(iter_i,iter_j) = in_img(2, 2);
              end
            end    
        end
    end
end