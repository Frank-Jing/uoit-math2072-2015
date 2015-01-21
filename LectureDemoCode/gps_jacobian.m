function [y] = gps_jacobian ( x, params )

% x is a 1x4 vector
% params  is 4x4 (A, B, C, tau)

y = zeros(4,4);

c = 299792.458; % speed of light in km/s 



    
    for j = 1:4 % j indexes params A,b,c,tau
     for i = 1:3   
        y(j,i) = 2*( x(i) - params(j,i) );
        
     end
     
     % i==4 is special case because of c^2 term

     y(j,4) = -c.^2 * 2* ( x(4) - params(j, 4) );
    end



end
