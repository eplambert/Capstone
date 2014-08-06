function [x,y,z] = dataSegments(input,numSamples)

%input is the data from the accelerometer divided into each axis

if size(input,2)==4
%    a = Cutter(input(:,1)); %t
    b = Cutter(input(:,2)); %x
    c = Cutter(input(:,3)); %y
    d = Cutter(input(:,4)); %z
else
    
    b = input(:,1); %x
    c = input(:,2); %y
    d = input(:,3); %z
    
end

m = length(b);

numWindows = floor(m/numSamples);

j = 1;
for i = 1:numWindows
    x(i,:) = b(j:j+numSamples-1);
    y(i,:) = c(j:j+numSamples-1);
    z(i,:) = d(j:j+numSamples-1);
    j = i*numSamples+1;
end
