function root = toy_while_loop(A, xnew, xold)
while abs(xold - xnew)>1.0e-5
    xold = xnew;
    xnew = 0.5 * (xnew + A/xnew);
root = xnew;
end
