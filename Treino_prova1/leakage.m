close all; clc; clear;

N = 4;
fa = 1000;
DeltaF = fa/N;
%--------------------------------------------------------
% Calcula a DFT de uma sequencia dada
%--------------------------------------------------------

m_pattern = [1,0,-1,0];
seq = m_pattern(mod(0:N-1,length(m_pattern))+ 1);
DFT_X = zeros(N); 
for k=0:N-1
    sum_temp = 0;
    for n=0:N-1
        sum_temp = sum_temp + seq(n+1)*exp(1i*2*pi*k*n/N);
    end
    DFT_X(k+1) = sum_temp; 
end

DFT_X = fftshift(DFT_X);
disp(DFT_X);

k_values = zeros(N);

if (mod(N,2)~=0)
    k_values = [ceil(-N/2):floor(N/2)];
else
    k_values = [-N/2:N/2 - 1];
end


f_values = k_values.*DeltaF;

stem(f_values,abs(DFT_X/N),"filled","red");
title("Desenha a dft de uma sequencia");
ylabel("DFT");
xlabel("f");


%--------------------------------------------------------
% Plota o grafico de um cos de 250hz
%--------------------------------------------------------

figure;
t = [0:1/10000:2/250];
m_c = cos(2*pi*250*t); % cos de 250hz.
plot(t,m_c);
title("Desenha um cos de 250 hz")
ylabel("cos(2*pi*250*t)");
xlabel("t");

%--------------------------------------------------------
% Pega 4 amostras com frequencia de amostragem = 1000HZ
% e compara com a nossa sequencia inicial
%--------------------------------------------------------


t = [0: N-1]/fa;
m_c2 = cos(2*pi*250*t);
if (m_c2 - seq) < 10^-4
    disp("A sequencia foi baseada em um cos de 250Hz");
    disp(seq)
    disp(m_c2)
else
    disp("As sequencias nao batem");
    disp(seq)
    disp(m_c2)
end

%--------------------------------------------------------
% Calcula a fft
%--------------------------------------------------------

m_fft = fft(m_c2);
fft_f_values = fa/N*[-N/2:N/2-1];

figure;
stem(fft_f_values,abs(fftshift(m_fft)/N),"filled");
title("Fft de um cos 250 hz com 5 amostras");
ylabel("FFT");
xlabel("f");








