function [ pos ] = brownian(  )
%BROWNIAN Basic 1d brownian motion as 
%discussed in lecture 

tau = 0.1; % time interval between steps
N = 100; %final time
M = 1000; %number of different trials

%diffusion coefficient
tk = 293.0; kb = 1.38e-23; eta = 1e-3; d = 1e-6;
D = (kb*tk) / (3 * pi * eta * d);

% average step size for 1d
k = sqrt( 2 * 1 * D * tau );
steps = N/tau; %number of steps

%random steps taken by particles
step_sizes = k * randn([steps, M]);

%positions
pos = cumsum(step_sizes, 1);


%plot(pos);

end

