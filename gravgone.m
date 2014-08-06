function [output, average] = gravgone(axis)

%This function takes in an axis vector and finds it's gravity component
%The purpose of this function is to remove the influence of gravity
%Orientation is not considered in this function

L = length(axis);

avg_vec = zeros(1,L);
new_axis = zeros(1,L);
axis_sum = cumsum(axis);

for i = 1:L
    avg_vec(1,i)= axis_sum(i)/i;
end

for x = 1:L
    new_axis(1,x)= axis(x)-avg_vec(1,end);
end

output = new_axis;
average = avg_vec(1,end);
