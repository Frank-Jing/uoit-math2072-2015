%%%Uncomment where needed%%%
% defining 10 points of a smooth function
x = 0:10;
y = sin(x)+ 2*cos(x);
%Defining the x domain for the interpolant polynomial
xx = 0:.25:10;
% defining 10 points of a not smooth function
x = -3:3;
y = [-1 -1 -1 0 1 1 1];
xx = -3:.25:3;
%computing the interpolant polynomials with spline and pchip
yy = spline(x,y,xx);
zz = pchip(x,y,xx);
plot(x,y,'r*',xx, yy, 'b', xx,zz, 'm')


%remarks:
%spline produces a more accurate result if the data consists 
%of values of a smooth function
%pchip has no overshoots and less oscillation if the data are not smooth.