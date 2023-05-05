function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

%check to see if x and y have the same number of values
if length(x) ~= length (y)
    error("X and Y have different numbers of values.")
end

%store the original values
yold = y;
xold = x;

%sort the x and y values
[y, sortOrder] = sort(y);
x = x(sortOrder);

%assign the number of values to a variable, n
n = length(x);

%calculate 1st and 3rd quartile indices
Qi1 = floor((n+1)/4);
Qi3 = floor((3*n+3)/4);

%find the values of y at the 1st and 3rd quartile indices
Q1 = y(Qi1)
Q3 = y(Qi3)

%determine the interquartile range
IQR = Q3 - Q1

fX =[];
fY = [];

%filter out outliers in the data set
for i = 1:n
    if y(i) >= Q1 - 1.5*IQR && y(i) <= Q3 + 1.5*IQR
       fY = [fY y(i)];
       fX = [fX x(i)]; 
    end
end

x = fX;
y = fY;
%update n to the length of the filtered x vector
n = length(y);

%values to use in a1 and a0 calculations
sxy = sum(x.*y);
sx = sum(x);
sy = sum(y);
sx2 = sum(x.^2);
sy2 = sum(y.^2);

%calculate a1 and a0 values
a1 = (n*sxy-sx*sy)/(n*sx2-sx^2);
a0 = mean(y)-a1*mean(x);

%calculate R^2 value
st = sum((y-mean(y)).^2);
sr = sum((y - a0 - a1.*x).^2);

%assigning the correspoinding values to function outputs
format long
slope = a1;
intercept = a0;
Rsquared = (st-sr)/st;
disp(fX)
end