% Programa para teste de estimador H1 e H2
clear all
close all
clc

m=1.;
k=1000;
c=10;
fn=sqrt(k/m)/2/pi
M=m;
K=k;
C=c;

% calculo de H(f)
% H(w)=inv([K-w^2*M+iwC]);w=wmin,wmax

npt=input('No. total de pontos (pot. de 2):  ');
nptb=input('No. de pontos por bloco: ');
fmin=0;%input('fmin (0):  ');
fmax=15;%input('fmax (15):  ');
deltaf=(fmax-fmin)/(npt/2-1);
j=sqrt(-1);
fo=zeros(1,npt/2);
H=zeros(1,npt/2);

for i=1:npt/2
  fo(i)=(fmin+(i-1)*deltaf);
  w=fo(i)*2*pi;
  D=K-M*w^2+C*w*j;
  h=inv(D);
  H(i)=h;
end

H(npt/2+1)=0; 
H(npt/2+2:2*npt/2)=conj(fliplr(H(2:npt/2)));

% geracao de entrada e saida p/ calculo da frf
 
noisex=input('ruido na entrada (SNR=20 dB - alto):  ');
noisey=input('ruido na saida (SNR=20 dB - alto):    ');

x=randn(1,npt);

X=fft(x);
Y=H.*X;
y=real(ifft(Y));

xn=x+(noisex/100)*std(x)*randn(size(x));
yn=y+(noisey/100)*std(y)*randn(size(y));
%xn = awgn(x,noisex,'measured'); % adiciona ru�do branco Gaussiano
%yn = awgn(y,noisey,'measured'); % adiciona ru�do branco Gaussiano


figure;
subplot(211)
plot(1:length(x),x,'-b',1:length(x),xn,'-r')
xlabel('tempo')
ylabel('Entrada')
legend('sem ruido','com ruido')
subplot(212)
plot(1:length(y),y,'-b',1:length(y),yn,'-r')
xlabel('tempo')
ylabel('Sa�da')
legend('sem ruido','com ruido')

% Partindo em blocos e calculando os G's 

nblk=floor(npt/nptb);

Gyx=zeros(1,nptb/2);
Gxy=zeros(1,nptb/2);
Gyy=zeros(1,nptb/2);
Gxx=zeros(1,nptb/2);
H1=zeros(1,nptb/2);
H2=zeros(1,nptb/2);
han=hanning(nptb)';

for i=1:nblk
  X=fft(han.*xn((i-1)*nptb+1:i*nptb));
  Y=fft(han.*yn((i-1)*nptb+1:i*nptb));
  X=X(1:nptb/2);
  Y=Y(1:nptb/2);
  Gyx=Gyx+Y.*conj(X);
  Gxy=Gxy+X.*conj(Y);
  Gxx=Gxx+X.*conj(X);
  Gyy=Gyy+Y.*conj(Y);
end

H1=Gyx./Gxx;
H2=Gyy./Gxy;

 
% P=[py  0
%    0  px];
% for i=1:nptb/2,
%  Gaa=[Gyy(i)  Gyx(i)
%       Gxy(i)  Gxx(i)];
%  [fi,lamb]=eig(inv(P)*Gaa);
%  l=diag(abs(lamb));
%  [ll,ord]=sort(l);
%  z=fi(:,ord(1));
%  H1(i)=Gyx(i)/Gxx(i);
%  H2(i)=Gyy(i)/Gxy(i);
%  Hv(i)=conj(-z(2)/z(1));
% end;

f=zeros(1,nptb/2);
deltaf=(fmax-fmin)/(nptb/2-1);
j=sqrt(-1);
for i=1:nptb/2
  f(i)=(fmin+(i-1)*deltaf);
end

% Calcula a Coer�ncia Ordin�ria
%
gama2xy=(abs(Gxy.*conj(Gxy)))./(Gxx.*Gyy);

figure; 
plot(fo,20*log10(abs(H(1:npt/2))),'b',f,20*log10(abs(H1)),'-',f,20*log10(abs(H2)),'-')
legend('H','H1','H2')
xlabel('frequency [Hz]')
ylabel('[dB]')
figure;
plot(f,gama2xy)
xlabel('frequency [Hz]')
ylabel('Coerencia')
axis([0 f(end) 0 1.2])
