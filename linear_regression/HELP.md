# linearRegression.m
### *A MATLAB function to compute the linear regression of a data set.*
**INPUTS:**
* x -> the x-values
* y -> the y-values

**OUTPUTS:**
* fX -> x-values with outliers removed
* fY -> y-values with outliers removed
* slope -> slope of the linear regression
* intercept: intercept of the linear regression
* Rsquared -> coefficient of determination

**EXAMPLE:**
*Note: the sizes of x and y must be the same*

x = [1 3 5 7];
y = [2 1 4 6];

[fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)