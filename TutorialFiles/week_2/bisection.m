function r  = bisection( f, a, b, k_max, eps_step, tol )
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Input: f = function we want to find the zero of
    %       a = left point of the bracket
    %       b = right point of the bracket
    %       k_max = max number of iteration we want to find
    %       eps_step = tolerance on the spatial grid
    %       tol = precision we want in our algorithm
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
    % Check that neither end-point is a root
    % and if f(a) and f(b) have the same sign, throw an exception.

    if ( f(a) == 0 )
	r = a;
	return;
    elseif ( f(b) == 0 )
	r = b;
	return;
    elseif ( f(a) * f(b) > 0 )
        error( 'f(a) and f(b) do not have opposite signs' );
    end

    % We will iterate k_max times and if a root was not
    % found after k_max iterations, an exception will be thrown.

    for k = 1:k_max
        % Find the mid-point
        c = (a + b)/2;

        % Check if we found a root or whether or not
        % we should continue with:
        %          [a, c] if f(a) and f(c) have opposite signs, or
        %          [c, b] if f(c) and f(b) have opposite signs.

        if ( f(c) == 0 )
            r = c;
            return;
        elseif ( f(c)*f(a) < 0 )
            b = c;
        else
            a = c;
        end

        % If |b - a| < eps_step, check whether or not
        %       |f(a)| < |f(b)| and |f(a)| < tol and return 'a', or
        %       |f(b)| < tol and return 'b'.

        if ( b - a < eps_step )
            if ( abs( f(a) ) < abs( f(b) ) && abs( f(a) ) < tol )
                r = a;
                return;
            elseif ( abs( f(b) ) < tol )
                r = b;
                return;
            end
        end
    end

    error( 'the method did not converge' );
end
