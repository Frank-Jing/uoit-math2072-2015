%Defining the Taylor polynomials for f(x) = cos(x) and c=0 (see notes)
s0 = @(x) 1
s2 = @(x) 1 - x.^2/2 
s4 = @(x) 1 - x.^2/2 + 1/24*x.^4 
x = linspace(-pi, pi);
%plotting cos(x) and the taylor's polynomials
plot(x,cos(x), 'r', x,s0(x), 'k', x, s2(x), 'm', x,s4(x),'g')
axis on
figure()
%Plotting the error, you may notice how it increases far away from c=0
plot(x,(cos(x)-s0(x)), 'r', x,(cos(x)-s2(x)), 'k', x,(cos(x)- s4(x)))
axis([-pi,pi,-1.1, 1.1])