
%% Convolution of two signals
% It combines two signals (or functions) to produce a third signal that represents how one signal modifies or interacts with the other.
% Convolution slides one signal (or function) over another, multiplies overlapping elements, and sums the results. 
% The process involves flipping, shifting, multiplying, and summation.
% Convolution is like blending or mixing two signals. 
% One signal modifies the shape of the other by weighing or scaling it over time or space. 
% It's a fundamental operation that helps us understand how one function influences another in a system.

clc;
clear all;
close all;

% convolution of two signals
srate = 500;
time = 0:1/srate:2;

ampl = 2;
freq = 4;
phas = 0;

% sinsodial signal
sine = ampl * sin(2 * pi * freq * time + phas);

figure(1), clf
subplot(3,1,1);
plot(time,sine,'k',LineWidth=2);
title('Sinesodial signal'),xlabel('Time(Sec)'),ylabel('Amplitude');
grid on;

% exponential signal
expo = exp(-time);

subplot(3,1,2);
plot(time,expo,'k',LineWidth=2);
title('Exponential signal'),xlabel('Time(Sec)'),ylabel('Amplitude');
grid on;

% convolution of two signals
y = conv(sine,expo,'same');

% time vector for convolution signal
time_con = linspace(time(1),time(end),length(y));

subplot(3,1,3);
plot(time_con,y,'k',LineWidth=2);
title('Convoluted signal'),xlabel('Time(Sec)'),ylabel('Amplitude');
grid off;
