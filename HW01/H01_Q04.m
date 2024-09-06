%Brookes HeilBlackburn
%H01_Q04

% approximating the number of iterations required to
% achieve an error below a threshold, given values for the convergence order α and the
% asymptotic error constant λ.

% initialize the e vector
e = [];

% initialize counter vector and error estimate vector
counter = [];
error_estimates = [];

% request input from user for a 
%   number to find square root of, starting 
%   estimate of square root, 
%   error tolerance, 
%   maximum number of iterations
error_estimates(1) = input('Enter a value for e1: ');
error_estimates(2) = input('Enter a value for e2: ');
error_estimates(3) = input('Enter a value for e3: ');
fAlpha = input('Enter a value for alpha: ');
fLamda = input('Enter a value for lambda: ');
fEpsilon = input('Enter a value for epsilon: ');

% initialize counter and eHat estimate variables
n = 3;
counter(1) = n;

while error_estimates(n) > fEpsilon && n < 100
    % Calculate error estimate for n+1
    error_estimates(n+1) = fLamda * (error_estimates(n)^fAlpha);

    % Print the error (before incrementing n)
    fprintf('n =  %d gives e(  %d ) = %.2e\n',n, n+1, error_estimates(n + 1))
 
    % Increment counter nH01_004
    n = n + 1;

    % update counter & error_estimate vector
    counter(n) = n;
end
fprintf('We expect approximately %d iterations to be required\n', counter(n))

