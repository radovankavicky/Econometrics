clear all
data = xlsread('nerlove1.csv');

costs = data(:,1);
kwh  = data(:,2);
avc = costs ./ kwh * 1000;

%plot(costs, kwh, '.');
%xlabel('costs');
%ylabel('kwh');

plot(log(avc), kwh, '.');
xlabel('log(avc)');
ylabel('kwh');

n  = length(costs);
y = costs;
X = [ones(n,1) kwh];

[beta, e, se, Sigma, ssr, sse, sst, R2, R2bar] = myols(y, X);

plot(e,'.');
ylabel('residual');

plot(e, kwh, '.');
xlabel('residual');
ylabel('kwh');


%n  = length(income);
%y = log(income);
%X = [ones(n,1) edu expr];

%myols(y, X);