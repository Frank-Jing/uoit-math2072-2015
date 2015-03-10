%extreme of integration
a = 0.; 
b = 0.5;
%number of intervals
N = 4;

%width of each sub-interval
h = (b-a)/N;
i = 1:N;
%creating all the midpoints at eahc interval
c_i = a+0.5*(2*i-1)*h;
%evalluating the function cox(x^2) I want to integrate at the grid points
f = cos( c_i.^2); % A sample function
%Computing the integral
M = h*sum(f)
