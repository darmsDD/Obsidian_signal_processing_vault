function plot_graficos_frf(frf_analitica,frf_experimental,coeff_experimental,input_experimental,f,t,nome_do_aluno)


%% Plot das FRFs e coeficiente de coerência

abs_frf_analitica = abs(frf_analitica);
abs_frf_experimental = abs(frf_experimental);
abs_coeff_experimental = abs(coeff_experimental);

% figure;
% plot(f(1:1600),db(abs_frf_analitica));
% xlabel("f (hertz)");
% ylabel("H(f) em db(g/lbf)");
% title("FRF Analítica");
% 
% 
% 
% figure;
% subplot(2,1,1);
% plot(f(1:1600),db(abs_frf_experimental));
% xlabel("f (hertz)");
% ylabel("H(f) em db(g/lbf)");
% title("FRF experimental");
% hold off;
% subplot(2,1,2);
% plot(f(1:1600),abs_coeff_experimental);
% title("Coeficiente de coerência ordinária");
% ylabel("Coh2,1(f)");
% xlabel("Hertz");




% FRF analítica vs experimental, e coerencia
fig = figure('Name',nome_do_aluno);
output_folder = '../Imagens/frf/';
subplot(2,1,1);
plot(f(1:1600),db(abs_frf_analitica));
hold on;
plot(f(1:1600),db(abs_frf_experimental));
%plot(f_vector(1:1600),db(abs(estimator_data(1:1600)/1)));
xlabel("f (hertz)");
ylabel("H(f) em db(g/lbf)");
title("FRF experimental versus FRF analítica");
legend("FRF analítca","FRF experimental");
hold off;
subplot(2,1,2);
plot(f(1:1600),abs_coeff_experimental);
title("Coeficiente de coerência ordinária");
ylabel("Coh2,1(f)");
xlabel("Hertz");
nome_arquivo = strcat(char(nome_do_aluno), '_frf_analitica_vs_experimental.eps');
full_path = fullfile(output_folder, nome_arquivo);
% salva em eps (modo vetor, alta qualidade)
print(fig, full_path, '-depsc');

% 
% figure;
% plot(f(1:1600),abs_coeff_experimental);
% title("Coeficiente de coerência ordinária");
% ylabel("Coh2,1(f)");
% xlabel("Hertz");

% figure;
% plot(t,input_experimental);
% title("Entrada");
% ylabel("x(t)");
% xlabel("t");



end