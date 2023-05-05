function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
if nargin < 3
    error('input at least 3 arguments')
end

testVal = func(xl,varargin{:})*func(xu,varargin{:});
if testVal > 0
    error('no sign change detected')
end
if nargin < 4 || isempty(es)
    es = 0.0001;
end
if nargin < 5 || isempty(maxit)
    maxit = 200;
end

iter = 0;
xr = xl;
ea = 100;

while(1)
    prevEst = xr;
    xr = (xl + xu)/2;
    iter = iter + 1;
    
    if xr ~= 0
        ea = abs((xr-prevEst)/xr)*100;
    end
    
    testVal = func(xl,varargin{:})*func(xr,varargin{:});
    if testVal < 0
        xu = xr;
    elseif testVal > 0
        xl = xr;
    else
        ea = 0;
    end
    
    if ea <= es || iter >= maxit
        break
    end
end

root = xr;
fx = func(xr,varargin{:});