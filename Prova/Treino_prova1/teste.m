% Parameters
Fs = 1000;                  % Sampling frequency (arbitrary for this)
N = 4;                      % Number of FFT points
t = (0:N-1) / Fs;           % 4 time samples

% Signal: cosine at 250 Hz
x = cos(2*pi*250*t);

% Compute 4-point FFT
X = fft(x, N);

% Display result
disp('FFT result:')
disp(X)

% Frequency axis (in Hz)
f = Fs * (-N/2:N/2-1) / N;

% Plot
stem(f, fftshift(abs(X)))
xlabel('Frequency (Hz)')
ylabel('|X(k)|')
title('4-point FFT')
grid on