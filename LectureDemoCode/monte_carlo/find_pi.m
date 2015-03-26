% monte carlo process to estimate pi
% by integrating area of circle
% slow looping! compare to pi_vectorized.m

%number of samples
N = 5000;

%store count inside circle
numInside = 0;

%assume circle radius = 1
%loop over all samples
for i = 1:N
    %pick a random point in the square
    rand_y = rand();
    rand_x = rand();
    
    radius = ( rand_x.^2  + rand_y.^2 );
    
    % is the point in the circle?
    
    if radius < 1.0
        numInside = numInside + 1;
    end
end

ratio = numInside/N;

pi_estimate = ratio*4