function [array_A,array_s,nmod,mse,isAnalitical] =   prony_vector_graficos(vector_h_analitico,vector_h_experimental,tamanho_fila,t,vector_nome_das_pessoas)

isAnalitical = input("Analytical (1)| Experiment (not one):");
nmod = input("Type order (will be multiplied by 2):");
dt = t(2) - t(1);
t_length = length(t);
array_A = zeros(nmod*2,tamanho_fila);
array_s = zeros(tamanho_fila,nmod*2);

mse = zeros(tamanho_fila,1);
for numero_fila_medicao=1:tamanho_fila
     nome_do_aluno = vector_nome_das_pessoas(numero_fila_medicao);
    if(isAnalitical==1)
        nome_arquivo = strcat(char(nome_do_aluno), '_analitico_prony.png');
        [s,A] = newpronySIMO(vector_h_analitico(:,numero_fila_medicao),dt,nmod);
    else
        nome_arquivo = strcat(char(nome_do_aluno), '_experimental_prony.png');
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
    
    fig = figure('Name',nome_arquivo);
    analytical_or_experimental_string = "experimental";
     if(isAnalitical==1)
        plot(t,vector_h_analitico(:,numero_fila_medicao)');
        analytical_or_experimental_string = "analitico";
        output_folder = '../Imagens/prony_vector/analitico';
        current_h = vector_h_analitico(:, numero_fila_medicao);      
     else
        plot(t,vector_h_experimental(:,numero_fila_medicao)');
        output_folder = '../Imagens/prony_vector/experimental';
        current_h = vector_h_experimental(:, numero_fila_medicao);
     end
     
    
     mse(numero_fila_medicao) = mean((current_h - real(h_prony)').^2);
     hold on;
     plot(t,real(h_prony));
     legend(analytical_or_experimental_string,"prony");
     full_path = fullfile(output_folder, nome_arquivo);
     %print(fig, full_path, '-dpng');
     %set(fig, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 20 16]);
     %print(fig, full_path, '-dpng', '-r300');

end

end