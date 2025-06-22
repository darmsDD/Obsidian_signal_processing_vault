close all; clear all; clc;

%Pede-se acrescentar ao script da aula de 22/5 o cálculo da DEP através da função de 
% autocorrelação do sinal x(t). Calcular a autocorrelação 
% através do script pela definição de média do produto de x(t) e x(t+tau).
nb=512;
x=randn(1,nb*1024);
N=length(x);
Nb=N/nb;
n=(0:pi/Nb:pi*(1-1/Nb));
hn=ones(1,Nb)-cos(n).^2;
dt=1e-3;
t=0:dt:(Nb-1)*dt;
T=Nb*dt;
df=1/T;
S=zeros(1,Nb);

n2=(0:pi/N:pi*(1-1/N));
hn2=ones(1,N)-cos(n2).^2;
S_auto_correlation = zeros(1,N);
Rxx = Auto_correlation(hn2.*x,dt);
S_auto_correlation = 1/N*abs(fft(Rxx));
for n=1:nb
    X=1/Nb*fft(hn.*x((n-1)*Nb+1:n*Nb));
    S=S+(abs(X)).^2;
    %S=S+(T*abs(X)).^2;
    
end
S=8/3*S/nb/df;
f=(0:Nb/2-1)*df;
plot(f,S(1:Nb/2));
hold on;
S_auto_correlation = S_auto_correlation*8/3/df;
plot(f,S_auto_correlation(1:Nb/2));
