%  IM331 - Prof. Jose Maria - Campinas, 22/03/2018.
%
%  Convergência da Série de Fourier e Fenômeno de Gibbs
%                                  4                1               1
%     Considere a equação   x(t)=-----[ sen(w1*t)+----sen(3*w1*t)+----sen(5*w1*t)+...  
%                                  pi               3               5
%
%
clear all
close all
clc
%
dt=0.001;        % Passo de tempo em segundos (discretização do tempo)
t=[0:dt:1];      % Define o vetor tempo t de 0 a 1 segundos com discretização dt.
%
x=[];  x_tmp=zeros(size(t)); %  Define uma matriz vazia x e define o 
                             %  vetor x_tmp do mesmo tamanho do vetor t.
%  Todos os elementos de x_tmp são zeros.
for n=1:2:39         % Inicia um laço onde n são 1,3,5,...,39 
                     % (n = 39 implica 20 Somas parciais).
    x_tmp=x_tmp+4/pi*(1/n*sin(2*pi*n*t)); % expressão do MATLAB  da Eq. acima, 
                                          % e o resultado de cada soma parcial
                                          % é armazenado no vetor x-tmp.
    x=[x; x_tmp];    % Cada linha da matriz x tem uma soma parcial correspondente 
                     % da Eq. acima. Por examplo, a segunda linha de x
                     % corresponde a soma de dois termos (i.e. n=3).
end                  % Fim do laço
plot(t,x(3,:),'k',t,x(7,:),'b',t,x(20,:),'r')
xlabel('\itt\rm (segundos)');
ylabel('\itx\rm(\itt\rm)')         % Faz o gráfico dos resultados só para  
legend('n = 3','n = 7','n = 20')   % 3, 7 e 20 somas parciais versus o tempo.
grid on
