% Code to test gps system + newton solver for location
% In class we developed a system to evaluate the gps system of equations
% `gps_system.m` and its Jacobian `gps_jacobian.m`.

% params from jan21 slides

params = zeros(4,4);

params(1,:) = [15600, 7540, 10380, 0.05932];
params(2,:) = [11760, 2750, 16190, 0.05192];
params(3,:) = [11610, 14630, 7680, 0.06242];
params(4,:) = [15170, 610,  13320, 0.05571];


%starting vector
x0 = [1,1,1,0]';



% more realistic numbers for testing. We should get the same root!
x0 = [-20,11,6000,4e-5]';

