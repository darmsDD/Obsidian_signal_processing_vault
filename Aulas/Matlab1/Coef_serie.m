%  IM331 - Prof. Jose Maria - Campinas, 22/03/2018.
%
%  Coeficientes da da Série de Fourier calculada para r*Tp períodos!
%                                  1               
%     Considere a equação   c_n =------Int_{0}^{r*Tp}[ x(t)exp(-j2*pi*n*t/Tp)]dt   
%                                 r*Tp              
%
%
clear all
close all
clc
%
r=3; cn=[]; % Define um parametro r para o numero de períodos, e a matriz cn
            % para os coeficientes da série de Fourier.
for n=1:10*r
    temp1=0; temp2=0;  % Define um laço para os coef. da Fourier até 10 Hz 
                       % e as variaveis temporárias.
    for k = 1:2:2*r    % Este laço calcula a integral para os intervalos de
                       %x(t) = 1 e armazena em temp1.
        tmp_odd = exp(-i*(k/r)*n*pi);
        temp1=temp1+tmp_odd;
    end
    for k = 2:2:2*r-1  % outro laço para os intervalos de x(t) = -1
        tmp_even = -exp(-i*(k/r)*n*pi);
        temp2=temp2+tmp_even;
    end
    temp = -1/2 + temp1 + temp2-1/2*exp(-i*2*n*pi); % completa o cálculo da integral
    cn = [cn; i*temp/(pi*n)]; % "i*temp/(pi*n)" é o calculo final da integral 
                              % para cada valor de n
end       % Fim do laço.
stem([0:1/r:n/r],[0; abs(cn)], 'o', 'filled') % Gráfico do resultado usando 
                                              % comando steam.
[0:1/r:n/r] % define as frequencias (eixo horizontal) de 0 a 10 Hz a cada 1/3 Hz.
[0; abs(cn)]  % é a magnitude do coef. de Fourier
xlabel('Frequencia (Hz)') 
ylabel('Magnitude (\mid\it c_n \rm\mid)') % Comandos do Latex: "\mid" é para 
                                          % "|", "\it" é para 
                                          % fonte em itálico, "c_n" é para 
                                          % c índice n e "\rm" é para fonte normal.
