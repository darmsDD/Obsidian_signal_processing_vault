%  IM331 - Prof. Jose Maria - Campinas, 22/03/2018.  
%
%   Exemplos FFT 
%
clear all
close all
clc
%
%  Gera um Sinal Senoidal,    x(t)=cos(2*pi*fo*t)
% 
dt=0.01; %  discretização no tempo - 
%T=1.5; % comprimento do sinal
T=2.0; % comprimento do sinal
fo=1.5;   %  frequencia do sinal [Hz]
ti=0;  %  tempo inicial
%ts=5.0;
%ts=1.0-dt;  %  tempo final
ts=T-dt;  %  tempo final
t=[ti:dt:ts];  % vetor de tempo
omega=2*pi*fo;  %  frequencia em rad/s
xo=10; % amplitude do sinal
x=xo*cos(omega*t);  % função coseno
figure    % grafico do seno no tempo
plot(t,x,'-o')
xlabel('t')
ylabel('x(t)')
title('função cos(wt)')
grid

%return
 
%axis([-0.05 0.05 -1.15 1.15])


%
%   Transformada de Fourier do Sinal, X(omega)
%
X=fft(x);

figure; % grafico do valor absoluto da transformada - plot/stem    
plot(abs(X))
xlabel('Numero de pontos')
ylabel('|X(f)|')
title('FFT do sinal')
grid

figure; % grafico do valor absoluto da transformada    
stem(abs(X))
xlabel('Numero de pontos')
ylabel('|X(f)|')
title('FFT do sinal')
grid

return

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

figure; % grafico do valor absoluto da transformada incluido a parte negativa na positiva   
%plot(f,abs(X))
stem(f,abs(X))
xlabel('Frequencia [Hz]')
ylabel('|X(f)|')
title('FFT do sinal')
grid

Xc=fftshift(X);  %  função que mostra a fft do sinal, incluindo as partes positivas e negativas da frequencia
figure; % grafico do valor absoluto da transformada   
%plot(f,abs(Xc))
stem(f,abs(Xc))
xlabel('f')
ylabel('|X(f)|')
title('FFT do sinal com parte negativa e positiva da frequencia')
grid

return

Xp=X(1:Np/2);  % só a parte positiva da transformada
figure;
stem(fp,abs(Xp))
xlabel('f')
ylabel('|X(f)|')
title('FFT do SINAL SÓ COM A PARTE POSITIVA DAS FREQUENCIAS')
grid

