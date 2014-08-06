function output = hypothesis(x1,x2)
%%
%This function takes in the x-component (x1) of data and the y-component of
%the data (x2)
%These theta values are only valid for the mean of the absolute value of
%the derivative of the signal.
% X1 = mean(abs(diff(x-component)))
% X2 = mean(abs(diff(y-component)))

h = zeros(1,3);

h(1) = 2.1107-2.2452*x1-3.6814*x2-.9306*x1^2-1.4231*x1*x2-2.2408*x2^2;
h(2) = -1.938+2.6278*x1+4.087*x2+.9827*x1^2+1.2716*x1*x2+1.3623*x2^2+.2425*x1^3+.1419*x1^2*x2-.3339*x1*x2^2-1.9632*x2^3;
h(3) = -6.2348+.1355*x1+.9751*x2+.0699*x1^2+.283*x1*x2+.6818*x2^2-.0125*x1^3+.0302*x1^2*x2+.0915*x1*x2^2+.1884*x2^3-.0253*x1^4-.0066*x1^3*x2+.0079*x1^2*x2^2+.0127*x1*x2^3+.0015*x2^4-.0232*x1^5-.0054*x1^4*x2+.0105*x1^3*x2^2+.0189*x1^2*x2^3+.0113*x1*x2^4-.0244*x2^5;


 x = max(h);
 
  if h(1)==x
     output = 1;    %Rest
 elseif h(2)==x
     output = 2;    %walk
 elseif h(3)==x
     output = 3;    %run
 else
     output = 0;    %undecided
  end
 
end
