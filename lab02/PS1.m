clear all
data = xlsread('cgss05.csv');

income = data(:,1);
edu = data(:,6);
expr = data(:,7);

n  = length(income);
y = log(income);
X = [ones(n,1) edu expr];

myols(y, X);
%plot()