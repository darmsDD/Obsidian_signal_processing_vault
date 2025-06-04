% gera��o dos sinais de entrada e sa�da
clear all
close all
N=128*1024;
x=randn(1,N);
dt=1e-3;
t=0:dt:(N-1)*dt;

N_x_noise_cases = 3;
N_y_noise_cases = 3;
noisex_array = zeros(1,N_x_noise_cases);
noisey_array = zeros(1,N_y_noise_cases);

for i=1:N_x_noise_cases
    noisex_array(i) = (i-1)*5;
end
for i=1:N_y_noise_cases
    noisey_array(i) = (i-1)*5;
end


for i=1:N_x_noise_cases
    for j=1:N_y_noise_cases
        noisex = noisex_array(i);
        noisey = noisey_array(j);

        %====================================
        % Adding noise to entrance
        %percX=70/100;
        %wn=percX*rms(x)*randn(1,N);
        %figure;
        %plot(x);
        %noisex=input('ruido na entrada (SNR=20 dB - alto):  ');
        xo=x;
        x=x+(noisex/100)*std(x)*randn(size(x));
        %hold on;
        %plot(x);
        
        %==================================
        
        X=fft(x);
        T=N*dt;
        df=1/T;
        f=(0:N/2-1)*df;
        w=2*pi*f;
        %M*y''+C*y'+K*y=x
        M=1;K=100000;C=50;
        H=1./(K-w.^2*M+1i*w*C);
        
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
        
        %============================================
        %========Adding noise to exit ==============
        %percY=input('ruido na saida (0-100):    ');
        percY=noisey/100;
        zn=percY*rms(y)*randn(1,N);
        y=y+zn;
        %============================================
        %============================================
        
        Nb=1024;
        nb=128;
        Tb=Nb*dt;
        dfb=1/Tb;
        fb=(0:Nb/2-1)*dfb;
        wb=2*pi*fb;
        [Sxx,Syy,Sxy, Syx]=depxyper(x,y,dt,Nb);
        H1=Sxy./Sxx;
        H2=Syy./Syx;
        Coh2=abs(Sxy).^2./(Sxx.*Syy);
        figure;
        sgtitle(sprintf('X Noise = %d,Y Noise=%d/100', noisex,noisey));
        subplot(2,1,1);
        hold on
        plot(f,20*log10(abs(H)),'b','LineWidth', 1.5);
        plot(fb,20*log10(abs(H1(1:Nb/2))),'LineWidth', 1);
        plot(fb, 20*log10(abs(H2(1:Nb/2))),'LineWidth', 1)
        %plot(fb,20*log10(abs(H(1:npt/2))),'b',f,20*log10(abs(H1)),'-',f,20*log10(abs(H2)),'-')
        
        
        legend('H','H1','H2')
        subplot(2,1,2);
        plot(fb,Coh2(1:Nb/2))
        title("Coeficiente de coerência");
        ylim([0 1.2])
    end
end