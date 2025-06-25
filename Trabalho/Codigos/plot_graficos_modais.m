function plot_graficos_modais(phi,phin,fn,nmod,d)

%% Plot das formas modais
output_folder = '../Imagens/forma_modal_analitica/';
nome_arquivo = "Forma modal analítica por blevins";
fig = figure('Name',nome_arquivo);
phi0=zeros(size(phi(:,1)));  % vetor do modo zero
plot(d,phi0,'k',d,phin,'LineWidth',3.0)
title('Frequencias e Modos da Viga free-free - Solução Analitica', 'FontSize', 24)
xlabel('Comprimento adimensional (x/L)', 'FontSize', 24)
ylabel('Amplitude', 'FontSize', 24)
labels = cell(1, nmod+1);  % +1 porque a primeira frequência é 0 Hz

labels{1} = 'f_0 = 0 Hz';
for k = 1:nmod
    labels{k+1} = ['f_' num2str(k) ' = ' num2str(fn(k)) ' Hz'];
end

legend(labels,'Location','southwest');
%lgd.FontSize=16;
grid
full_path = fullfile(output_folder, nome_arquivo);
print(fig, full_path, '-depsc');