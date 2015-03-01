
% discretizaton points 
npts = 200;

% x/y (re/im) limits for grid
x_start = -2;
x_stop = 2;

y_start = -2;
y_stop = 2;

% generate x/y grid 'edges'
% Using linspace takes care of determining the transformation between
% array index <--> grid location, by performing a look up into the xs/ys arrays.

xs = linspace(x_start, x_stop, npts);
ys = linspace(y_start, y_stop, npts);

% For this version, we ues meshgrid to generate
% a grid to do our evaluations
[xx, yy] = meshgrid(xs, ys);

% this is an array of all the loci we wish to calculate the fractal at.
cplx_grid = xx + 1i*yy;

% pre-allocate output arrays
iter_count = zeros(npts, npts);
roots = zeros(npts, npts);

% Anonymous functions for our (simple) function and its derivative
fun = @(z) z.^5 - 2;
jac = @(z) (5 * z.^4);


% flatten arrays for simpler looping
cplx_grid = cplx_grid(:);
iter_count = iter_count(:);
roots = roots(:);

% loop over ALL points in our new flat vector and compute root
for j = 1:npts*npts
    % get starting point
    start = cplx_grid(j);
	%call newton solver
    [root, iter] = basicNewtonSystem(start, fun, jac);
	%save ouput
    iter_count(j) = iter;
    roots(j) = root; 
end

%reshape back to a square for display
iter_count = reshape(iter_count, [npts, npts]);
roots = reshape(roots, [npts, npts]);


%% Displaying
% plot like so:
figure(1);
imagesc(angle(roots));

figure(2);
imagesc(iter_count);

% For last question, we just repeat the above and change the grid
% limits.