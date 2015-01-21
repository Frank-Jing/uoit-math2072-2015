% driver script to test bisection code

% test functions from oscillating rod problem we talked about in class

mu = 0.1;

% our two test formulations of the function
% cot() has quite bad properties that will make our iterative methods difficult to apply
f1 = @(x) cot(x) - mu*x; 

%cos/sin shares identical zeroes, but is well behaved! perfect for iterative methods
f2 = @(x) cos(x) - mu*x.*sin(x);


%call bisection on f1 and f2 in our test range of [3,5]
% we know from fzero that a zero exists at ~4.3


[f1_low, f1_high] = bisection(f1, 3, 5);
[f2_low, f2_high] = bisection(f2, 3, 5);

disp('bisection found a zero of f1 in bracket')
 f1_low
 f1_high

disp('bisection found a zero of f2 in bracket')
 f2_low
 f2_high

