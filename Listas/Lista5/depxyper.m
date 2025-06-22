function [Sxx,Syy,Sxy,Syx]=depxyper(x,y,Dt,Nb);

% Densidade Inter-Espectral de Pot\^encia via DFT
% Entrada: vetores x, y, Dt e Nb 
% Saida:   vetores Sxx, Syy e Sxy com a DEP de x e y e a DIP
% x e y vetores com sinais temporais
% Dt resolucao no tempo  ;   Df=1/nb*Dt
% Nb Numero de pontos por bloco

N=length(x);
nb=floor(N/Nb);
Df=1/(Nb*Dt);
n=(0:pi/Nb:pi*(1-1/Nb));
Han=ones(1,Nb)-cos(n).^2;

Sxx=0;
Syy=0;
Sxy=0;
for i=1:nb
  X=fft(Han.*x((i-1)*Nb+1:i*Nb))/Nb;
  Y=fft(Han.*y((i-1)*Nb+1:i*Nb))/Nb;
  Sxx=Sxx+conj(X).*X;
  Syy=Syy+conj(Y).*Y;
  Sxy=Sxy+conj(X).*Y;
end
% Media
Sxx=Sxx/nb;
Syy=Syy/nb;
Sxy=Sxy/nb;
% EU^2/Hz
Sxx=Sxx/Df;
Syy=Syy/Df;
Sxy=Sxy/Df;
% Correcao Hanning
Sxx=(8/3)*Sxx;
Syy=(8/3)*Syy;
Sxy=(8/3)*Sxy;
end

