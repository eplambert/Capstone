clear all;close all; clc;
%% This code takes in accelerometer data and performs the following tasks
% Identifies activity level
% Counts steps
% If the user is walking it identifies the user


[F,PathName]=uigetfile('*.txt','Pick-A-File' ,'');
A = load(strcat(PathName,F));

%%
MAve=5;   %input('What is M for M-point smoother? ');

summer = [];

if size(A,2)~=4
    A = buildColumns(A);       %to be used only if the data comes in rows of
end                             %x,y,z

% Analyzing 10 seconds in time
Fs = 50; 
sec = 10;
samples = sec*Fs;
[xx,yy,zz] = dataSegments(A,samples);

n = size(xx,1);
N = length(xx);
numFeatures = 10;

activeDecide = zeros(n,1);
dataMatrix = zeros(n,numFeatures);

for j= 1:n

%% Gravity Removal
[x xavg] = gravgone(xx(j,:));
[y yavg] = gravgone(yy(j,:));
[z zavg] = gravgone(zz(j,:));

%% Moving Average Filter
[sumx sumy sumz] = MAfilter(x,y,z,MAve);

summer = [summer sumy];

%% Find the MAD
xdx = mean(abs(diff(x)));
ydy = mean(abs(diff(y)));
zdz = mean(abs(diff(z)));

%% Find Activity Level
output = hypothesis(xdx,ydy);
activeDecide(j) = output;

%% Neural Network Features

[yplus,yminus]=PeakAmplitude(sumy);
[zplus,zminus]=PeakAmplitude(sumz);

%youtput = acorr(sumy);
[YADP,dummy] = AvgPeakDistance(sumy);
YADP = YADP-22;
ratioz = zplus/abs(zminus);
ratioy = yplus/abs(yminus);

dataMatrix(j,:) = [xdx ydy zdz yplus yminus zplus zminus YADP ratioy ratioz];

end

%disp('dataMatrix')
%disp(dataMatrix)

%% Decision Tree for Activity Recognition
%Neural Network Prediction made only for walking

load('Theta1.mat');
load('Theta2.mat');

p = zeros(length(activeDecide));
%h1 = zeros(6,40);
%h2 = zeros(6,5);

for a = 1:length(activeDecide)
    if activeDecide(a)==1
        disp('Activity is:    REST')
    elseif activeDecide(a)==3
        disp('Activity is:    RUN')
    elseif activeDecide(a)==2
        disp('Activity is:    WALK')
        [p(a) h1(a,:) h2(a,:)] = predict(Theta1,Theta2,dataMatrix(a,:));    %only care about walking
    else
        disp('Activity is:    UNKNOWN')
    end
    
end
%save('hiddenLayers.mat','h1','h2')

p(p==0) =[];    %remove zeros just in case user started running or stopped
%% Decision tree for Person Identification

disp(p)

p_mode = mode(p);

% [n,bins] = histc(p(:),1:5);
% [v,i] = max(n);


if isempty(p)== 0
    if p_mode == 1
        disp('This Program Thinks You Are?    AARIN')
    elseif p_mode == 2
        disp('This Program Thinks You Are?    ANTHONY')
    elseif p_mode == 3
        disp('This Program Thinks You Are?    ERIC')
    elseif p_mode == 4
        disp('This Program Thinks You Are?    IRA')
    else
        disp('This Program Thinks You Are?    WHO ARE YOU?')
    end
else
    %Nothing
end

    
%% Token Step counter
[yyplus,dummy]=PeakCount(summer);
fprintf('Step Count: %f \n',yyplus)
