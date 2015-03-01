
function [ x, iters ] = basicNewtonSystem( x0, fun, jac )
%BASICNEWTONSYSTEM Code for a basic newton solver for a general system of equations
% Same as we programmed in class, but modified to return iteration count
% Inputs:
%      x0: starting point
%     fun: function handle to evaluate system
%     jac: function handle for jacobian

	% For this exercise, we hard code some parameters
    iter_max = 50;
    n_iter = 0;
    
    tol = 1e-8;
    err = 9e9; %big number
    
    x = x0;
    
    % check convergence
    while (err >= tol) && (n_iter < iter_max)
    
        r = fun(x); % calc residual 
        J = jac(x); % evaluate derivative
        
        % calc newton step: 
        delta = -J\r;
        
		% we can choose stopping criteria either as step size:
        err = norm(delta); 
		% or as function residual value (e.g. err = norm(r)).
		% more sophisticated methods check both!
        
        % do newton step
        x = x + delta;
        
		% update iter count
        n_iter = n_iter + 1;
        
    end
    
    % set other variables for return
    iters = n_iter;

end

