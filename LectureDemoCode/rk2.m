function [t,u] = rk2(F,tspan,y0,Nh)
%RK2 2-stage Runge-Kutta method for integrating IVPs on uniform mesh
% [t,u] = rk2(F,tspan,y0,Nh);
% (Also called Heun's method or the improved Euler method)
% INPUT:
% F      - function handle for RHS of ODE (returns mx1 column vector)
% tspan  - 2-vector (interval [t_0,t_final] of integration)
% y0     - initial condition
% Nh     - Number of time-steps
% OUTPUT:
% t      - Nx1 column vector with mesh
% u      - Nxm matrix containing numerical solution on mesh t
t = linspace(tspan(1),tspan(2),Nh+1);  % Create mesh
h = (tspan(2)-tspan(1))/Nh;
m = length(y0);
u = zeros(Nh,m);             % Allocate space for solution
u(1,:) = shiftdim(y0).';     % Store initial condition
for n = 1:Nh
  tn = t(n);
  un = u(n,:).';             % Extract u_n from solution array
  k1 = F( tn, un );
  k2 = F( tn+h, un + h*k1 );
  un1 = un + 0.5*h*(k1+k2);
  u(n+1,:) = un1.';          % Store u_n+1 in solution array
end
return
end