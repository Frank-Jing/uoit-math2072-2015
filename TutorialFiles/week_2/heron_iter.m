
function heron_iter(A, x0, iter)
%%%%%%
% Function to find the square root of a number using Heron (Babilonian)
% algorithm.
%input: A = number we want to square root of
%       x0 = initial guess 
%       iter = max number of iteration desired   
%output x = computed square root
%%%%%%
x_true = sqrt(A)
x = x0;
for jj = 1:iter
    x = 0.5 * (x + A/x);
end
x_heron = x
end