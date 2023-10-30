function [L,U,d,x] = luDecompose(A,b)
    [L,U] = lu(A);
    d = mldivide(L,b);
    x = mldivide(U,d);
end
%A is a square matrix, b is a column matrix