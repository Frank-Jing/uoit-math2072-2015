function [ x ] = basicNewtonSystem( x0, fun, jac )
%BASICNEWTONSYSTEM Summary of this function goes here
%   Detailed explanation goes here

    iter_max = 50;
    n_iter = 0;
    
    tol = 1e-9;
    err = 9e9; %big number
    
    x = x0;
    
    while (err >= tol) && (n_iter < iter_max)
    
        r = fun(x);
        J = jac(x);
        
        % newton step
        delta = -J\r;
        
        err = norm(delta); 
        
        % do newton step
        x = x + delta;
        
        n_iter = n_iter + 1;
        
    end
    
    

end

