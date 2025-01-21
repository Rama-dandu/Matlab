
%% Envelope Detection - Envelope detection for an amplitude-modulated (AM) signal using the Hilbert transform.
clc;
clear all;
close all;

fs = 1000;
time = 0:1/fs:1;

% Carrier signal
fc = 50; %carrier frequency 50 Hz
carrier_signal = sin(2 * pi * fc * time);

% Modulationg signal
fm = 5;
mod_signal = 1 + 0.5 * sin(2 * pi * fm * time);

% Amplitude modulated signal
am_singnal = carrier_signal .* mod_signal; % modulates the carrier's amplitude according to the modulating signal, creating an AM signal.

% envelope detection using helbert transform
envelope = abs(hilbert(am_singnal));

% Plotting
figure(1), clf
subplot(311);
plot(time,carrier_signal,'black',LineWidth=1.5);
title('Carrier Signal'), xlabel('Time (Sec)'), ylabel('Amplitude');
grid on;

subplot(312);
plot(time,mod_signal,'black',LineWidth=1.5);
title('Modulating Signal'), xlabel('Time (Sec)'), ylabel('Amplitude');
grid on;

subplot(313);
plot(time, am_singnal,'b',time,envelope,'r',time,-envelope,LineWidth=1.5);
title('Envelope Detection using Hilbert Transorm'), xlabel('Time (Sec)'),ylabel('Amplitude');
grid on

%% Notes
%  An envelope represents the absolute amplitude variation of the signal over time, irrespective of the sign of the original signal.
%  The Hilbert transform inherently calculates the absolute value of the complex signal's magnitude, which removes any phase information related to the sign of the amplitude.
