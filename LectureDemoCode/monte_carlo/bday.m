function [odds] = birthday_prob( Npeople, Nreps )
%birthday problem

%one approach: generate several thousand repetitions
% over n people, randomizing birthdays over 365 days in a year.
% count any duplicates

matches = 0;

for i  = 1:Nreps
    %draw a random sample of birthdays
    sample = randi([1, 365], Npeople, 1);
    
    %find if any match by finding uniques and using histc
    uniques = unique(sample);
    counts = histc(sample, uniques);
    
    %if there are more than one sample sharing the same date
    if any(counts>1)
        % then increment our counter
        matches = matches+1;
    end
    
end
odds = matches/Nreps;
