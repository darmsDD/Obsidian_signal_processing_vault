clc; close all; clear all;


% Plot da transformada de fourier

dt = 0.1;
fa = 1/dt;
N = 10;
df = fa/N;
f_kValues = [-N:-1, 1:N]*df;

syms f
A = 1;
T = 2;
X0 = A*T/4;
X(f) = A*1j*(exp(-1j*pi*f*T/2) - 1)/(2*pi*f);

stem(f_kValues,abs(X(f_kValues)));
hold on;
stem(0, abs(X0));


