function [ output_args ] = Investment( P )
%INVESTMENT Summary of this function goes here
%   Detailed explanation goes here
N = 20;
A = zeros(1,N);
r = 2.12; 


formatStr = 'Year:%3.d\t\t Amount: %.2f\n';

for k = 1:N
    A(k) = P*(1+r/100).^k;
    fprintf(formatStr, k, A(k));
end



end

