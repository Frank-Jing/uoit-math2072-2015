function x = my_newton(f, df, eps_step, tol, k_max, x)
%%%%%%%%%%%%%
%   Newton's method for finding successively better approximations to the 
%   zeroes of a real-valued function.
%
% Input:
%   f - input funtion
%   df - derived input function
%   x - inicial aproximation
%   tol - tolerance
%   k_max - maximum number of iterations
%   eps_step - tolerance on the spatial grid
%
% Output:
%   x - approximation to root
%
%%%%%%%%%%%%%

for i=1:k_max
    x_new = x - f(x)/( df(x) );

    if (abs( x - x_new ) < eps_step) && (abs( f( x_new ) ) < tol)
       break;
    elseif i == k_max
       error( 'method did not converge' );
    end

    x = x_new;
end
end
        
        