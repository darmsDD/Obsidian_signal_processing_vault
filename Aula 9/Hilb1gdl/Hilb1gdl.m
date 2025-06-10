% Gera resposta de sistema mecanico de 1 GDL
clear all
close all
N=input('Entre No. de pontos na frequencia:  ');
dt=.01;
df=1/(2*N*dt); % No de pontos e dobrado para evitar circularidade

% Definicao do sistema
im=sqrt(-1);
k=10000;
m=50;
c=input('amortecimento (25):  ');
freq=((1:N+1)-1)*df;
w=2*pi*freq;
H=1./(k*ones(1,N+1)-m*w.^2+im*c*w);
 s=sin(0:pi/10:pi).^8;
 f=[s zeros(1,2*N-length(s))];
 F=fft(f);
 X=H.*F(1:N+1);
 X(N+1)=real(X(N+1));
 H(N+1)=real(H(N+1));
 H=[H conj(fliplr(H(2:N)))]; 
 X=[X conj(fliplr(X(2:N)))]; 
 xr=real(ifft(X));
  t=(1:length(xr))*dt;
 plot(t,xr)

%  % sinal analítico
 xi=hilbe(xr);
 figure
 plot3(t,xr,xi)
 figure
 plot(t,log10(abs(xr+im*xi)))
 % verificação de causalidade
 HRe=real(H);
 HIm=imag(H);
 HReh=hilbe(HIm);
 HImh=-hilbe(HRe);
 figure
 plot(freq,HRe(1:N+1),freq,HReh(1:N+1),'+')
 legend('HRe','Hilb')
 figure
 plot(freq,HIm(1:N+1),freq,HImh(1:N+1),'+')
 legend('HIm','Hilb')
 