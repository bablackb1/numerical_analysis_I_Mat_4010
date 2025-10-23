%Brookes HeilBlackburn
%MAT 4010 - H11_Q03 - Jacobi SLE

clear; clc; clf; close ALL
% function[] = H11_Q03
    % Inputs
    A=[ 4 2 0 ; 2 10 3 ; 0 3 5 ];
    b=[ 0 ; -9 ; 9 ];
    x=[ 0 ; 0 ; 0 ];
    epsilon=1e-6;
    maxk=30;
    normType=1;
        
    n = length(A);
    xNew = zeros(size(x));
    counter(1) = 1;
    
    % Format Specifier
    formatSpec = repmat('%.1e ', 1, length(A));
    % formatSpec = [formatSpec, ''];
    
    formatSpecRes = repmat('%.1e ', 1, length(A));
    formatSpecRes = [formatSpecRes, '\n'];
    
    % Calculate residual and residual Norm
    residual = (A * x) - b;
    residualNorm = Norm(normType,residual);
    
    for k = 1:maxk
        fprintf("k = %d, ",k);
        disp(strrep(['xk = [' sprintf(' %0.1f ; ', x) ']'], '; ]', sprintf('], ||rk|| = %0.1e',residualNorm(k))));  
        xNew = x;
        for i = 1:n
            component = 0;
            component2 = 0;
    
            for j = 1 : (i - 1)
                component = component + ( A(i, j) * x(j) );
            end
            
            for m = (i + 1) : n
                component2 = component2 + ( A(i, m) * x(m) );
            end
            
            if A(i,i) ~= 0
                xNew(i) = ((1/A(i,i)) * ( b(i) - component - component2 ));
            end
        end
        x = xNew;    
        residual = (A * x) - b;    
        residualNorm(k+1) = Norm(normType,residual);
        counter(k) = k;
        if residualNorm(k) < epsilon
            plotdivergence(residualNorm(1:length(counter)), counter, maxk);
            break
        end
    end
    if residualNorm >= epsilon
        fprintf('Error: The Jacobi method did not converge')
    end
% end




%% Norm Function
function resNorm = Norm(t, res)
sum_squares_res = 0;
    if t == 1
        % Calculate l_2 Norms
        for p = 1 : length(res)
            % l_2 residual vector norm
            sum_squares_res = (double(res(p)^2) ) + sum_squares_res;
            resNorm = double(sqrt(sum_squares_res)); 
        end
    else
    % Calculate L_Inf Norm
        resNorm = max(abs(res));
    end
end

%% Plot
function plotDivergence = plotdivergence(residualNormPlot, counter, maxk)
    figure(1);
    semilogy(counter, residualNormPlot);
    title('Jacobi Method');
    xlim([1,maxk]);
    xlabel('n');
    ylabel( '$\left\| \mathbf{r}^k \right\|_\infty$', 'interpreter', 'latex' );
end

%% If Input from user
    % A = input('Enter an n x n matrix A: ');
    % b = input('Enter an n x 1 vector b: ');
    % x = input('Enter an n x 1 initial guess vector x1: ');
    % epsilon = input('Enter a value for epsilon: ');
    % maxk = input('Enter a maximum value for k: ');
    % normType = input('Enter the norm type (1 for L2, 2 for infinity): ');
