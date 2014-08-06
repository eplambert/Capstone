function output = Cutter(input)

%%
%This function is being used to remove the first 750 samples of a signal
%and the last 750 samples

m = length(input);
Fs = 50;            %sampling frequency
seconds = 1;        %seconds to be removed at beginning and end
Rs = Fs*seconds;    %removed seconds
remove = Rs;       
n = m - remove;
input(n:m)=[];
input(1:remove)=[];

output = input;

end
