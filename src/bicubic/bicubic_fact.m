% @brief Function to compute the interpolation bicubic factors of one image
%
% @param img image to calculate its bicubic factors
%
% @param img_x the derivate image after x variable
%
% @param img_y the derivate image after y variable
%
% @param img_xy the derivate image after xy variable
%
% @param (x1, y1) first point of the bicubic factor
%
% @param (x2, y2) second point of the bicubic factor
%
function [fact] = bicubic_fact(img, img_x, img_y, img_xy, x1, y1, x2, y2)
    
    % Compute free matrix of factors
    free_fact = [1, 0, 0, 0; 0, 0, 1, 0; -3, 3, -2, -1; 2, -2, 1, 1];
    
    % Convert the matrix to double
    free_fact = double(free_fact);
    
    % Compute the matrix of the unknown factors
    un_fact = [img(y1, x1), img(y2, x1), img_y(y1, x1), img_y(y2, x1);
         img(y1, x2), img(y2, x2), img_y(y1, x2), img_y(y2, x2);
         img_x(y1, x1), img_x(y2, x1), img_xy(y1, x1), img_xy(y2, x1);
         img_x(y1, x2), img_x(y2, x2), img_xy(y1, x2), img_xy(y2, x2);];
         
    % Convert the matrix to double
    un_fact = double(un_fact);
    
    % Compute the interpolation matrix
    fact = free_fact * un_fact * free_fact';
end