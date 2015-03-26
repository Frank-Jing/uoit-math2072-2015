function [ pos ] = brownian_barrier(  )
%BROWNIAN_BARRIER
%as discussed in lecture, here we programmed an
%implementation of 1d diffusion, assuming particles
%start at the origin. Implements a simplistic barrier
%that restricts particle motion.

tau = 0.1; % time interval between steps
N = 100; %final time
M = 2000; %number of different trials (particles)

%diffusion coefficient
tk = 293.0; kb = 1.38e-23; eta = 1e-3; d = 1e-6;
D = (kb*tk) / (3 * pi * eta * d);

% average step size for 1d
k = sqrt( 2 * 1 * D * tau );
steps = N/tau; %number of steps

%initialize positions
%we're going to store the positions of all particles for all
%time steps to look at the behaviour. In practice, its likely
%not reasonable to store the whole history
pos = zeros(steps, M);

%1d problem so barrier is a "point" we can't cross
barrier = 1e-5;

%loop over steps
for j = 2:steps
    %make steps for all particles at once
    step_sizes = k * randn([1, M]);
    
    %check if new position puts us outside
    % testing the whole vector at once!
    outside = (pos(j-1,:) + step_sizes) > barrier;
    
    % if so, change direction for those steps (reflect)
    step_sizes(1, outside) = -1*step_sizes(1, outside);
    
    %update positions
    pos(j,:) = pos(j-1,:) + step_sizes;
end

end

