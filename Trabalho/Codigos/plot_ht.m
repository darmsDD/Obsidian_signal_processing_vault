%% Plota o ht analítico e experimental
function mse = plot_ht(vector_h_analitico,vector_h_experimental,t,tamanho_fila,vector_nome_das_pessoas)
    output_folder = '../Imagens/ht/';
    
    mse = zeros(tamanho_fila,1);
    for numero_na_fila_medicao=1:tamanho_fila
        nome_do_aluno = vector_nome_das_pessoas(numero_na_fila_medicao);

        he = vector_h_experimental(:, numero_na_fila_medicao);
        ha = vector_h_analitico(:, numero_na_fila_medicao);      
        mse(numero_na_fila_medicao) = mean((he - ha).^2);

        % fig = figure("Name",nome_do_aluno);
        % hold on;
        % 
        % % Filtragem com zero-phase para não distorcer a fase:
        % plot(t,vector_h_experimental(:,numero_na_fila_medicao)','-o'); 
        % plot(t,vector_h_analitico(:,numero_na_fila_medicao)','LineWidth', 2.0);
        % 
        % xlabel("t");
        % ylabel("h");
        % legend("h(t) experimental","h(t) analitico");
        % hold off;
        % % monta o nome do arquivo de forma segura (converte o nome para string, caso não seja)
        % nome_arquivo = strcat(char(nome_do_aluno), '_h_t.eps');
        % full_path = fullfile(output_folder, nome_arquivo);
        % % salva em eps (modo vetor, alta qualidade)
        % print(fig, full_path, '-depsc');
    end

end