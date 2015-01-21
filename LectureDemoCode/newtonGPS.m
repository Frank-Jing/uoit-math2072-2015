function [ x ] = newtonGPS( x0, fun, jac, params )
%NEWTONGPS newton solver for GPS demo
% with parameters vector 

    iter_max = 50;
    n_iter = 0;
    
    tol = 1e-9;
    err = 9e9; %big number
    
    x = x0;
    
    while (err >= tol) && (n_iter < iter_max)
    
        r = fun(x, params);
        J = jac(x, params);
        
        % newton step
        delta = -J\r;
        
        err = norm(delta); 
        
        % do newton step
        x = x + delta;
        
        n_iter = n_iter + 1;
        
    end
    
    

end



