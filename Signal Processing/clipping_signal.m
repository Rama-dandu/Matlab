
%% Clipping the signal to threshold
%  signal clipping is used to prevent the amplitude of a signal from exceeding a specified range. 

clc;
clear all;
close all;

% parameters
srate = 500;
time = 0:1/srate:2;

% sine signal with random noise
sine = 2 * sin(2 * pi * 5 * time + 0) + 2 * randn(size(time));

figure(1), clf
subplot(211);
plot(time,sine,'k',LineWidth=2);
title('Sine wave'),xlabel('Time (sec)'),ylabel('Amplitude');

thresold = 2;

clippled_signal = min(max(sine,-thresold),thresold);

subplot(212);
plot(time,clippled_signal,'k',LineWidth=2);
title('Clipped signal'),xlabel('Time (sec)'),ylabel('Amplitude');

