function PAP = power_aperture(snr,tsc,sigma,range,te,nf,loss,az_angle,el_angle)
    % This program implements Eq. (1.67)
    Tsc = 10*log10(tsc); % convert Tsc into dB
    Sigma = 10*log10(sigma); % convert sigma to dB
    four_pi = 10*log10(4.0 * pi); % (4pi) in dB
    k_db = 10*log10(1.38e-23); % Boltzmann's constant in dB
    Te = 10*log10(te); % noise temp. in dB
    range_pwr4_db = 10*log10(range.^4); % target range^4 in dB

    omega = az_angle * el_angle / (57.296)^2; % compute search volume in steradians
    Omega = 10*log10(omega); % search volume in dB

    % Implement Eq. (1.67)
    PAP = snr + four_pi + k_db + Te + nf + loss + range_pwr4_db + Omega - Sigma - Tsc;
end


% Use this program to reproduce Fig. 1.16 of the text.
close all
clear all

tsc = 2; % Scan time is 2.5 seconds
sigma = 3.162; % radar cross section in m squared
te = 290.0; % effective noise temperature in Kelvins
snr = 20; % desired SNR in dB
nf = 8.0; % noise figure in dB
loss = 6.0; % radar losses in dB
az_angle = 180; % search volume azimuth extent in degrees
el_angle = 135; % search volume elevation extent in degrees
range = 75e3;

pap = power_aperture(snr,tsc,sigma,range,te,nf,loss,az_angle,el_angle);

disp(pap);