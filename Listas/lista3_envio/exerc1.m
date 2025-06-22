clc; close all; clear;


fa = 10000; % 10kHz pelo enunciado
N = 1024; % Escolhi de maneira arbitrária
dt = 1/fa; % Define delta t
df = fa/N; % Define delta f
f1 = 2000; % Define a frequência 1
f2 = 4000; % Define a frequência 2

t = (0:N-1)*dt; %define o eixo do tempo. 
% O enunciado pede para criarmos uma função periódica de 2000 e
% 4000hz de amplitude unitária. Vou usar uma soma de cossenos.
% Para determinar a frequência, basta usar cos(2*pi*f0*t), sendo
% f0 a frequencia desejada.
x = cos(2*pi*f1*t) + cos(2*pi*f2*t);

% fft do matlab
fftX = fft(x.*hanning(N)')/N;

% dft na mão
dftX = zeros(N);
for k = 0:N-1
    sum_temp = 0;
    for n=0:N-1
        sum_temp = sum_temp + x(n+1)*exp(-1i*2*pi*k*n/N);
    end
    dftX(k+1) = sum_temp;
end

dftX = dftX./N;


eixo_f = (0:N-1)*df;
figure;
subplot(3,1,1);
plot(eixo_f(1:N/2),abs(fftX(1:N/2)),"blue");
title("fft");
subplot(3,1,2);
plot(eixo_f(1:N/2),abs(dftX(1:N/2)),"red");
title("dft");


%--------------------
% fft com zoom
%--------------------
size_interval = 1000;
fnyq = fa/2;
Z = fnyq/size_interval; %define o fator de zoom
fshift= 1500; %para onde vai shiftar a frequência
Nz = Z*N; %define o novo número de amostras
tz = (0:Nz-1)*dt; %define o novo eixo no tempo
xz = cos(2*pi*f1*tz) + cos(2*pi*f2*tz); %Define o novo x
xz = xz.*exp(-1i*2*pi*fshift*tz); % Shift de x para a frequência desejada
% Filtragem
fc = 1000;
fnyq = fa/2;
[b,a] = butter(6,fc/fnyq,"low");
xz_filtered = filter(b,a,xz); 

% Volta ao número de amostras anterior
xN = xz_filtered(1:Z:Nz);

fftXN = fft(xN.*hanning(N)')/N;

faz = fa/Z; % Nova frequencia de amostragem
dfz = df/Z; % Novo delta f

novo_eixo_f = fshift + (0:N-1)*dfz; % novo eixo de frequencias
subplot(3,1,3);
plot(novo_eixo_f(1:N/2),abs(fftXN(1:N/2)));
title("zoom na fft");























