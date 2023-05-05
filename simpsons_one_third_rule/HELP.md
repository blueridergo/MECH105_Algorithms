# Simpson.m
### *A MATLAB function to evaluate the inegral of a numerical function using Simpson's 1/3 rule.*
**INPUTS:**
* x -> a vector containing equally spaced values
* y -> a vection of function values at all the values of x

**OUTPUTS:**
* I -> the value of the integral

**EXAMPLE**  
*Note: x and y must be of equal length*  

x = [1 2 3 4 5];  
y = [1 4 9 16 25];  

[I] = Simpson(x,y)