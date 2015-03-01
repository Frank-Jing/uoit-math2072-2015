function [ Qn ] = QSequence( N )
%QSEQUENCE Summary of this function goes here
%   Detailed explanation goes here

k = 1:N;
Qn = exp( sum( (-1).^(k-1) ./ k) );

Qn2 = 0;
for k = 1:N
 Qn2 = Qn2 + (-1).^(k-1) ./ k;
end
Qn2 = exp(Qn2);

disp(Qn)
disp(Qn2)

end

