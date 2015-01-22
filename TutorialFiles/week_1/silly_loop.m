function silly_loop(a,b)
i = 0;
tic
for t = a:.01:b
    i = i + 1;
    y(i) = sin(t);
toc
end