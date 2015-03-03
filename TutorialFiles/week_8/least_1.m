%Define a set of points:
x =[2.3,1.1;2.4,1.2;1.9,1.3;2.5,1.35; 1.7, 1.4];
%Define the system find the best least square approximation
A = [1, x(1,1); 1, x(2,1);1,x(3,1); 1,x(4,1); 1, x(5,1)];
B = [x(1,2); x(2,2); x(3,2); x(4,2); x(5,2)];
%Solving using the normal equation
xx =inv(transpose(A)*A)*(transpose(A)*B)
%plotting
m = linspace(1, 10, 50);
%Defining my line with the coefficients I found from the system
y = xx(1)+ xx(2)*m;
plot(m,y, 'r')
%plotting the points
hold on
plot(x(2,1), x(2,2), 'x')
hold on
plot(x(1,1), x(1,2), 'x')
hold on
plot(x(3,1), x(3,2), 'x')
hold on
plot(x(4,1), x(4,2), 'x')
hold on
plot(x(5,1), x(5,2), 'x')
hold off