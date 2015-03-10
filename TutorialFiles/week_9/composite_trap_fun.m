%Number of intervals to use
N = 80;

%Integration interval
a = 0;
b = 0.5;

%Width of the integration segments
h = (b-a) / N;
%defining the "label" of each point on the right extreme of each
%subintervals
x = 1:1:N-1;
%computing the integral using the composite trapezoid rule seen in class.
F = h/2*(cos(a) + sum(2*cos(a+x*h)) + cos(b))