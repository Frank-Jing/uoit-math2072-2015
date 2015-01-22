
function heron_tol(A, x0, tol)
%%%%%%
% Function to find the square root of a number using Heron (Babilonian)
% algorith.
%input: A = number we want to square root of
%       x0 = initial guess k = max number of iteration we want
%       tol = max tolerance desired    
%output x = computed square root
%%%%%%
x_true = sqrt(A)
x = x0;
while abs(x - x_true)>tol
    x = 0.5 * (x + A/x);
end
x_heron = x
end
