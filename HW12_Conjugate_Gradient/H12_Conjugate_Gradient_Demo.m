% Brookes HeilBlackburn
% DEMO - H12_Q02 - Conjugate Gradient Method for solving SLE
% Conjugate Gradient Method for Ax = b.

clear; clc; clf; cla;

    A=[ 4 2 0 ; 2 10 3 ; 0 3 5 ];
    b=[ 0.0 ; -9.0 ; 9.0 ];
    x0=[ 0.0 ; 0.0 ; 0.0 ];
    epsilon=1e-6;
    maxk=30;
    normType=1;

    [x, residual, residualNorm, counter, loop_count, lambda, alpha] = ...
    H12_Function_Conjugate_Gradient(A, b, x0, epsilon, maxk, normType);

    fprintf('Initialization \n');
    fprintf('x( 1 ) = [ %.6f ; %.6f ; %.6f ]\n', x(1,1), x(2,1), x(3,1));
    fprintf('|| r( 1 ) || = %.1e\n', residualNorm(1));
    fprintf('d( 1 ) = [ %.6f ;  %.6f ;  %.6f ]\n', -residual(1,1),...
        -residual(2,1), -residual(3,1));

    for k = 1:loop_count-1
        fprintf('k = %d \n', k);
        fprintf('lambda ( %d ) = %.2f\n', k, lambda(k));
        fprintf('x( %d ) = [ %.6f ; %.6f ; %.6f ]\n', k+1, x(1,k+1), ...
            x(2,k+1), x(3,k+1));
        fprintf('|| r( %d ) || = %.1e\n', k+1, residualNorm(k+1));
        fprintf('alpha( %d ) = %.2f\n', k, alpha(k));
    end

if residualNorm(end) >= epsilon
    fprintf('Error: The conjugate gradient method did not converge\n')
else
    plotdivergence(residualNorm, counter, size(x,2));
end

%% Plot
function plotDivergence = plotdivergence(residualNormPlot, counter, maxk)
    figure(1);
    semilogy(counter, residualNormPlot);
    title('Conjugate Gradient Method');
    xlim([1,maxk]);
    xlabel('n');
    ylabel( '$\left\| \mathbf{r}^k \right\|_\infty$', 'interpreter', 'latex' );
end

% If run to seek user input
    % A = input('Enter an n x n matrix A: ');
    % b = input('Enter an n x 1 vector b: ');
    % x = input('Enter an n x 1 initial guess vector x1: ');
    % epsilon = input('Enter a value for epsilon: ');
    % maxk = input('Enter a maximum value for k: ');
    % normType = input('Enter the norm type (1 for L2, 2 for infinity): ');
    
