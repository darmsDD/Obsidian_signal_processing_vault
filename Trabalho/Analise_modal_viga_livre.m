%  Solução Analitica da Viga Livre-Livre
clear all; close all; clc

%% Definição dos parâmetros variáveis

%    Dados Viga experimental de Proc. Sinais
E0=2.1e11; % modulo de elasticidade [Pa]
rho=7850; % densidade [kg/m3]
E=E0;

b=0.0195;  % base da seção transversal [m]
h=0.003;  % altura da seção transversal [m]
L=0.525;   % comprimento da viga [m]

%% Definição dos parâmetros constantes
lambda = [...
    4.73004074;
    7.85320462;
    10.9956078;
    14.1371655;
    17.2787597;
    pi*(2*6+1)/2;
    pi*(2*7+1)/2
];

% Constantes de normalização sigma_n
sigma = [...
    0.9825;   % modo 1 (cosh + cos)
    1.0008;
    0.9999;
    1.0000;
    0.9999;
    1.0;
    1.0
];


%% Cálculo das variáveis

m=rho*b*h;   %  massa por unidade de comprimento [kg/m]
I=b*h^3/12;    % momentode inércia
nmod=7; % numero de modos
dx=0.001; % discretização do espaço                                                       
x= 0:dx:L; % vetor do espaço discretizado
d=x/L ; % vetor de espaço admensional
phi=[];

%% Cálculo da forma dos modos

wn = zeros(1,nmod);
f = zeros(1,nmod);
for i=1:nmod
    f(i)=((lambda(i)^2/(2*pi*L^2))*sqrt(E*I/m));   % frequencia natural
    wn(i) = lambda(i)^2 * sqrt(E*I/m); % Frequência natural angular
    %lambda(i)
    for j=1:length(d)
         phi(j,i)=cosh(lambda(i)*d(j)) + cos(lambda(i)*d(j))...
        -sigma(i)*(sinh(lambda(i)*d(j))+sin(lambda(i)*d(j))); % forma do modo
       %phi(j,i)=cosh(lambda(i)*d(j))-cos(lambda(i)*d(j))...
       %-sigma(i)*(sinh(lambda(i)*d(j))-sin(lambda(i)*d(j))); % forma do modo
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
title('Frequencias e Modos da Viga free-free - Solução Analitica', 'FontSize', 24)
xlabel('Comprimento adimensional (x/L)', 'FontSize', 24)
ylabel('Amplitude', 'FontSize', 24)
lgd=legend({['f_0 = 0 Hz'],['f_1=' num2str(f(1)) 'Hz'],['f_2=' num2str(f(2)) 'Hz'],...
    ['f_3=' num2str(f(3)) 'Hz'],['f_4=' num2str(f(4)) 'Hz'],['f_5=' num2str(f(5)) 'Hz'],...
    ['f_6=' num2str(f(6)) 'Hz'],['f_7=' num2str(f(7)) 'Hz']},'Location','southwest');
lgd.FontSize=16;
grid

%% Cálculo da massa modal

m_modal = zeros(1,nmod);
size_x = length(x);
for i=1:nmod
    for j=1:size_x
        m_modal(i) = m_modal(i) + phi(j,i)^2*d(j);
    end
     m_modal(i) = m_modal(i)*m;
end




%% Cálculo da FRF
frf_viga = zeros(1,100);
size_frf = length(frf_viga);

for w=1:size_frf
    for j=1:nmod
        frf_viga(w) = frf_viga(w) + (phi(1,j)*phi(2,j))/(m_modal(j)*(wn(j)^2 - w^2));
    end
end

figure;
w_vector = 1:50;
plot(w_vector,frf_viga(1:size_frf/2));
title("FRF");




