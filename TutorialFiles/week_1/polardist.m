function d = polardist(r1, theta1, r2, theta2)
alpha  =theta1 - theta2;
d2 = r1^2 + r2^2 -2*r1*r2*cos(alpha);
d = sqrt(d2);
end