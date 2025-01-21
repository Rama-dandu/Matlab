
%% Cross Correlation
%  Cross correlation - Shows both negative and positive lags, providing more detailed symmetry.Can also handle cross-correlation if applied to two signals.

clc;
clear all;
close all;

srate = 1000; % sampling rate
time = 0:1/srate:1;
freq = 50;
phas = 0;

% orignal signal
sine1 = sin(2 * pi * freq * time + phas);

figure(1), clf
subplot(311);
plot(time,sine1,'k',LineWidth=1.5);
title('Original Signal'), xlabel('Time (Sec)'), ylabel('Amplitude');
grid on;

% Second signal
delay_samples = 100;
sine2 = 0.8 * [zeros(1,delay_samples), sine1(1:end-delay_samples)];

subplot(312);
plot(time,sine2,'k',LineWidth=1.5);
title('Delayed Signal'), xlabel('Time (Sec)'), ylabel('Amplitude');
grid on;

[cross_corr, lags] = xcorr(sine1,sine2,'coeff');
lags_sec = lags/srate; % converting lags to seconds

% Find the lag corresponding to the maximum correlation
[~, max_idx] = max(cross_corr); % Index of maximum correlation
time_delay = lags_sec(max_idx); % Time delay in seconds

subplot(313);
plot(lags_sec, cross_corr, 'k',LineWidth=1.5);
title('Cross correlation between Original Signal and Delayed Signal'), xlabel('Time (Sec)'), ylabel('Normalized Amplitude');
grid on;

% Display the delay result
disp(['The time delay between the two signals is ', num2str(time_delay), ' seconds.']);
