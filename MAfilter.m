function [ sumx sumy sumz ] = MAfilter( x, y, z, MAve )
%Takes inputs from x,y,and z axes of accelerometer along with the
%window size of the moving average filter
segment=length(x);
p=MAve;
while p<segment
sumx(p)=sum(x(p:-1:p-MAve+1))/MAve;
sumy(p)=sum(y(p:-1:p-MAve+1))/MAve;
sumz(p)=sum(z(p:-1:p-MAve+1))/MAve;
p=p+1;

end

end
