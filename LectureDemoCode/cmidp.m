function [ M ] = cmidp( f, a, b, N )
%CMIDP.M Summary of this function goes here
%   Detailed explanation goes here

%width of each sub-interval
h = (b-a)/N;
i = 1:N;

%creating all the midpoints at eahc interval
x = a+0.5*(2*i-1)*h;

%evalluating the function cox(x^2) I want to integrate at the grid points
fvals = f( x ); % A sample function
%Computing the integral
M = h*sum(fvals);


end

