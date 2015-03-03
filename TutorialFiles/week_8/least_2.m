%Define an overdertermined system Ax = b: the # of rows of A is greater that its
%number of columns
A = [2,3;1,1;5,6];
B = [1;2;3];
%Solving the overdetermined system using \ operator or by using the normal
%equation doesn't change the solution for the least square problem:
fprintf ('Solution using backslash operator')
x_bs = A\B
fprintf ('Solution using the normal equation')
x_norm = inv(transpose(A)*A)*(transpose(A)*B)
%However, \ operator is faster and easier...