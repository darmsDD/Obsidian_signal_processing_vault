function [A,s,nmod] =   prony_array_graficos(vector_h_analitico,vector_h_experimental,tamanho_fila,t,vector_nome_das_pessoas)

isAnalitical = input("Analytical (1)| Experiment (0):");
nmod = input("Type number of mods (will be multiplied by 2):");
dt = t(2) - t(1);
t_length = length(t);
if(isAnalitical)
        [s,A] = newpronySIMO(vector_h_analitico,dt,nmod);
    else
        [s,A] = newpronySIMO(vector_h_experimental,dt,nmod);
end


for numero_fila_medicao=1:tamanho_fila
    
    h_prony = zeros(1,t_length);
    r_length = size(A,1);
    for i=0:t_length-1
        for r=1:r_length
            h_prony(i+1) = h_prony(i+1) + A(r,numero_fila_medicao)*exp(s(r)*dt*i);
        end
    end
    nome_do_aluno = vector_nome_das_pessoas(numero_fila_medicao);
    output_folder = '../Imagens/prony_array/';
    nome_arquivo = strcat(char(nome_do_aluno), '_prony_array.eps');
    fig = figure('Name',nome_arquivo);
     analytical_or_experimental_string = "experimental";
     if(isAnalitical)
        plot(t,vector_h_analitico(:,numero_fila_medicao)');
        analytical_or_experimental_string = "analitico";
     else
        plot(t,vector_h_experimental(:,numero_fila_medicao)');
     end

     hold on;
     plot(t,real(h_prony));
     legend(analytical_or_experimental_string,"prony");
     full_path = fullfile(output_folder, nome_arquivo);
     print(fig, full_path, '-depsc');
end






