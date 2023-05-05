function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
xtrap = [0 0];

if length(x) ~= length(y)
    error("x is not the same length as y")
end

tf = isuniform(x);
if tf ~= 1
    error("x is not equally spaced")
end

%trap rule with 2 points
if length(x) == 2
    warning("trapezoidal rule will be used")
    I = (x(2)-x(1))/2*(y(1) + y(2));
    
%Simpson's rule with 3 points
elseif length(x) == 3

    b = x(length(x));
    a = x(1);
    h = b-a;

    I = h/(6)*(y(1) + 4*y(2) + y(3));
    
elseif rem(length(x),2) == 0
%keep track of the last two values of x and remove the last value from
%x afterwards
    xtrap = [x(length(x)-1) x(length(x))];
    x(length(x)) = [];

    warning("trapezoidal rule will be used on the last interval")
    
    %update the values used for the equation
    b = x(length(x));
    a = x(1);
    h = b-a;
    n = length(x) - 1;
    
    %use Simpson's 1/3 and trapezoid rule
    I = h/(3*n)*(y(1) + 4*sum(y(2:2:length(x)-1)) + 2*sum(y(3:2:length(x)-2)) + y(x==b)) + (xtrap(2)-xtrap(1))/2*(y(length(x)) + y(length(x) + 1));

else
%update the values used for the equation
    b = x(length(x));
    a = x(1);
    h = b-a;
    n = length(x) - 1;

    %use only Simpson's 1/3 rule
    I = h/(3*n)*(y(1) + 4*sum(y(2:2:length(x)-1)) + 2*sum(y(3:2:length(x)-2)) + y(x==b));

end
end