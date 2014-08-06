function [avg_positive, avg_negative]= PeakAmplitude(axis)

%%
%This function takes in a signal from an axis and the sampling frequency
%Finds locations by setting the derivative equal to zero and solving for
%the location.
%Once the locations are discovered the value at the discovered location is
%subtracted from zero to find the amplitude.
%These amplitudes are stored and averaged together to get an average
%positive amplitude and average negative amplitude.

%%

threshold = 0.2;           %Threshold created to get rid of outliers in amplitude
dr = diff(axis);
m = length(dr);
posi = zeros(1,1);
neg = zeros(1,1);

for i = 1:m-1
      if dr(i)>0 && dr(i+1)<=0
         posi = [ posi axis(i+1)];
     elseif dr(i)<0 && dr(i+1)>=0
         neg = [ neg axis(i+1)];
     end
%      if dr(i) <= threshold
%          A(i)= axis(i);
%      else
%          A(i)=0;
%      end
end
posi=posi(2:end);
neg=neg(2:end);

% A(A==0)=[];         %removes zeros in A
% n = length(A);
Maxposi=max(posi);      %Find the maximum peak value of all positive peaks
Maxneg=min(neg);        %Find the minimum peak value of all neg peaks
posiElim=posi;          %Create new vector that gets rid of outliers
negElim=neg;            %  "                                 "

for i = 1:length(posi)
    if posi(i)< threshold*Maxposi
        eliminateP=posi(i);      %Find the minimum values 
        posiElim(posiElim==eliminateP)=[];
    end
end

for i = 1:length(neg)
    if neg(i) > threshold*Maxneg
        eliminateN=neg(i);
        negElim(negElim==eliminateN)=[];
    end
end

avg_positive = mean(posiElim)*.1;
avg_negative = mean(negElim)*.1;

