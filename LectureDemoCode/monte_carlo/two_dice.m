function [ values ] = two_dice( N )
%TWO_DICE simulate rolling dice

%values records how many times we saw a number rolled
values = zeros([12,1])

for i = 1:N
    %roll two dice
    d1 = randi([1,6]);
    d2 = randi([1,6]);
    
    %compute sum
    num = d1+d2;
    %increment values for that sum
    values(num) = values(num)+1;
end


end

