function [ M ] = ctrap ( f, a, b, N )
%CTRAP.M Summary of this function goes here
%   Detailed explanation goes here

%width of each sub-interval
h = (b-a)/N;
%creating all the midpoints at eahc interval
x = 1:1:N-1;
%computing the integral using the composite trapezoid rule seen in class.
M = h/2*(f(a) + sum(2*f(a+x*h)) + f(b));

end

