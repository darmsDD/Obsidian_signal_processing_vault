function valid = isAddNegativeFrequenciesValid(vector_H_analitico_add_f_negativo,vector_H_experimental_add_f_negativo)

valid = 1;

%% Verifica se as operações estão corretas igualando o abs das frequencias negativas e positivas (ignorando a posição 0)
[qtd_linhas_analitico,qtd_colunas_analitico] = size(vector_H_analitico_add_f_negativo);
vetor_frequencias_negativas_frf_analitica = vector_H_analitico_add_f_negativo(ceil(qtd_linhas_analitico/2)+1:end,:);
vetor_frequencias_negativas_frf_analitica = flipud(vetor_frequencias_negativas_frf_analitica);

vetor_frequencias_positivas_frf_analitica = vector_H_analitico_add_f_negativo(2:ceil(qtd_linhas_analitico/2),:);
valid = valid & isequal(abs(vetor_frequencias_negativas_frf_analitica),abs(vetor_frequencias_positivas_frf_analitica));

[qtd_linhas_experimental,qtd_colunas_experimental] = size(vector_H_experimental_add_f_negativo);
vetor_frequencias_negativas_frf_experimental = vector_H_experimental_add_f_negativo(ceil(qtd_linhas_experimental/2)+1:end,:);
vetor_frequencias_negativas_frf_experimental = flipud(vetor_frequencias_negativas_frf_experimental);

vetor_frequencias_positivas_frf_experimental = vector_H_experimental_add_f_negativo(2:ceil(qtd_linhas_experimental/2),:);
valid = valid & isequal(abs(vetor_frequencias_negativas_frf_experimental),abs(vetor_frequencias_positivas_frf_experimental));

end