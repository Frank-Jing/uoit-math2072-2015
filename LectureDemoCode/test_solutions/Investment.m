function [  ] = Investment( P )
%INVESTMENT24352345234

N=21;
r = 2.12;

A = zeros(N,1);

formatStr = 'Year: %3.d\t\t Amount:\t %.2f\n';

for j=1:(N+1)
    A(j) = P * (1 + r/100).^(j-1);
    fprintf(formatStr, j-1, A(j));
end   


end

