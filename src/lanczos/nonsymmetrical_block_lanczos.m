function [T, V_m, W_m] = nonsymmetrical_block_lanczos(A, V, W, m)
  % Extract matrix dimensions
  [n, p] = size(V);
  
  % Initialize matrices that will form the Lanczos block
  alpha_m = zeros(p, p, m);
  delta_m = zeros(p, p, m);
  betta_m = zeros(p, p, m);
  
  V_m = zeros(n, p, m);
  W_m = zeros(n, p, m);
  
  % Compute QR decompossition for W^T * V
  [delta_m(:, :, 1), betta_m(:, :, 1)] = qr_gram_schmidt(W' * V);
  
  % Compute V1 and W1
  V_m(:, :, 1) = V * inv(betta_m(:, :, 1));
  W_m(:, :, 1) = W * delta_m(:, :, 1);
  
  % Compute V2 and W2 tilda
  V_tilda = A * V_m(:, :, 1);
  W_tilda = A' * W_m(:, :, 1);
  
  % Compute all the factors
  for j = 1 : m

    % Compute alpha_j factor
    alpha_m(:, :, j) = W_m(:, :, j)' * V_tilda;
    
    V_tilda = V_tilda - V_m(:, :, j) * alpha_m(:, :, j);
    W_tilda = W_tilda - W_m(:, :, j) * alpha_m(:, :, j)';
    
    % Compute all QR decompositions
    [V_m(:, :, j + 1), betta_m(:, :, j + 1)] = qr_gram_schmidt(V_tilda);
    [W_m(:, :, j + 1), delta_m(:, :, j + 1)] = qr_gram_schmidt(W_tilda);
    delta_m(:, :, j + 1) = delta_m(:, :, j + 1)';
    
    % Compute SVD decomposition for W_j ^T * V_j
    [U, S, Z] = svd(W_m(:, :, j + 1)' * V_m(:, :, j + 1));
    
    delta_m(:, :, j + 1) = delta_m(:, :, j + 1) * U * (S .^ (0.5));
    betta_m(:, :, j + 1) = (S .^ (0.5)) * Z' * betta_m(:, :, j + 1);
    
    V_m(:, :, j + 1) = V_m(:, :, j + 1) * Z * (inv(S) .^ (0.5));
    W_m(:, :, j + 1) = W_m(:, :, j + 1) * U * (inv(S) .^ (0.5));
    
    V_tilda = A * V_m(:, :, j + 1) - V_m(:, :, j) * delta_m(:, :, j + 1);
    W_tilda = A' * W_m(:, :, j + 1) - W_m(:, :, j) * betta_m(:, :, j + 1)';
  end
  
  T = zeros(m*p, m*p);
  
  % Set every block
  for j = 1 : m
    T((j - 1) * p + 1 : (j * p), (j - 1) * p + 1 : (j * p)) = alpha_m(:, :, j);
    
    if j ~= 1
      T((j - 1) * p + 1 : (j * p), (j - 2) * p + 1 : (j - 1) * p) = betta_m(:, :, j);
      T((j - 2) * p + 1 : (j - 1) * p, (j - 1) * p + 1 : (j * p)) = delta_m(:, :, j);
    end
  end
end