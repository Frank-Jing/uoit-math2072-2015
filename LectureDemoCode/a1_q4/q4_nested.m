
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


% pre-allocate output arrays
iter_count = zeros(npts, npts);
roots = zeros(npts, npts);

% Anonymous functions for our (simple) function and its derivative
fun = @(z) z.^5 - 2;
jac = @(z) (5 * z.^4);


% loop over all xs and ys.
for k  = 1:npts 
	for j = 1:npts
		% generate starting point
		start = xs(j) + 1j*ys(k);
		% we alternativey could have made a meshgrid and index into it 
		% e.g.:
		%  [xx, yy] = meshgrid(xs, ys);
		%  cplx_grid = xs + 1j*ys;
		% ...
		% then here, in loop:
		%  start = cplx_grid(j,k);
		
		% If we didn't use linspace, we could directly calculate the grid location from
		% the array index by something like:
		% xloc = j*(x_range)/npts - x_offset
		% ... etc
		% this is preferable only for very large data sizes, as it avoids storing the 
		% intermediate vectors.
		
		%call newton solver
		[root, iter] = basicNewtonSystem(start, fun, jac);
		%save ouput
		iter_count(k, j) = iter;
		roots(k, j) = root; 
	end
end


%% Displaying
% plot like so:
figure(1);
imagesc(angle(roots));

figure(2);
imagesc(iter_count);

% For last question, we just repeat the above and change the grid
% limits.