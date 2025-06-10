function [xi] = hilbe(xr)
% funcao transformada de Hilbert
% function [xi] = hilbert(xr)
% xr: sinal real (N potencia de 2)
% xi: transformada de Hilbert de xr
% 
im=sqrt(-1);
[M,N]=size(xr);
if M > N,
   xr=xr.';
   N=M;
end
Xr=fft(xr);
sinal=[0 ones(1,N/2-1) 0 -ones(1,N/2-1)];
Xi=-im*Xr.*sinal;
xi=real(ifft(Xi));