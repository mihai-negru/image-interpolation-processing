% @brief Function to compute the approximation of derivate of a function in
% (x, y) point after x variable
%
% @param img function to approximate derivate after x variable
%
% @param x Ox point of the function to approximate the derivate
%
% @param y Oy point of the function to approximate the derivate
function [diff] = diff_x(img, x, y)
    diff = (img(y, x + 1) - img(y, x - 1)) ./ 2;
end