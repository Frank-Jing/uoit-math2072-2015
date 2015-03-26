function [ pos_x, pos_y ] = brownian_2d(  )
%BROWNIAN_2D simple model of 2d brownian motion
% / particle diffusion.
%We looked at isotropic and simple anisotropic
% diffusion by changing the average step size 
% characteristics in the x/ y directions.

tau = 0.1; % time interval between steps
N = 100; %final time
M = 1000; %number of different trials

%diffusion coefficient
tk = 293.0; kb = 1.38e-23; eta = 1e-3; d = 1e-6;
D = (kb*tk) / (3 * pi * eta * d);

% average step size for 2d
k = sqrt( 2 * 2 * D * tau );
steps = N/tau; %number of steps


%simple model of anisotropy
% how do we change this if we have a preferred
%direction that is off-axis? (rotate!)
k_x = k;
k_y = k * 3;

%steps
% Its also possible to do randn([2,steps,M])
% and keep everything in one variable. We chose
% to split out x/y for teaching purposes
step_sizes_x = k_x * randn([steps, M]);
step_sizes_y = k_y * randn([steps, M]);

%positions
pos_x = cumsum(step_sizes_x, 1);
pos_y = cumsum(step_sizes_y, 1);

% plot a single particle path
% note that time is no longer an axis, but is
% _implicit_ in the trajectory 
%plot(pos_x(:,4), pos_y(:,4));

end

