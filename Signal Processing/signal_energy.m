
%% Calculating the energy of a signal
% signal energy quantifies how much "power" is contained in a signal. 
% Energy is particularly important in systems like communication and signal processing.
% Energy of a signal is half of it's sampling frequency or sampling rate

clc;
clear all;
close all;

% parameters
srate = 2000;
time = 0:1/srate:1;

% sinsodial signal
sine = sin(2 * pi * 5 * time + 0);

figure(1), clf
plot(time,sine,'k',LineWidth=2);
title('Sinesodial signal'),xlabel('Time (Sec)'),ylabel('Amplitude');

% calculating it's energy
energy = sum(abs(sine).^2);
disp(['Energy of a signal: ', num2str(energy)]);

