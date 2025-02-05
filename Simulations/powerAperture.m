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

tsc = 2.5; % Scan time is 2.5 seconds
sigma = 0.1; % radar cross section in m squared
te = 900.0; % effective noise temperature in Kelvins
snr = 15; % desired SNR in dB
nf = 6.0; % noise figure in dB
loss = 7.0; % radar losses in dB
az_angle = 2; % search volume azimuth extent in degrees
el_angle = 2; % search volume elevation extent in degrees
range = linspace(20e3,250e3,1000); % range to target 20 Km 250 Km, 1000 points

pap1 = power_aperture(snr,tsc,sigma/10,range,te,nf,loss,az_angle,el_angle);
pap2 = power_aperture(snr,tsc,sigma,range,te,nf,loss,az_angle,el_angle);
pap3 = power_aperture(snr,tsc,sigma*10,range,te,nf,loss,az_angle,el_angle);

% Plot power aperture product versus range
figure(1)
rangekm  = range ./ 1000;
plot(rangekm, pap1, 'k', rangekm, pap2, 'k-.', rangekm, pap3, 'k:')
grid
legend('\sigma = -20 dBsm', '\sigma = -10dBsm', '\sigma = 0 dBsm')
xlabel('Detection range in Km')
ylabel('Power aperture product in dB')

% generate Figure 1.16b
lambda = 0.03; % wavelength in meters
G = 45; % antenna gain in dB
ae = linspace(1,25,1000);% aperture size 1 to 25 meter squared, 1000 points
Ae = 10*log10(ae);
range = 250e3; % range of interest is 250 Km

pap1 = power_aperture(snr,tsc,sigma/10,range,te,nf,loss,az_angle,el_angle);
pap2 = power_aperture(snr,tsc,sigma,range,te,nf,loss,az_angle,el_angle);
pap3 = power_aperture(snr,tsc,sigma*10,range,te,nf,loss,az_angle,el_angle);

Pav1 = pap1 - Ae;
Pav2 = pap2 - Ae;
Pav3 = pap3 - Ae;

figure(2)
plot(ae,Pav1,'k',ae,Pav2,'k -.',ae,Pav3,'k:')c
grid
xlabel('Aperture size in square meters')
ylabel('Pav in dB')
legend('\sigma = -20 dBsm','\sigma = -10dBsm','\sigma = 0 dBsm');
