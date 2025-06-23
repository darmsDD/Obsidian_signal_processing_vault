clc
clear all
close all
load('synth.mat')

dt = 1e-4;

[s, A] = prony_arruda(signal, dt, 1);

disp(real(s))
disp(imag(s)./(2*pi))