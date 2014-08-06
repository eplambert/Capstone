function output = acorr(signal)

%This function performs the autocorrelation of the input signal
%The output of this function is half of the autocorrelation
%since the autocorrelation is a mirror image there is no reason to
%replicate both sides

y = signal;
L = length(signal);
Z = zeros(1,L);

Z(1,1)=y*y';

for j = 1:L
    count = 0;
    for i = 1:L-j
        count= count + y(i)*y(j+i);
    end
    Z(1,j+1) = count;
end


output = Z;
