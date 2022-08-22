% @brief Function to calculate the derivate images
%
% @param img the greyscaled image to find all derivative images
%
% @return all the greyscaled derivative images
function [img_x, img_y, img_xy] = compute_diffs(img)
    
    % Extract the image dimensions
    [m, n, nr_colors] = size(img);

    % Check if the image is a greyscaled image
    if nr_colors > 1
        img_x = -1;
        img_y = -1;
        img_xy = -1;
        return
    end
    
    % Convert image matrix to a double matrix.
    img = double(img);
    
    % Initialize derivate image after x variable
    img_x = zeros(m, n);
    
    % Iterate through every valid pixel
    for iter_y = 1 : m
      for iter_x = 2 : n - 1
        img_x(iter_y, iter_x) = diff_x(img, iter_x, iter_y);
      end
    end
    
    % Initialize derivate image after y variable
    img_y = zeros(m, n);
    
    % Iterate through every valid pixel
    for iter_y = 2 : m - 1
      for iter_x = 1 : n
        img_y(iter_y, iter_x) = diff_y(img, iter_x, iter_y);
      end
    end
    
    % Initialize derivate image after xy variable
    img_xy = zeros(m, n);
    
    % Iterate through every valid pixel
    for iter_y = 2 : m - 1
      for iter_x = 2 : n - 1
        img_xy(iter_y, iter_x) = diff_xy(img, iter_x, iter_y);
      end
    end
end
