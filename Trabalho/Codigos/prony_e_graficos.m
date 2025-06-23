function prony_e_graficos(vector_h_analitico,vector_h_experimental,tamanho_fila,t,nmod)

dt = t(2) - t(1);
%% Prony
 [sTotal,ATotal] = newpronySIMO(vector_h_analitico,dt,nmod);
% plot(real(A(:,numero_fila_medicao))/max(real(A(:,numero_fila_medicao))))
% A = A';

figure;
% indices = find(imag(sTotal)>0);
% sTotal = sTotal(indices);
sTotal = fliplr(sTotal);
ATotal = ATotal ./ vecnorm(ATotal, 2, 2);
% size(sTotal)
% size(ATotal)
plot(abs(sTotal),real(ATotal));
title('Frequencias e Modos da Viga free-free - Solução Prony', 'FontSize', 24)
xlabel('Comprimento adimensional (x/L)', 'FontSize', 24)
ylabel('Amplitude', 'FontSize', 24)
labels = cell(1, nmod);  % +1 porque a primeira frequência é 0 Hz

for k = 1:length(indices)
    labels{k} = ['f_' num2str(k) ' = ' num2str(abs(sTotal(k))) ' Hz'];

end
legend(labels,'Location','southwest');
%lgd.FontSize=16;
grid



 t_length = length(t);
% [trash,r_length] = size(A);
% figure;
for numero_fila_medicao=1:tamanho_fila
    [s,A] = newpronySIMO(vector_h_experimental(:,numero_fila_medicao),dt,nmod);
    h_prony = zeros(1,t_length);
    r_length = length(A);
    for i=1:t_length
        for r=1:r_length
            %h_prony(i) = h_prony(i) + A(r,numero_na_fila_medicao)*exp(s(r)*dt*i);
            h_prony(i) = h_prony(i) + A(r)*exp(s(r)*dt*i);
        end
    end
    % figure;
    % plot(t,vector_h_experimental(:,numero_fila_medicao)');
    % hold on;
    % plot(t,real(h_prony));
    % legend("experimetal","prony");
end
% hold on





% omega = abs(s) ;
% xi = [];
% for numero_fila_medicao=1:1
%     A(:,numero_na_fila_medicao)
%     omega(numero_fila_medicao)
%     xi_temp = real(s(:,numero_na_fila_medicao)) ./ omega(numero_fila_medicao);
%     xi = [xi, xi_temp];
%     %xi(:,numero_fila_medicao)=xi(:,numero_fila_medicao)/max(abs(xi(:,numero_fila_medicao)));  % normalização unitária
% end
%xi = xi';
%plot(xi);






% A = [];
% s = [];
% for numero_fila_medicao=1:tamanho_fila
%     [s_temp,A_temp] = newpronySIMO(vector_h_experimental(:,numero_fila_medicao),dt,nmod);
%     A = [A, A_temp];
%     s = [s, s_temp'];
% end
% s = mean(s, 2);
% indices_validos = find(imag(s) > 0);
% s = s(indices_validos);

% size(s)
% size(A_total)
% 
% indices_validos = find(imag(s) > 0);
% s_validos = s(indices_validos);
% A_validos = A(indices_validos,:); % pega só as linhas dos modos válidos
% % %A_validos =A_total
% nmod = length(s); % número real de modos
% 
% %% Agora construir a "forma modal experimental"
% 
% % Cada linha de A_validos agora é um modo
% % Cada coluna corresponde a uma posição de excitação (q=1..9)
% % % O módulo dos resíduos dá a "forma modal relativa" (amplitude da forma modal)
% formas_modais_exp = abs(A_validos); % módulo (você pode manter o complexo se quiser analisar fase)
% % formas_modais_reais = real(A_validos);
% % formas_modais_norm = formas_modais_reais ./ max(abs(formas_modais_reais), [], 2);
% % % Agora vamos normalizar cada forma modal (por modo)
% formas_modais_norm = formas_modais_exp ./ max(formas_modais_exp,[],2);
% 
% % Agora podemos plotar
% figure;
% hold on;
% 
% for k = 1:nmod
%     plot(1:9, formas_modais_norm(k,:));
% end
% 
% xlabel('Posição de excitação (1 a 9)');
% ylabel('Amplitude normalizada');
% title('Formas modais experimentais');
% grid on;
% legendStrings = strcat('Modo ', string(1:nmod));
% legend(legendStrings);

end