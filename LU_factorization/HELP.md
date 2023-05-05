# luFactor.m
### *A MATLAB function that performs LU decomposition with pivoting on a given matrix.*
**INPUTS:**
* A -> the matrix to perform LU decomposition on

**OUTPUTS:**
* L -> the lower triangular matrix
* U -> the upper triangular matrix
* P -> the pivot matrix

**EXAMPLE**
*Note: A must be a square matrix*

A = [1 2 3; 4 5 6; 7 8 9;]

[L, U, P] = luFactor(A)