function plot_graficos_frf(frf_viga,f)

%% Plot das FRFs e coeficiente de coerência

% Só a FRF analítica
figure;
plot(f(1:1600),db(9.81/4.44822*abs(frf_viga(1:1600))));
xlabel("f (hertz)");
ylabel("H(f) em db(g/lbf)");
title("FRF Analítica");

% FRF experimental e coerência
% [f_vector,estimator_data] = readuff("../PS_med/Joao/H1_2,1(f) Jun 12, 2025 09-29-09.uff");
% [f_vector2,coeff_data] = readuff("../PS_med/Joao/Coh2,1(f) Jun 12, 2025 09-29-09.uff");
% [t_vector,x_data] = readuff("../PS_med/Joao/input1(t) Jun 12, 2025 09-29-09.uff");

[f_vector,estimator_data] = readuff("../Dados/H1_2,1(f) Jun 12, 2025 09-05-23.uff");
[f_vector2,coeff_data] = readuff("../Dados/Coh2,1(f) Jun 12, 2025 09-05-23.uff");
[t_vector,x_data] = readuff("../Dados/input1(t) Jun 12, 2025 09-05-23.uff");


figure;
subplot(2,1,1);
plot(f_vector(1:1600),db(abs(estimator_data(1:1600)/1800)));
xlabel("f (hertz)");
ylabel("H(f) em db(g/lbf)");
title("FRF experimental");
hold off;
subplot(2,1,2);
plot(f_vector2(1:1600),abs(coeff_data(1:1600)));
title("Coeficiente de coerência ordinária");
ylabel("Coh2,1(f)");
xlabel("Hertz");




% FRF analítica vs experimental, e coerencia

figure;
plot(f(1:1600),db(9.81/4.44822*abs(frf_viga(1:1600))));
hold on;

plot(f_vector(1:1600),db(abs(estimator_data(1:1600)/1800)));
xlabel("f (hertz)");
ylabel("H(f) em db(g/lbf)");
title("FRF experimental versus FRF analítica");
legend("FRF analítca","FRF experimental");

hold off;

figure;
plot(f_vector2(1:1600),abs(coeff_data(1:1600)));
title("Coeficiente de coerência ordinária");
ylabel("Coh2,1(f)");
xlabel("Hertz");

figure;
plot(t_vector,x_data);
title("Entrada");
ylabel("x(t)");
xlabel("t");



end