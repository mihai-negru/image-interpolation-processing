function [V, W] = rational_block_lanczos(A, B, C, sigma_m)
  [n, ~] = size(B);
  
  m = length(sigma_m);
 
  C = C';
  
  S_k = inv(A - sigma_m(1) .* ones(n)) * B;
  R_k = inv(A - sigma_m(1) .* ones(n))' * C;
  
  [H_0, G_0] = qr_gram_schmidt(R_k' * S_k);
  
  V_k = S_k * inv(G_0);
  W_k = R_k * H_0;
  
  V = V_k;
  W = W_k;
  
  for k = 1 : m
    if k == m
      S_k = inv(A) * B;
      R_k = inv(A)' * C;
    else
      if (sigma_m(k + 1) == Inf)
        S_k = A * V_k;
        R_k = A' * W_k;  
      else
        S_k = inv(A - sigma_m(k + 1) * ones(n)) * V_k;
        R_k = inv(A - sigma_m(k + 1) * ones(n))' * W_k;
      end
    end
    
    H_k = W_k' * S_k;
    G_k = V_k' * R_k;
        
    S_k = S_k - V_k * H_k;
    R_k = R_k - W_k * G_k;

    [H_0, G_0] = qr_gram_schmidt(R_k' * S_k);
        
    V_k = S_k * inv(G_0);
    W_k = R_k * H_0;
        
    [P, D, Q] = svd(W_k' * V_k);
        
    V_k = V_k * Q * (inv(D .^ 0.5));
    W_k = W_k * P * (inv(D .^ 0.5));
        
    H_0 = (D .^ 0.5) * Q' * H_0;
    G_0 = (D .^ 0.5) * P' * G_0;
    
    V = cat(2, V, V_k);
    W = cat(2, W, W_k);
  end
end