function [s,A] = prony_arruda(h,dt,n);
% Calculo de modelo de exponencias complexas pelo Metodo de Prony
% function [s,A] = myprony(h,dt);
% h = soma A*exp(s*t)
% h: sinal no tempo
% dt: intervalo de amostragem
% n:  ordem do modelo AR
% s: vetor com os expoentes complexos 
% A: vetor com coeficientes das exponenciais

[M,N]=size(h);
if M > N,
  h=h.';
  N=M;
end

%H=hankel(h(1:N-2*n),h(N-2*n:N-1));
%x=-h(2*n+1:N).';
% N�O USAR COMANDO HANKEL!!!
H=[];
for k=1:N-2*n
    H=[H;
       h(:,(k-1)+1:(k-1)+2*n)];
end

x=[];
for in=2*n+1:N
    x=[x
       -h(:,in)];
end

b=H\x;
b=[b
   1];
v=roots(flipud(b));
s=log(v)/dt;
s=s.';
V=zeros(N,length(v));
for i=1:N
    V(i,:)=v.^(i-1);
end
x=h.';
A=V\x;

