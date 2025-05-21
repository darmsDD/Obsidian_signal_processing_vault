clc; close all; clear all;

N_final = 32;
i = 32;
%while(i <= N_final)
    N = i;
    T = 1;
    dt = T/N;
    fa = 1/dt;
    df = fa/N;
    
    t_axis = (0:N-1)*dt;
    
    X = zeros(1,N); 
    for k=0:N-1
        sum_temp = 0;
        for n=0:N-1
            sum_temp = sum_temp + exp(-n*(dt + 1j*2*pi*k/N));
        end
        X(k+1) = sum_temp/N;
    end
    %calculo dos coeficientes de fourier
    k_values = [0:N/2-1];
    syms X_k(k)

    X_k(k) = (1 - exp(-T))/(T + 2j*pi*k);


    f_axis = (0:N-1)*df;
    stem(k_values,abs(X(1:N/2)));
    hold on;
    stem(k_values,abs(X_k(k_values)));
   
 %   i = i*2;
%end

