function [array_A,array_s,nmod] =   prony_e_graficos(vector_h_analitico,vector_h_experimental,tamanho_fila,t,nmod)

isAnalitical = input("Analytical (1)| Experiment (anything else):");
nmod = input("Type number of mods (will be multiplied by 2):");
dt = t(2) - t(1);
t_length = length(t);
array_A = zeros(nmod*2,tamanho_fila);
array_s = zeros(tamanho_fila,nmod*2);
for numero_fila_medicao=1:tamanho_fila
    if(isAnalitical)
        [s,A] = newpronySIMO(vector_h_analitico(:,numero_fila_medicao),dt,nmod);
    else
        [s,A] = newpronySIMO(vector_h_experimental(:,numero_fila_medicao),dt,nmod);
    end
    array_A(:,numero_fila_medicao) = A;
    array_s(numero_fila_medicao,:) = s;
    h_prony = zeros(1,t_length);
    r_length = size(A,1);
    for i=0:t_length-1
        for r=1:r_length
            h_prony(i+1) = h_prony(i+1) + A(r)*exp(s(r)*dt*i);
        end
    end
     % figure;
     % analytical_or_experimental_string = "experimental";
     % if(isAnalitical)
     %    plot(t,vector_h_analitico(:,numero_fila_medicao)');
     %    analytical_or_experimental_string = "analitico";
     % else
     %    plot(t,vector_h_experimental(:,numero_fila_medicao)');
     % end
     % 
     % hold on;
     % plot(t,real(h_prony));
     % legend(analytical_or_experimental_string,"prony");
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