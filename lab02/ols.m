%%%%%work.m%%%%%
% Load data and assign variables:
load input.txt;
y = input(:, 2);
x = input(:, 3);
n = length(x);
X = [ones(n, 1) x]; % Regressor matrix
m = 2; % Number of regressors
% OLS estimate
beta_hat = inv(X'*X)*X'*y;
% Calculates regression statistics
e = y - X*beta_hat; %Estimated disturbances
ssr = e'*e; %SSR (Sum of Square Errors)
s2 = ssr/(n - m); %Estimate of sigma square 
var = inv(X'*X)*s2; %Variance of the OLS estimate
se = sqrt(diag(var)); %Standard Error of the estimates
% Report results
fid = fopen('output.txt', 'w');
fprintf(fid, '%f (%f)\n', [beta_hat se]');
fclose(fid);
%%%%%%End of work.m%%%%%%
