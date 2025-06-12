clc; clear all; close all;

f_vector = [-10:-1,1:10];
A = 1;
T = 1;
syms f

X(f) = (A*1i*(exp(1i*pi*T*f/2) - 1))/(2*pi*f);
X_0 = A*T/4;

hold on;
stem(f_vector,abs(X(f_vector)));
stem(0,X_0);
hold off;