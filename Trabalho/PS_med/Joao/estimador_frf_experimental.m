%clc; clear all; close all;
[f_vector,estimator_data] = readuff("H1_2,1(f) Jun 12, 2025 09-29-09.uff");
[f_vector2,coeff_data] = readuff("Coh2,1(f) Jun 12, 2025 09-29-09.uff");
[t_vector,x_data] = readuff("input1(t) Jun 12, 2025 09-29-09.uff");
f_vector(end)
N = length(estimator_data);
figure;
hold on;
subplot(2,1,1);
plot(f_vector(1:1600),db(abs(estimator_data(1:1600)/1600)));
title("FRF experimental");
xlabel("Hertz");
ylabel("Db(g/lbf)");
subplot(2,1,2);
plot(f_vector2(1:1600),abs(coeff_data(1:1600)));
title("Coeficiente de coerência ordinária");
ylabel("Db(g/lbf)");
hold off;

% figure;
% plot(1/length(x_data)*abs(fft(x_data)));