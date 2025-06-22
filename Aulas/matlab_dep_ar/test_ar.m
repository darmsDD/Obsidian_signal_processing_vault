% Teste de dep_ar.m e dep_per.m
% Nb: tamanho do bloco
% nb: No. de blocos

N=input('No. de total de amostras (8192):  ');
nb=input('No. de blocos (32):  ');
Dt=0.01;
t=((1:N)-1)*Dt;
Nb=N/nb;
Df=1/(Nb*Dt);
im=sqrt(-1);

xw=randn(1,N);

% Colorindo o ruido:
k=10000;
m=1;
c=50;
X=fft(xw)/N;
w = ((1:N/2)-1)*2*pi/(N*Dt);
H=ones(size(w))./(k*ones(size(w))-m*w.^2+im*w*c);
H=[H 0 fliplr(conj(H(2:N/2)))];

X=H.*X;
x=N*real(ifft(X));

% Plot do sinal a ser analisado:
figure
subplot(211),plot(t,xw)
title('white noise')
subplot(212),plot(t,x)
title('colored noise')

p=input(' Ordem do modelo AR (5): ');

Sxxa=dep_ar(x,Dt,p,Df,Nb);
Sxxp=dep_per(x,Dt,Nb);
f=((1:(Nb/2))-1)*Df;
figure
plot(f,20*log10(Sxxa),f,20*log10(Sxxp(1:Nb/2)),w/(2*pi),20*log10(abs(H(1:N/2)).^2*mean(xw.^2)*Dt))
title(' DEP via modelo AR e via TFD')
legend('DEP-AR','DEP-PER','EXACT')

