% make newton system

function [y] = gps_system ( x, params )

% x is a 1x4 vector
% params  is 4x4 (A, B, C, tau)

y = zeros(4,1);

c = 299792.458; % speed of light in km/s 


for j = 1:4
    y(j) = ( x(1) - params(j,1) )^2 + ...
           ( x(2) - params(j,2) )^2 + ...
           ( x(3) - params(j,3) )^2 - ...
    c.^2 * ( x(4) - params(j,4) )^2;
end

end
