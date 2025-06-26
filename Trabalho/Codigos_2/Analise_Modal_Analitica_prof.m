%  Solução Analitica da Viga Engastada-Livre, Campinas 29/05/2020. Zema
%   Blevins, R.D., Formulas for natural frequency and mode shape, Van
%   Nostran, 1979, pag. 108.
%
clear all; close all; clc
%    Dados Viga experimental de Proc. Sinais
% ii=sqrt(-1);
E0=2.1e11 % modulo de elasticidade a�o [Pa]
rho=7850 % densidade a�o [kg/m3]
%eta=0.01 % fator de perda
E=E0;
% E=E0*(1+ii*eta) % modulo de elasticidade complexo
% E=0.69e11 % modulo de elasticidade Al [Pa]
% rho=2700 % densidade Al [kg/m3]
%
b=0.0195  % base da seção transversal [m]
h=0.003   % altura da seção transversal [m]
L=0.525   % comprimento da viga [m]
%
% b=0.04  % base da seção transversal [m]
% h=0.003   % altura da seção transversal [m]
% L=0.65   % comprimento da viga [m]
%
m=rho*b*h   %  massa por unidade de comprimento [kg/m]
I=b*h^3/12    % momentode inércia
nmod=7 % numero de modos
lambda=[1.87510407 4.69409113 7.85475744 10.99554073 14.13716839 pi*(2*6-1)/2 pi*(2*7-1)/2]; % constante 
sigma=[0.734095514 1.018467319 0.999224497 1.000033553 0.99998550 1.0 1.0];   % da solução analitica
dx=0.001; % discretização do espaço                                                       
x=[0:dx:L]; % vetor do espaço discretizado
d=x/L ; % vetor de espaço admensional
phi=[];
for i=1:nmod
    f(i)=((lambda(i)^2/(2*pi*L^2))*sqrt(E*I/m));   % frequencia natural
    %lambda(i)
    for j=1:length(d)
        phi(j,i)=cosh(lambda(i)*d(j))-cos(lambda(i)*d(j))...
       -sigma(i)*(sinh(lambda(i)*d(j))-sin(lambda(i)*d(j))); % forma do modo
    end
    phin(:,i)=phi(:,i)/max(abs(phi(:,i)));  % normalização unitária
end
phi0=zeros(size(phi(:,1)));  % vetor do modo zero
disp('Frequencias Naturais')
f
disp('Forma dos modos')
phi;
figure
plot(d,phi0,'k',d,phin,'LineWidth',3.0)
title('Frequencias e Modos da Viga Cantilever - Solução Analitica', 'FontSize', 24)
xlabel('Comprimento adimensional (x/L)', 'FontSize', 24)
ylabel('Amplitude', 'FontSize', 24)
lgd=legend({['f_0 = 0 Hz'],['f_1=' num2str(f(1)) 'Hz'],['f_2=' num2str(f(2)) 'Hz'],...
    ['f_3=' num2str(f(3)) 'Hz'],['f_4=' num2str(f(4)) 'Hz'],['f_5=' num2str(f(5)) 'Hz'],...
    ['f_6=' num2str(f(6)) 'Hz'],['f_7=' num2str(f(7)) 'Hz']},'Location','southwest');
lgd.FontSize=16;
grid
