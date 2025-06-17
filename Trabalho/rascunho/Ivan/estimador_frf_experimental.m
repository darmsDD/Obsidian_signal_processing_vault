clc; clear all; close all;
[f_vector,estimator_data] = readuff("H1_2,1(f) Jun 12, 2025 09-05-23.uff");
[f_vector2,coeff_data] = readuff("Coh2,1(f) Jun 12, 2025 09-05-23.uff");
[t_vector,x_data] = readuff("input1(t) Jun 12, 2025 09-05-23.uff");
f_vector(end)
N = length(estimator_data);
hold on;
subplot(2,1,1);
plot(f_vector,abs(estimator_data)/length(estimator_data));
subplot(2,1,2);
plot(f_vector2,coeff_data);
hold off;

% figure;
% plot(1/length(x_data)*abs(fft(x_data)));