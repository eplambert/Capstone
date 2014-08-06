function [pCount, nCount] = PeakCount(axis)

%%
%This function takes in an axis and returns the number of peaks in the
%positive and negative
%Ideally used for counting steps


posiCount = 0;
negCount = 0;
axis = axis/max(axis);
threshold = 0.3;
dr = diff(axis);
dr = [dr,0];        %adds a zero to the end of the vector
m = length(dr);


for i =1:m
    if dr(i)>0 && dr(i+1)<=0 && axis(i)>=threshold
        posiCount = 1 + posiCount;
    elseif dr(i)<0 && dr(i+1)>=0 && axis(i)<= -threshold
        negCount = 1 + negCount;
    end
    

end
pCount = posiCount;
nCount = negCount;
