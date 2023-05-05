# falsePosition.m
## *A MATLAB function to calculate the root of function using the false position method.*
**INPUTS:**
* func -> the function to be evaluated
* xl -> lower bound
* xu -> upper bound
* es -> stopping criterion (error)
* maxit -> specifies a maximum number of interations

**OUTPUTS:**
* root -> the value of the root
* fx -> the function value at the root
* ea -> the calculated approximate error
* inter -> the interation count

**EXAMPLE**
func = @(x) x.^2 + 2*x
xl = -1;
xu = 1;
es = 0.1;
maxit = 5;

[root, fx, ea, iter] = falseposition(func, xl, xu, es, maxit)
