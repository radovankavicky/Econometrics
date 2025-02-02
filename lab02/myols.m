function [beta, e, se, Sigma, ssr, sse, sst, R2, R2bar] = myols(y, X)
[n, m] = size(X);

beta = (X'*X)\X' * y;
e = y - X * beta;
ssr = e' * e;
s2 = ssr/(n-m);
Sigma = s2*inv(X'*X);
se = sqrt(diag(Sigma));
sst = ((y-mean(y))'*(y-mean(y)));
sse = sst - ssr;
R2 = 1 - ssr/sst;
R2bar = 1-(ssr/(n-m))/(sst/(n-1));

if nargout == 0
    disp('  Estimate   S.E.');
    disp([beta se]);
    disp(['R2 = ' num2str(R2)])
    disp(['SSR = ' num2str(ssr)])
    
end