%Passando o array todo
[array_s,array_A] = newpronySIMO(vector_h_analitico,dt,8);
%[s,A] = newpronySIMO(vector_h_experimental,dt,8);
 array_A = array_A';
 vector_wn = abs(array_s);
 quantidade_frequencias = length(vector_wn);
 count = 0;
 diff_frequencies = [];
 for i=1:quantidade_frequencias
    [value, min_idx] = min(abs(vector_wn(i)/(2*pi) - abs(fn)));
    if(value <170)
        diff_frequencies(i) = value;
        prony_modal(min_idx,:) = abs(array_A(:,i));
    end
 end

prony_modal_min = min(prony_modal(:));
prony_modal_max = max(prony_modal(:));

prony_modal_norm = 2 * (prony_modal - prony_modal_min) / (prony_modal_max - prony_modal_min) - 1;
distances = (90e-3:70e-3:770e-3);
[~,tamanho_distancia] = size(prony_modal);
for i=1:length(fn)
    figure;
    hold on;
    plot(distances(1:tamanho_distancia),prony_modal(i,:));
    plot(distances(1:tamanho_distancia),phi(90e-3/dx:70e-3/dx:650e-3/dx,i));
    legend("prony","analitico");
    hold off;
end