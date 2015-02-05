function y = findzero(b,c,x0)
%%%%%%%%%%%%%%%%%%%%%
%Example of a parametrized function using a nested function:
%b and c are the coefficients of a polynomial I want to find the zero of
%x0 is my guess for the iterations
%%%%%%%%%%%%%%%%%%%

%I want to find a zero y for the polynomial defined in the nested function
%poly given an initial guess x0
y = fzero(@poly,x0);
    %fzero takes as first argument a function defined below:
   function y = poly(x)
   %the coefficients b and c passed in the parent function are used here:
   %we can do this because parents and nested functions share the
   %workspace. You can think to them as 'global' variables.
   y = x^3 + b*x + c
   end
end