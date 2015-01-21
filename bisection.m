function [ x_low, x_high ] = bisection( fun, low, high )
%BISECTION Demo implementation of bisection algorithm for 
%   root finding

% Input:
% function handle: fun
% starting point for iterations: x0
% range for bisection search [ low --> high ] 

% Ouput:
% Range containing a zero [x_low --> x_high ]

eps = 1e-7;
iter = 0;
iter_max = 100;

   
while (high - low) > eps
    
    x_new = (high+low) / 2;
    
    if fun(x_new) > 0
        high = x_new;
    else
        low = x_new;
    end
    
    iter = iter + 1;
    if iter > iter_max
        break;
    end

end

% iteration loop over
% assign output
x_low = low;
x_high = high;


end

