% Brookes HeilBlackburn
% FXN - H12_Q02 - Conjugate Gradient Method for solving SLE
% Conjugate Gradient Method for Ax = b.


function [x, residual, residualNorm, counter, loop_count, lambda, alpha] = ...
    H12_Q02_clean(A, b, x0, epsilon, maxk, normType)

    % Preallocate
    n = length(A);
    x = zeros(n, maxk+1);
    counter = zeros(1, maxk+1); counter(1) = 1;
    residual = zeros(n, maxk+1);
    d = zeros(n, maxk+1);
    residualNorm = zeros(1, maxk+1);
    lambda = zeros(1, maxk);     
    alpha  = zeros(1, maxk);     
    
    % Format Specifier
    formatSpec = repmat('%.1e ', 1, length(A));
    formatSpecRes = repmat('%.1e ', 1, length(A));
    formatSpecRes = [formatSpecRes, '\n'];
    
    % Calculate residual and residual Norm
    x(:,1) = x0;
    residual(:,1) = (A * x(:,1)) - b;
    d(:,1) = -residual(:,1);
    residualNorm(1) = Norm(normType, residual(:,1));

    k = 1;
    while residualNorm(:,k) > epsilon && k < maxk
        gamma = (A * d(:, k) );
        lambda(k) = (-1 * (transpose(d(:, k)) * residual(:, k)) ) / ...
            (transpose(d(:, k)) * gamma);
        x(:, k+1) = x(:, k) + (lambda(k) * d(:, k));

        residual(:, k+1) = residual(:, k) + (lambda(k) * gamma);
        residualNorm(k+1) = Norm(normType,residual(:, k+1));

        alpha(:,k) = ( transpose(residual(:, k+1)) * A * d(:, k) ) / ...
            (transpose(d(:, k)) * A * d(:, k));
        d(:, k+1) = -residual(:, k+1) + (alpha(:, k) * d(:, k));

        k = k + 1;
        counter(k) = k;
    end

    loop_count = k;

    % Trim
    x            = x(:,1:loop_count);
    residual     = residual(:,1:loop_count);
    residualNorm = residualNorm(1:loop_count);
    counter      = counter(1:loop_count);
    lambda       = lambda(1:loop_count-1);
    alpha        = alpha(1:loop_count-1);
end

%% Norm Function
function resNorm = Norm(t, res)
sum_squares_res = 0;
    if t == 1
        % Calculate l_2 Norms
        for p = 1 : length(res)
            sum_squares_res = ((res(p)^2) ) + sum_squares_res;
            resNorm = (sqrt(sum_squares_res)); 
        end
    else
    % Calculate L_Inf Norm
        resNorm = max(abs(res));
    end
end






