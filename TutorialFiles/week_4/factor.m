function factor(x)
%%%
% input x is a vector: the size of the matrix A is going to be 
%the same as each entry of x
%Note: to see meaningful results, choose the entry of x to be big (>e+3)
%%%%
for ii=x
    %for the Choleski factorization we need A to be symmetric positive
    %definite:
    A = gallery('moler', ii);
    %Timing the lu decomposition
    tic;
    [L,U] = lu(A);
    toc
    %Timing the cholecki factorization
    tic;
    R = chol(A);
    toc
end
end