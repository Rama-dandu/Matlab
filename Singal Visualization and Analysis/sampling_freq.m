%% Sampling rate/Sampling frequency - number of samples per second taken in continuous signal(analog signal) to convert it into discrete signal(digital signal).
% measured in Hertz (Hz)
% Nyquist Theorem - To avoid aliasing (distortion due to insufficient sampling), the sampling rate should be at least twice the highest frequency component of the signal being sampled.
% Nyquest rate -> fs >= 2 * fmax

% parameters
freq = 10;
srates = [15 25 50];
time = 0:0.001:1;
signal = sin(2 * pi * freq * time);

% plotting
figure(1),clf
% subplot(211);
subplot(length(srates)+1, 1, 1);
plot(time,signal,'k',linewidth = 2);
title('Continuois signal');
xlabel('Time (sec)');
ylabel('Amplitude');
legend('Analog signal');
grid on;

% loop through sampling rate
for i=1:length(srates)
    fs = srates(i);
    time_s = 0:1/fs:1;
    sampled_signal = sin(2 * pi * freq * time_s); %sampled signal

    % plotting
    subplot(length(srates)+1, 1, i+1);
    stem(time_s,sampled_signal,'black','filled','LineWidth',1);
    hold on;
    plot(time,signal,'k',LineWidth=1);
    title(['Sampled signal (sampling rate ',num2str(fs),' Hz)']);
    xlabel('Time (Sec)');
    ylabel('Amplitude');
    grid on;

    % Add explanation text
    if fs < 2 * freq
        text(0.5, 0.5, 'Aliased (Sampling Rate < 2*f_{signal})', ...
             'Units', 'normalized', 'Color', 'red', 'FontWeight', 'bold');
    elseif fs == 2 * freq
        text(0.5, 0.5, 'Critical Sampling (Sampling Rate = 2*f_{signal})', ...
             'Units', 'normalized', 'Color', 'orange', 'FontWeight', 'bold');
    else
        text(0.5, 0.5, 'Well Sampled (Sampling Rate > 2*f_{signal})', ...
             'Units', 'normalized', 'Color', 'green', 'FontWeight', 'bold');
    end
end