function [ Qn ] = Qsequence( N )
% 

k = 1:N;

Qn_vec = exp( sum( (-1).^(k-1) ./ k) );


%% OR equivalently:
Qn_loop = 0;
for k = 1:N
    % here k is a _scalar_ 
    Qn_loop = Qn_loop + (-1).^(k-1) / k; 
end

Qn_loop = exp(Qn_loop);

fprintf('Qn_vec %f, Qn_loop %f \n', Qn_vec, Qn_loop);

end

