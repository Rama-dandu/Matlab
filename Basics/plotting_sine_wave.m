
%% program to generate a sine wave and cos waves

clc;
clear all;
close all;

srate = 500;
time = 0:1/srate:2-1/srate;

ampl = 2;
freq = 4;
phas = 0;

sinewave = ampl * sin(2 * pi * freq * time + phas);
coswave = ampl * cos(2 * pi * freq * time + phas);

figure(1), clf
plot(time,sinewave,'k',LineWidth=2,Color= 'b');
hold on;
plot(time,coswave,'k',LineWidth=2,Color= 'g');
title('sine wave and cosine wave');
xlabel('Time (sec)');
ylabel('Amplitude');
legend('sin','cos');

