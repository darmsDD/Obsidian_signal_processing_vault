clc; close all; clear all;

% 1- calcular a TFD do sinal x(n) = 1 - cos(2*pi*n/64)
% x(n) = 1 - cos(pi*n/32)

function X_temp = m_DFT(current_x,current_N,row,column)
    X_temp = zeros(current_N);
    for k=0:current_N-1
        sum_temp = 0;
        for n=0:current_N-1
    
            sum_temp = sum_temp + current_x(n+1)*exp(-1i*2*pi*k*n/current_N);
        end
    X_temp(k+1) = sum_temp;
    end
    X_temp = X_temp./current_N;
    
    subplot(2,row,column);
    stem(0:current_N/2-1,abs(X_temp(1:current_N/2)));
end



N = 64;
n_values = 0:(2*N)-1;
x =  1 - cos(2*pi*n_values/64);
figure;
X = m_DFT(x,N,2,1);
title("DFT x(n) com 64 amostras");

N0 = 2*N;
X2 = m_DFT(x,N0,2,2);
title("DFT x(n) com 128 amostras");



%2 - Define um novo sinal xO e calcule a TFD
% x0(n) = x(n), n={0,1,2,...,N-1}
% x0(n) = 0, n>N-1.
x0 = zeros(N0);
x0(1:N) = x(1:N);
n0_values = 0:N0-1;
X0 = m_DFT(x0,N0,1,2);
title("DFT x0(n) com 128 amostras");







