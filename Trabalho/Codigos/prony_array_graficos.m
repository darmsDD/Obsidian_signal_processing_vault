function [array_A,array_s,nmod] =   prony_array_graficos(vector_h_analitico,vector_h_experimental,tamanho_fila,t)

isAnalitical = input("Analytical (1)| Experiment (0):");
nmod = input("Type number of mods (will be multiplied by 2):");
dt = t(2) - t(1);
t_length = length(t);
if(isAnalitical)
        [s,A] = newpronySIMO(vector_h_analitico,dt,nmod);
    else
        [s,A] = newpronySIMO(vector_h_experimental,dt,nmod);
end

size(s)
size(A)
for numero_fila_medicao=1:tamanho_fila
    
    h_prony = zeros(1,t_length);
    r_length = size(A,1);
    for i=0:t_length-1
        for r=1:r_length
            h_prony(i+1) = h_prony(i+1) + A(r,numero_fila_medicao)*exp(s(r)*dt*i);
        end
    end
     figure;
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
end






