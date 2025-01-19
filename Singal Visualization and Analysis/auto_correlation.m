
%% Auto correlation of signal

clc;
clear all;
close all;

% parameters
srate = 1000;
time = 0:1/srate:1;

sine = sin(2 * pi * 50 * time + 0);

figure(1),clf
subplot(211);
plot(time,sine,'k',LineWidth=2);
title('Sine wave'),xlabel('Time (sec)'), ylabel('Amplitude');

autocorr_signal = autocorr(sine);
subplot(212);
plot(autocorr_signal);