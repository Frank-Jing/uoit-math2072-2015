function [ retVal ] = barsExample( alpha, beta, lengths )
%BARSEXAMPLE Example matlab routine for freudenstein equation from lec #2.
% Parameters are split into beta, [lengths] for demonstration 


    % TODO: do error checking.
    % Such as:
    % Are all parameters given?
    % Do we have the correct number of lengths?
    % Are parameters physically realizable?
    % etc..
    lenSq = lengths.^2;
    
    retVal  = lengths(1)/lengths(2)*cos(beta) ...
                - lengths(1)/lengths(4)*cos(alpha) ...
                - cos(beta-alpha) ...
                + (lenSq(1) + lenSq(2) - lenSq(3) + lenSq(4)) ...
                              /(2*lengths(2)*lengths(4));



end

