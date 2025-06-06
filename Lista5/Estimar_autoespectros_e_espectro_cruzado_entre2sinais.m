% gera��o dos sinais de entrada e sa�da
clear all
close all

%% Define x, dt e o vetor do tempo t

N=128*1024;
x=randn(1,N);
dt=1e-3;
t=0:dt:(N-1)*dt;
    

%% Calculo da fft(x), define o periodo T e o vetor de frequencia f
X=fft(x);
T=N*dt;
df=1/T;
f=(0:N/2-1)*df;

%% Calcula a funçao de resposta em frequencia H(f)
w=2*pi*f;
%M*y''+C*y'+K*y=x
M=1;K=100000;C=50;
H=1./(K-w.^2*M+1i*w*C);

%% Calcula a saida do sistema pela multiplicaçao de H(f) e X(f)

Y=H.*X(1:N/2);
% Y foi criada usando apenas as frequências positivas de X
% porém para reconstruir o sinal também precisamos da frequências negativas
% Sabemos que um |X(f)| qualquer [3 1 2 0 2 1] é uma função par.
% porém geralmente temos ela no formato [0 2 1 3 1 2], isto é,
% primeiro as frequÊncias positivas e depois negativas.
% Também sabemos da propriedade X(-f) = X*(f) {conjugado}
% Exemplo com apenas frequÊncias positivas:
% Y(f) = [0 2+i 1-i] Y*(f)(2:N/2) = [2-i 1+i] flipr(Y*(f)) = [1+i 2-i]
% Y(f) = [Y(f) 0 Y*(f)] = [0 2+i 1-i 0 1+i 2-i]
% A adição do 0 ainda não está clara para mim. Talvez nyquist.
% Fazendo fftshift (só para ver o resultado final)
% [0 1+i 2-i 0 2+i 1-i]

Y=[Y 0 fliplr(conj(Y(2:N/2)))];
y=ifft(Y);




%% Define o vetor de ruido
N_x_noise_cases = 3;
N_y_noise_cases = 3;
noise_multiplier = 5;
noisex_array = zeros(1,N_x_noise_cases);
noisey_array = zeros(1,N_y_noise_cases);

for i=1:N_x_noise_cases
    noisex_array(i) = (i-1)*noise_multiplier;
end
for i=1:N_y_noise_cases
    noisey_array(i) = (i-1)*noise_multiplier;
end

x_without_noise = x;

%% Testa o sistema com diversos ruidos
for i=1:N_x_noise_cases
    for j=1:N_y_noise_cases
        noisex = noisex_array(i);
        noisey = noisey_array(j);
        % reseta o x para antes de ser adicionado um ruido
        x = x_without_noise; %
        

        %=========Adiciona ruido a entrada===========
        %============================================
        wn=noisex*rms(x)*randn(1,N);
        x = x+wn;
        X_noise=fft(x);
        figure;
        subplot(4,1,3);
        hold on;
        plot(f,abs(X(1:N/2))/N);
        plot(f,abs(X_noise(1:N/2))/N);
        legend("X(f)","X noise(f)");
        ylabel("Amplitude",'FontWeight', 'bold');
        xlabel("f(Hz)",'FontWeight', 'bold');
        hold off;
       

        %============================================
        %============================================



        %=========Adiciona ruido a saida=============
        %============================================
        %percY=input('ruido na saida (0-100):    ');
        percY=noisey/100;
        zn=percY*rms(y)*randn(1,N);
        y=y+zn;
        Y_noise=fft(y);
        subplot(4,1,4);
        hold on;
        plot(f,abs(Y(1:N/2))/N);
        plot(f,abs(Y_noise(1:N/2))/N);
        legend("Y(f)","Y noise(f)");
        ylabel("Amplitude",'FontWeight', 'bold');
        xlabel("f(Hz)",'FontWeight', 'bold');
        hold off;
        %============================================
        %============================================
        

        Nb=1024; % numero de blocos
        nb=128;  % numero de pontos por bloco
        Tb=Nb*dt; % periodo do bloco
        dfb=1/Tb; % delta f do bloco
        fb=(0:Nb/2-1)*dfb; % vetor de frequencias fb
         
        %% Calculo das densidades espectrais de potencia
        [Sxx,Syy,Sxy]=depxyper(x,y,dt,Nb);
        H1=Sxy./Sxx;
        H2=Syy./conj(Sxy);
        
        %% Calculo da funcao de transferencia Hb
        wb=2*pi*fb;
        Hb=1./(K-wb.^2*M+1i*wb*C);
        
        %% Calculo da funçao de coerencia ordinaria
        Coh2=abs(Sxy).^2./(Sxx.*Syy);

        %% Plot dos graficos Hb vs H1 vs H2 e coerencia ordinaria
        sgtitle(sprintf('X Noise = %d,Y Noise=%d/100', noisex,noisey),'FontWeight', 'bold');
        subplot(4,1,1);
        hold on
        plot(fb,20*log10(abs(Hb(1:Nb/2))),'b','LineWidth', 1.5);
        plot(fb,20*log10(abs(H1(1:Nb/2))),'LineWidth', 1);
        plot(fb, 20*log10(abs(H2(1:Nb/2))),'LineWidth', 1)
        ylabel("Amplitude",'FontWeight', 'bold');
        xlabel("f(hz)",'FontWeight', 'bold');
        legend('Hb','H1','H2','Location', 'southwest');
        
        subplot(4,1,2);
        plot(fb,Coh2(1:Nb/2))
        title("Coeficiente de coerência",'FontWeight', 'bold');
        ylabel("\gamma^2_{xy}(f)",'FontWeight', 'bold');
        xlabel("f(hz)",'FontWeight', 'bold');
        ylim([0 1.2])

    end
end