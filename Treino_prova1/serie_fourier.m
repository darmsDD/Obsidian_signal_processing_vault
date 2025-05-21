clc; clear all; close all;


% x(t) dos coeficientes de X_k


T = 2*pi;
dt = 0.01;
t_axis = (0:dt:T);
N = length(t_axis);
tau = pi;
x = t_axis - tau; %funçao original

k_values = -N:N;
X = (1j)./(k_values);
new_x = zeros(1,N);
for i=0:N-1
    x_temp = 0;
    for k=0:length(k_values)-1
        x_temp = x_temp+ X(k+1)*exp(1j*k_values(k+1)*t_axis(i+1));
    end
    new_x(i+1) = x_temp;
end



plot(t_axis,x);
title("x(t) original e x(t) reconstruido");
hold on;
plot(t_axis, new_x, "or");

figure;
df = 1/(dt*N);
fk_axis = (-N:N)*df;
plot(fk_axis(N+1:2*N+1),abs(X(N+1:2*N+1)));




