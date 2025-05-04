%  IM331 - Prof. Jose Maria - Campinas, 22/03/2018.
%
%  Rebatimento ("Aliasing")
%
clear all
close all
clc
%
%  Gera um Sinal Senoidal com Vazamento,    x(t)=cos(2*pi*fo*t)
% 
dt=0.01; %  discretização no tempo - 
%T=1.5; % comprimento do sinal 
T=2.0; % comprimento do sinal
fo=1.5;   %  frequencia do sinal [Hz] (sem aliasing)
%fo=105;   %  frequencia do sinal [Hz] (com aliasing)
ti=0;  %  tempo inicial
%ts=5.0;
ts=T-dt;  %  tempo final c/ no. inteiro de períodos
t=[ti:dt:ts];  % vetor de tempo
omega=2*pi*fo;  %  frequencia em rad/s
xo=10; % amplitude do sinal
x=xo*cos(omega*t);  % função cosseno
figure    % grafico do seno no tempo
plot(t,x,'-o')
xlabel('t')
ylabel('x(t)')
title('função cos(wt)')
grid
%
%   Transformada de Fourier do Sinal, X(omega)
%
Np=length(t); %  numero de pontos do vetor tempo
df=1/(Np*dt); % delta na frequencia - discretização
fa=1/dt  % frequencia de amostragem - (fa >= 2*fmax do sinal)
fa>=fo  % sim = 1 e não = 0
% fp=0:df:(Np/2);
fp=[0:df:df*(0.5*Np-1)];  % vetor de frequencias positivas
fn=[-df*(0.5*Np):df:-df]; % vetor de frequencias negativas
f=[fn fp];  % vetor de frequencias positivas e negativas
X=(1/Np)*fft(x);  %  Tansformada de Fourier do sinal. Devido a forma que a trasformada de Fourier 
                  %  direta foi definida no Matlab é necessário dividir pelo numero de pontos
                  %  para obter-se a amplitude correta na frequencia (metade daquela no tempo)!!
Xc=fftshift(X);  %  função que mostra a fft do sinal, incluindo as partes positivas e negativas da frequencia


figure; % grafico do valor absoluto da transformada   
%plot(f,abs(Xc))
stem(f,abs(Xc))
xlabel('f')
ylabel('|X(f)|')
title('FFT do sinal com parte negativa e positiva da frequencia')
grid

Xp=X(1:Np/2);  % só a parte positiva da transformada
figure;
stem(fp,abs(Xp))
xlabel('f')
ylabel('|X(f)|')
title('FFT do SINAL SÓ COM A PARTE POSITIVA DAS FREQUENCIAS')
grid

