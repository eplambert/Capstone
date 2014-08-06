function ratio = SwayRatio(axis)
%% Input is the axis specifically for left and right and finds the ratio of the average sway values

[posi_axis, neg_axis] = PeakAmplitude(axis);

ratio = posi_axis/abs(neg_axis);

end
