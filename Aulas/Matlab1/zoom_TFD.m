%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% exercicio4.m
clear all; %Limpando a memoria
close all
clc
f1 = 1001; %Primeira frequencia do sinal
f2 = 1005; %Segunda frequencia do sinal
fa = 4000; %Frequencia de amostragem
dt = 1/fa; %Intervalo de amostragem
N = 1024; %Numero de pontos amostrados
df = 1/N/dt; %Incremento de frequencia
T=1/df;
t = (0:N-1)*dt; %Eixo do tempo
x = 2*sin(2*pi*f1*t)-cos(2*pi*f2*t); %Sinal no tempo

X = fft(x.*hanning(N)')/N; %Calculo da TFD c/ janela Hanning para reduzir erro de leakage!
f = 0:df:(N-1)*df; %Eixo de frequencia
figure;subplot(2,1,1);plot(f(1:N/2),abs(X(1:N/2)));title('Espectro Original') %Plotando o espectro original


% Aplicando o zoom-FFT
Z = 100; %Fator de zoom
fz1 = 995; %Frequencia de shift para zoom
Nz = Z*N; %Numero de pontos amostrados
tz = (0:Nz-1)*dt; %Eixo do tempo
xz = 2*sin(2*pi*f1*tz)-cos(2*pi*f2*tz); %Sinal no tempo estendido
xzs = xz.*exp(-1i*2*pi*fz1*tz); %Fazendo o shift de xz1
[b,a] = butter(6,0.5/Z,'low') ;% Gera coeficientes de um filtro IIR (Infinite Impulse Response) passa-baixas com fN/(2*Z) de Freq de corte
xzs=filter(b,a,xzs); % Aplica o filtro no sinal 'shiftado'
faz=fa/Z; % Freq de reamostragem
dfz=df/Z; % Nova resolução em frequencia
xzr=xzs(1:Z:Nz);
Xz = fft(xzr.*hanning(N)')/N; %TFD no sinal re-amostrado
fz = fz1+(0:N-1)*dfz; % Ajuste da escala de frequencias
subplot(2,1,2);plot(fz(1:N/2),abs(Xz(1:N/2)));title('Espectro com Zoom') %Plotando o espectro com zoom
