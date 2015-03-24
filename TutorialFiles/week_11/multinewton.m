function x = multinewton(f, J, tol, k_max, x)
%%%%%%%%%%%%%
%   Newton's method for finding successively better approximations to the 
%   zeroes of a real-valued function.
%
% Input:
%   f - input vector field
%   df - Jacobian
%   x - initial guess (a vector in this case)
%   tol - tolerance
%   k_max - maximum number of iterations
%   eps_step - tolerance on the spatial grid
%
% Output:
%   x - approximation to root
%
%%%%%%%%%%%%%

for i=1:k_max
    %evaluating the system and the Jacobian 
    fun_eval = f(x);
    jac_eval = J(x);
    %computing Newton's step
    delta = jac_eval\fun_eval;
    x_new = x - delta;

    if (abs( x - x_new ) < tol)
        break
    elseif i == k_max
       error( 'method did not converge' );
    end

    x = x_new;
end
end