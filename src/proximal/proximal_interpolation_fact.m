% @brief Function to calculate the proximal interpolation factors needed
% for the rotation function of an image. The factors are calculated for
% input two points (x1, y1) and (x2, y2).
%
% @param in_img input greyscaled image to compute the interpolation factors
%
% @param x1, y1 coordonates of the first point
%
% @param x2, y2 coordonates of the second point
%
% @return fact a vector of size 4 with interpolation factors for rotation
function [fact] = proximal_interpolation_fact(in_img, x1, y1, x2, y2)

    % Number of factors
    factors_num = 4;
    
    % Initialize the interpolation matrix
    inter_mat = zeros(factors_num);
    
    % Set interpolation matrix
    inter_mat(:, 1) = 1;
    inter_mat([1,2], 2) = x1;
    inter_mat([3,4], 2) = x2;
    inter_mat([1,3], 3) = y1;
    inter_mat([2,4], 3) = y2;
    inter_mat(1, 4) = x1 .* y1;
    inter_mat(2, 4) = x1 .* y2;
    inter_mat(3, 4) = x2 .* y1;
    inter_mat(4, 4) = x2 .* y2;
    
    % Initialize free factors of the matrix 
    free_fact = zeros(factors_num, 1);
    
    % Set the free factors vector
    free_fact(1) = in_img(y1, x1);
    free_fact(2) = in_img(y2, x1);
    free_fact(3) = in_img(y1, x2);
    free_fact(4) = in_img(y2, x2);
    
    % Compute the QR decomposition for the interpolation matrix
    [Q, R] = qr_gram_schmidt(inter_mat);
    
    % Prepare the liniar system of equations
    free_fact = Q' * free_fact;
    
    % Initialize the vector of the interpolation factors
    fact = zeros(factors_num, 1);
    
    % Solve the superior triungular system of equations
    for iter_i = factors_num : -1 : 1
      line_sum = 0;
      for iter_j = iter_i + 1: factors_num
        line_sum = line_sum + R(iter_i,iter_j) .* fact(iter_j);
      end
      
      % Compute the interpolation factor
      fact(iter_i) = (free_fact(iter_i) - line_sum) ./ R(iter_i,iter_i);
    end
end
