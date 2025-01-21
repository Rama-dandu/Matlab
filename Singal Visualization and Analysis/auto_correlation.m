
%% Auto correlation of signal
% Auto correlation - only shows non-negative values, Is normalized to have a peak value of 1 at lag 0.
% Cross correlation - Shows both negative and positive lags, providing more detailed symmetry.Can also handle cross-correlation if applied to two signals.

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
grid on;

% autocorr_signal = autocorr(sine);
[auto_corr, lags] = xcorr(sine, 'coeff');

lags_sec = lags/srate;  % converting lags from samples to seconds

subplot(212);
plot(lags_sec, auto_corr);
title('Auto correlation of sine wave'), xlabel('Lag time(Sec)'), ylabel('Normalied Amplitude');
grid on;

% Add vertical lines for better clarity
hold on;
xline(0, 'r--', 'Lag = 0', 'LineWidth', 1.5); % Vertical line at lag = 0
hold off;

% Display key observations
disp('Key Observations:');
disp(['1. Maximum autocorrelation occurs at Lag = 0, as the signal perfectly aligns with itself.']);
disp(['2. Periodic peaks are observed at lags corresponding to the signal''s period (T = ' num2str(1/50) ' sec).']);
disp(['3. Negative lags show similar behavior due to symmetry of autocorrelation.']);
