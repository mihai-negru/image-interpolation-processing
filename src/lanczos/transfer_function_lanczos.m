function [H] = transfer_function_lanczos(A, B, C, s)
  % Compute dimensions of the input square matrix
  [N, ~] = size(A);
  
  if cond(s * ones(N) - A) > 1
    % Matrix s * I - A is singular
    H = -1;
  else
    % Compute transfer function
    H = (C \ (s * ones(N) - A)) * B;
  end
end