
%% Power Spectral Density - describes how the power (or energy) of a signal is distributed across different frequency components. 
% It is a key tool for analyzing signals in the frequency domain
% Units - watts/Hz

fs = 1000;
time = 0:1/fs:1;

% sine wave
fm = 50;
sine = sin(2 * pi * fm * time) + 0.5 * randn(size(time));

figure(1),clf
subplot(211);
plot(time,sine,'black',LineWidth=1.5);
title('Noisy sine wave'),xlabel('Time(Sec)'), ylabel('Amplitude');
grid on;

% Welch's method for PSD estimation
[pxx,f] = pwelch(sine,[],[],[],fs);

subplot(212);
plot(f,log10(pxx));
title('Power Spectral Density'),xlabel('Freqeuncy(Hz)'),ylabel('PSD');
grid on;

%% Observations
% The PSD plot shows how the power of the signal is distributed across different frequencies.
% Main Peak at 50 Hz:The sinusoidal component of the signal sin(2π50t) contributes most of the power, so the PSD has a prominent peak at 50Hz
% Broadband Noise: The added random noise spreads power across a wide range of frequencies, causing the PSD to rise at non-sinusoidal frequencies.