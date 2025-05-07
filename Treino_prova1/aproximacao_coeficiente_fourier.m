clc; clear all; close all;

N = 1000;

%coeficientes fourier aproximado

X_approx = zeros(1,N);
A = 3;
T  = 7;
for k=0:N-1
    soma_temp = 0;
    for n=0:N-1
        soma_temp = soma_temp + n*exp(-1i*2*pi*k*n/N);
    end
    X_approx(k+1) = (soma_temp*A);
end

X_approx = X_approx./N^2;
k_values = [-N/2:N/2-1];
X_approx = fftshift(X_approx);

stem(k_values,abs(X_approx));
hold on;

%coeficientes fourier analitico

k_values2 = [-N/2:-1,1:N/2-1];
X= (A*1j)./(2*pi.*k_values2);
X0 = A/2;
stem(k_values2,abs(X),'r');
stem(0,X0,'r');