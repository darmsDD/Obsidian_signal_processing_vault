function [Sxx]=dep_ar(x,Dt,p,Df,Nptf);

% Densidade Espectral de Potência via modelo AR (Maxima Entropia)
% Entrada: vetor x, Dt, p, Df e Nptf
% Saída:   vetor Sxx com a DEP
% x = vetor com sinal temporal   
% p = ordem do modelo AR
% Dt = resolucao no tempo        
% Df = resolucao desejada em frequencia
% Nptf = 2*numero de linhas de frequencia desejadas

N=length(x);
im=sqrt(-1);
F=((1:Nptf/2)-1)*Df;

% Calculo da correlacao pela definicao: (Rxx(-t)=Rxx(t) !)
for i=1:p+1,
  Rxx(i)=0;
  for j=p+1:N,
    Rxx(i)=Rxx(i)+x(j)*x(j-i+1);
  end
end
Rxx=Rxx/(N-p-1);

% Monta e resolve eqs. de Yule-Walker:
A=toeplitz(Rxx(1:p));
b=-Rxx(2:p+1)';
a=A\b;

% Calcula ruido n e seu espectro
ii=1;
for i=p+1:N,
   n(ii)=0;
   for j=1:p
     n(ii)=n(ii)+a(j)*x(i-j);
   end
   n(ii)=x(i)+n(ii);
   ii=ii+1;
end
S2=(n*n')/length(n);
Snn=dep_per(n,Dt,Nptf);
plot(F,20*log10(Snn(1:Nptf/2)),F,20*log10(S2*Dt*ones(1,Nptf/2)));
title('Verifique whiteness do ruido residual')

fprintf('Pressione qquer tecla para prosseguir...\n')

pause

% Calcula espectro por maxima entropia
for k=1:Nptf/2,
  soma=0;
  for s=1:p,
     soma=soma+a(s)*exp(-im*2*pi*(k-1)*Df*s*Dt);
  end
  soma=soma+1;
  den=conj(soma)*soma;
  Sxx(k)=S2*Dt/den;
end

