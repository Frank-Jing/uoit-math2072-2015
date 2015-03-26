Nreps = 500;

odds_vec = zeros(366,1);

for j = 2:366
    odds_vec(j) = bday(j, Nreps);
end

plot(1:366, odds_vec);