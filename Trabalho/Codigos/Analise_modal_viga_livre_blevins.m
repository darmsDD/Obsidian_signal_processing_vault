%  Solução Analitica da Viga Livre-Livre
clear all; close all; clc

%% Definição dos parâmetros variáveis

numero_na_fila_medicao = 5;

%    Dados Viga experimental de Proc. Sinais
eta = 0.01;
E0=210e9; % modulo de elasticidade [Pa]
E=E0*(1+1i*eta); % modulo de elasticidade complexo
rho=7800; % densidade [kg/m3]
 E=E0;

b=13e-3;  % base da seção transversal [m]
h=13e-3;  % altura da seção transversal [m]
L=770e-3;   % comprimento da viga [m]

nmod = 12; % numero de modos

xi = 0.001; % + (0.01 - 0.001) * rand(1, nmod); % coeficiente de amortecimento
%% Definição dos parâmetros constantes
beta_first_5_positions = [...
    4.73004074;
    7.85320462;
    10.9956078;
    14.1371655;
    17.2787597;
];

% Constantes de normalização sigma_n
sigma_first_5_positions = [...
    0.982502215;   % modo 1 (cosh + cos)
    1.000777312;
    0.999966450;
    1.000001450;
    0.999999937;
];

size_beta_sigma_initial_vector = length(beta_first_5_positions);

lambda = zeros(1,nmod);
sigma = zeros(1,nmod);

lambda(1:size_beta_sigma_initial_vector) = beta_first_5_positions;
sigma(1:size_beta_sigma_initial_vector) = sigma_first_5_positions;

if(nmod > size_beta_sigma_initial_vector)
    for k=size_beta_sigma_initial_vector + 1:nmod
        lambda(k) = pi*(2*k+1)/2;
        sigma(k) = 1;
    end
end






%% Cálculo das variáveis

m=rho*b*h;   %  massa por unidade de comprimento [kg/m]
%m=rho*(b*h - (0.97*b)*(0.97*h));   %  massa por unidade de comprimento [kg/m]

I=b*h^3/12;    % momento de inércia
%I = (b*h^3 - (0.97*b*(0.97*h)^3))/12 ;
dx=0.001; % discretização do espaço                                                       
x= 0:dx:L; % vetor do espaço discretizado
d=x/L ; % vetor de espaço admensional
phi=[];

distancia_saida = 20e-3; %posição na viga do acelerômetro
distancia_excitacao = numero_na_fila_medicao*(70e-3) + distancia_saida; %posição na viga da excitação
pos_vetor_excitacao = ceil(distancia_excitacao/dx);
pos_vetor_saida = ceil(distancia_saida/dx);
%% Cálculo da forma dos modos

wn = zeros(1,nmod);
fn = zeros(1,nmod);
for i=1:nmod
    fn(i)= (lambda(i)^2/(2*pi*L^2))*sqrt(E*I/m);   % frequencia natural
    wn(i) = (lambda(i)^2/(L^2))*sqrt(E*I/m);  % Frequência natural angular
    for j=1:length(d)
        phi(j,i)=cosh(lambda(i)*d(j)) + cos(lambda(i)*d(j))...
        -sigma(i)*(sinh(lambda(i)*d(j))+sin(lambda(i)*d(j))); % forma do modo  
    end
    phin(:,i)=phi(:,i)/max(abs(phi(:,i)));  % normalização unitária
end

phi0=zeros(size(phi(:,1)));  % vetor do modo zero
figure
plot(d,phi0,'k',d,phin,'LineWidth',3.0)
title('Frequencias e Modos da Viga free-free - Solução Analitica', 'FontSize', 24)
xlabel('Comprimento adimensional (x/L)', 'FontSize', 24)
ylabel('Amplitude', 'FontSize', 24)
labels = cell(1, nmod+1);  % +1 porque a primeira frequência é 0 Hz

labels{1} = 'f_0 = 0 Hz';
for k = 1:nmod
    labels{k+1} = ['f_' num2str(k) ' = ' num2str(fn(k)) ' Hz'];
end

lgd = legend(labels,'Location','southwest');
%lgd.FontSize=16;
grid

%% Cálculo da massa modal

m_modal = zeros(1,nmod);
size_x = length(x);
for i=1:nmod
    for j=1:size_x
        m_modal(i) = m_modal(i) + phi(j,i)^2*dx;
    end
     m_modal(i) = m_modal(i)*m;
end




%% Cálculo da FRF

df = 2.5;
f = 0:df:4997.5;
size_frf = length(f);
frf_viga = zeros(1,size_frf);
frf_viga2 = zeros(1,size_frf);
w= 2*pi*f;  % vetor de frequencias em radianos

for p=1:size_frf
    for j=1:nmod
        numerador = phi(pos_vetor_saida,j)*phi(pos_vetor_excitacao,j);
        denominador = m_modal(j)*((fn(j))^2 - (f(p))^2 + 1i*2*f(p)*fn(j)*xi);
        %denominador2 = m_modal(j)*(wn(j)^2 - w(p)^2 + 1i*2*w(p)*wn(j)*xi)/(4*(pi^2)); % frf em hertz
        %frf_viga2(p) = frf_viga2(p) + numerador/denominador2;
        frf_viga(p) = frf_viga(p) + numerador/denominador;
    end
end


figure;
plot(f(1:1600),db(9.81/4.44822*abs(frf_viga(1:1600))));
xlabel("f (hertz)");
ylabel("H(f) em db(g/lbf)");
title("FRF");




