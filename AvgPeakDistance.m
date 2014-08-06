function [avgDistancePosi,avgDistanceNeg] = AvgPeakDistance(axis)

%%
%This function takes in an axis input and measures the distance between the
%peaks.
%This function is currently being tailored to the auto correlation function
%I'm trying to use this function to determine running versus walking
%
axis = acorr(axis);     %performs the autocorrelation
axis = axis/max(axis);  %Makes the max value of the peak equal to one
threshold = 0.2;    %Less than 20% of the signal is probably not important
dr = diff(axis);    %Take the derivative of the input
dr = [dr,0];        %adds a zero to the end of the vector
m = length(dr);
%posiCount = 0;
%negCount = 0;
Aposi = zeros(1,m);
Aneg = zeros(1,m);



for i = 1:m
   if dr(i)>0 && dr(i+1)<=0 && axis(i)>=threshold
        Aposi(i) = i;
        %posiCount = 1 + posiCount;
%     elseif dr(i)<0 && dr(i+1)>=0 && axis(i)<= -threshold
%         %negCount = 1 + negCount;
%         Aneg(i) = i;
%    else
%         %nothing
    end 
end


Aposi(Aposi==0)=[];         %remove zeros
Aneg(Aneg==0)=[];


avgDistancePosi = Aposi(1);%)-Aposi(1);  %lenP/posiCount;
avgDistanceNeg = 0;%Aneg(2)-Aneg(1);  %lenN/negCount;
