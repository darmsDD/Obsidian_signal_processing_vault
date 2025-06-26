%% Prony
function prony_vector(vector_h_analitico,vector_h_experimental,tamanho_fila,t,nmod,fn,phi,dx)
    [array_A,array_s,nmod] = prony_e_graficos(vector_h_analitico,vector_h_experimental,tamanho_fila,t,nmod);
     array_A = array_A';
     array_wn = abs(array_s);
    
    
    [l,c] = size(array_wn);
    prony_modal = [];
    prony_modaln = [];
    for i=1:l
         for j=1:c
            [value, min_idx] = min(abs(array_wn(i,j)/(2*pi) - fn));
            if(abs(value) < 1000)
               prony_modal(min_idx,i) = abs(array_A(i,j)); 
            end
    
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

end