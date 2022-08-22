% @brief Function to compute the approximation of derivate of a function in
% (x, y) point after xy variable
%
% @param img function to approximate derivate after xy variable
%
% @param x Ox point of the function to approximate the derivate
%
% @param y Oy point of the function to approximate the derivate
function [diff] = diff_xy(img, x, y)
    diff = (img(y - 1, x - 1) + img(y + 1, x + 1) - img(y - 1, x + 1) - img(y + 1, x - 1)) ./ 4;
end