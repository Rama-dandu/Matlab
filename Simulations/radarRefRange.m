% This program implements Eq. (1.60)
clear all
close all

Rref = 86e3; % ref. range
tau_ref = .1e-6; % ref. pulsewidth
SNRref = 20.; % Ref SNR in dB
snrref = 10^(SNRref/10);
Sigmaref = 0.1; % ref RCS in m^2

Lossp = 2; % processing loss in dB
lossp = 10^(Lossp/10);

% Enter desired value
tau = tau_ref;
R = 120e3;
rangeratio = (Rref / R)^4;
Sigma = 0.2; 

% Implement Eq. (1.60)
snr = snrref * (tau / tau_ref) * (1. / lossp) * ...
(Sigma / Sigmaref) * rangeratio;
snr = 10*log10(snr) 