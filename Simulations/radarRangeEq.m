 %% Implemented equation 1.56

function [snr] = radar_eq(pt, f, g, sigma, te, b, nf, loss, range)
    c = 3.0e+8; % speed of light
    lambda = c / f; % wavelength
    % Convert parameters to dB
    p_peak = 10*log10(pt); % convert peak power to dB
    lambda_sqdb = 10*log10(lambda^2); % wavelength squared in dB
    sigmadb = 10*log10(sigma); % radar cross-section in dB
    four_pi_cub = 10*log10((4.0 * pi)^3); % (4pi)^3 in dB
    k_db = 10*log10(1.38e-23); % Boltzmann's constant in dB
    te_db = 10*log10(te); % noise temp. in dB
    b_db = 10*log10(b); % bandwidth in dB
    range_pwr4_db = 10*log10(range.^4); % target range^4 in dB
    
    % Calculate SNR (implemented eq 1.56)
    num = p_peak + g + g + lambda_sqdb + sigmadb;
    den = four_pi_cub + k_db + te_db + b_db + nf + loss + range_pwr4_db;
    snr = num - den;
end


close all
clear all

pt = 1.5e+6; % peak power in Watts
freq = 5.6e+9; % radar operating frequency in Hz
g = 45.0; % antenna gain in dB
sigma = 0.1; % radar cross section in m^2
te = 290.0; % effective noise temperature in Kelvin
b = 5.0e+6; % radar bandwidth in Hz
nf = 3.0; % noise figure in dB
loss = 6.0; % radar losses in dB
range = linspace(25e3,165e3,1000); % target range 25 - 165 Km, 1000 points

% Call radar_eq with proper arguments
snr1 = radar_eq(pt, freq, g, sigma, te, b, nf, loss, range);
snr2 = radar_eq(pt, freq, g, sigma/10, te, b, nf, loss, range);
snr3 = radar_eq(pt, freq, g, sigma*10, te, b, nf, loss, range);

% plot SNR versus range
figure(1)
rangekm  = range ./ 1000;
plot(rangekm,snr3,'k',rangekm,snr1,'k -.',rangekm,snr2,'k:')
grid
legend('\sigma = 0 dBsm','\sigma = -10dBsm','\sigma = -20 dBsm')
xlabel ('Detection range - Km');
ylabel ('SNR - dB');

snr1 = radar_eq(pt, freq, g, sigma, te, b, nf, loss, range);
snr2 = radar_eq(pt*.4, freq, g, sigma, te, b, nf, loss, range);
snr3 = radar_eq(pt*1.8, freq, g, sigma, te, b, nf, loss, range);
figure (2)
plot(rangekm,snr3,'k',rangekm,snr1,'k -.',rangekm,snr2,'k:')
grid
legend('Pt = 2.16 MW','Pt = 1.5 MW','Pt = 0.6 MW')
xlabel ('Detection range - Km');
ylabel ('SNR - dB');



