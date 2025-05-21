clc; close all; clear all;

N = 64;
N0 = 2*N;
n_values = 0:(N0)-1;
x =  1 - cos(2*pi*n_values/64);
x0 = zeros(1,N0);
x0(1:N) = x(1:N);

subplot(2,1,1);
stem(n_values(1:N0/2), x0(1:N0/2));
title("x0(n)");
ylabel("x0(n)");
xlabel("n");
% Parte 1. Calcular a fft da sequencia x0.

X0 = fft(x0)/sqrt(N0);
%subplot(2,2,[1,2]);
%stem([0:N0/2-1],abs(X0(1:N0/2)));
%title("fft(x)")
%hold on;
% Parte 2. Trocando a parte real e imaginaria da fft(x(n)).

X0_trocado = conj(X0)*1i;

% Parte 3 fft da fft

fft_X0_trocado = fft(X0_trocado)/sqrt(N0);

%subplot(2,2,3);
%stem([0:N0/2-1],abs(fft_X0_trocado(1:N0/2)));
%title("fft(X0)")


% Parte 4. Trocar parte real e imaginaria da fft dupla

fft_X0 = conj(fft_X0_trocado)*1i;

subplot(2,1,2);
stem([0:N0/2-1],abs(fft_X0(1:N0/2)));
title("abs(fft2 x0)")
ylabel("|fft_X0|");
xlabel("k");



