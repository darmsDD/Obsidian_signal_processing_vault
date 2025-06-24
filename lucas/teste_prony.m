clc
clear all
close all
load('synth.mat')

dt = 1e-4;
syms f
t = (0:10000)*dt;
minha_funcao(f) = sin(2*pi*t*f);
novo_sinal = minha_funcao(10); 
[s, A] = prony_arruda(novo_sinal, dt, 1);
%s/(2*pi)
disp(abs(s/(2*pi)));
disp(real(s))
disp(imag(s)./(2*pi))