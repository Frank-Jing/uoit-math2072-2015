function s = toy_for_loop(N)
s = 0; % initialize the sum to 0
for ii = 1:N
    term = cos(2^(-ii));
    s = s + term;
end