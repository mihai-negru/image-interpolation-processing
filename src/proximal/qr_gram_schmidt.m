% @brief Function to compute the QR decomposition using gram schmidt method
% Q is an orthogonal matrix by MxN dimension (the same dimesions as input
% matrix) and R is a superior tiungular sqaure matrix by NxN dimension
%
% @param A the input matrix to calculate the QR decomposition
%
% @return Q an orthogonal matrix
%
% @return R a superiror triungular sqaure matrix
function [Q, R] = qr_gram_schmidt(A)
    
    % Get matrix dimensions
    [M, N]= size(A);

    % Initialize R and Q matrices
    R = zeros(N);
    Q = zeros(M, N);

    % Gram-Schmidt Algorithm
    for iter_i = 1 : N
        R(iter_i, iter_i) = norm(A(:, iter_i), 2);

        Q(:, iter_i) = A(:, iter_i) ./ R(iter_i, iter_i);

        for iter_j = iter_i + 1 : N
            R(iter_i, iter_j) = (Q(:, iter_i)') * A(:, iter_j);
            A(:, iter_j) = A(:, iter_j) - Q(:, iter_i) .* R(iter_i, iter_j);
        end
    end
end