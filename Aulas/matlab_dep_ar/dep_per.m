function [Sxx]=dep_per(x,Dt,Nb);

% Densidade Espectral de Pot\^encia via DFT (Periodograma)
% Entrada: vetor x, Dt e nb 
% Saida:   vetor Sxx com a DEP
% x vetor com sinal temporal  
% Dt resolucao no tempo        Df=1/nb*Dt
% Nb Tamanho do bloco
% nb No. de blocos

N=length(x);
nb=floor(N/Nb);
Df=1/(Nb*Dt);

Sxx=0;
for i=1:nb,
  X=fft(x((i-1)*Nb+1:i*Nb))/Nb;
  Sxx=Sxx+conj(X).*X;
end
% Media
Sxx=Sxx/nb;
% EU^2/Hz
Sxx=Sxx/Df;


