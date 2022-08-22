% @brief Function to compute the approximation of derivate of a function in
% (x, y) point after y variable
%
% @param img function to approximate derivate after y variable
%
% @param x Ox point of the function to approximate the derivate
%
% @param y Oy point of the function to approximate the derivate
function [diff] = diff_y(img, x, y)
    diff = (img(y + 1, x) - img(y - 1, x)) ./ 2;
end