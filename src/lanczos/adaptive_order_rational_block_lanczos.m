function [A_m, B_m, C_m] = adaptive_order_rational_block_lanczos(A, B, C, sigma1, sigma2, tol)
  [~, p] = size(B);
  
  H_0 = ones(p);
  
  eps = 1;
  m = 1;
  
  sigma_m = [sigma1, sigma2];
  
  while eps > tol
    
    [V_m, W_m] = rational_block_lanczos(A, B, C, sigma_m);
    
    A_m = W_m' * A * V_m;
    B_m = W_m' * B;
    C_m = C * V_m;
    
    H = transfer_function_lanczos(A_m, B_m, C_m, m);
    
    if H == -1
      break;
    end
    
    eps = norm(H - H_0, Inf);
    
    H_0 = H;
    
    m = m + 1;
  end
end