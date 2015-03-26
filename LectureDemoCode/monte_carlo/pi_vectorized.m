function [ mPi ] = pi_vectorized( r, nPts )
%PI_VECTORIZED 
%   compute pi with monte carlo methods
%   by computing the ratio of areas of a square
%   vs an inscribed circle for some radius r .
%  We see that r doesn't matter (of course!)
    
    % Get vector of uniform random points corresponding
	% to (x,y) indices in our test area.
    pts = r .* rand([nPts, 2]);
    
    % Get distance from origin for all points
    radii = pts(:,1).^2 + pts(:,2).^2;
    % Test if they're less than the radius
    filter = radii < r.^2;
    % count how many remain within the circle &
    % Divide by number of sample points
    mPi = 4*sum(filter)./nPts;

end

