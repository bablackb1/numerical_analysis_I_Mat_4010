%Brookes HeilBlackburn
%H01_Q01

% Script to estimate the square root of a positive real

% initialize the x vector
x = [];

% initialize counter vector and error estimate vector
counter = [];
error_estimates = [];

% request input from user for a 
%   number to find square root of, starting 
%   estimate of square root, 
%   error tolerance, 
%   maximum number of iterations
a = input('Enter the value for a: ');
x(1) = input('Enter the value for x1: ');
fEpsilon = input('Enter the value for epsilon: ');
nMax = input('Enter the value for nMax: ');
actual_value = sqrt(a);

% initialize counter and eHat estimate variables
n = 1;
a_ferror_estimate = inf;
counter(1) = 1;


% Iterative Loop to populate 2 vectors with values of the estimate of 
% the square root & estimated error.  
% Continue iterating while the estimated error is greater than the 
% error tolerance & counter is less than the max value. 
% Both as specified by user.
while (a_ferror_estimate > fEpsilon) && (n < nMax)
    x(n + 1) = (x(n) + (a / x(n)))/2;
    a_ferror_estimate = abs(x (n + 1) - x(n));
    
    % increment counter
    n = n + 1;

    % populate counter and error estimate vector
    counter(n) = n;
    error_estimates(n) = a_ferror_estimate;

    % print output
    fprintf('For n =  %d, x(  %d ) =  %.2f and |eHat ( %d )| = %.2e\n', n, n, x(n), n, a_ferror_estimate)
end

% % Draw sqrt graph
% figure(1);
% plot(counter, x, LineWidth=2, LineStyle="--");
% yline(actual_value,'-',['\surd' num2str(actual_value)]);
% axis on;
% axis square;
% grid on;
% xlabel('n');
% txt = ['Value of sqrt ( ',num2str(a,'%.2f'),' )'];
% ylabel(txt);
% set(gca, 'colororder', winter);

% % plot estimated value of square root using semilogy
% figure(2);
% semilogy(counter,error_estimates);
% grid on;
% txt = ['Estimated Absolute Error in Approx of sqrt (  ',num2str(a,'%.2f'),' )'];
% yticks([10e-11 10e-6 10e-1])
% ylabel(txt, 'LineWidth', 3);
% set (gca, 'colororder', spring);


