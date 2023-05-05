function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivoting
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix
row_count = height(A);
column_count = width(A);

%create P and U matrices
P_old = eye(row_count);
L = eye(row_count);
P = zeros(column_count);


U = zeros(column_count);
sorter = abs(A);
sorter_true = A;

if row_count ~= column_count
    error('A square matrix was not provided.')
end



%sort the matrix by pivoting
for i = 1:row_count
    maxval = max(sorter(:,1));
    row_address = find(sorter(:,1) == maxval);

    P(i,:) = P_old(row_address,:);

    U(i,:) = sorter_true(row_address,:);
    sorter(row_address,:) = 0;
end


r = 2;
c = 1;
ref_row = 1;

%perform LU factorization
for column = c:column_count
    for row = r:row_count

        factor = -1*(U(row,column)/U(ref_row,column));
        L(row,column) = -factor;
        U(row,:) = U(ref_row,:)*factor + U(row,:);

    end
    r = r + 1;
    ref_row = ref_row + 1;
end
end