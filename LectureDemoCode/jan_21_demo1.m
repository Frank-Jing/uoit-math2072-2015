% driver to test newton system for 
% toy examples in slides


% Function and jacobian def'n

func1 = @(x) [ 5*x(1)-x(2)-5 ;  x(1).^2-8*x(1)-x(2) + 2 ]; 

jac_func1 = @(x)  [  [ 5 ,  -1 ]  ;...
                    [ 2*x(1)-8 , -1 ] ];             
             

%x0 is [0 , 2]^T

x0 = [0;2];

basicNewtonSystem( x0, func1, jac_func1 )


