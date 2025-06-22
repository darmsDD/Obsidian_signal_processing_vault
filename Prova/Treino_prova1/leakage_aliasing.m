clc; clear all; close all;

fa = 50;
N = 200;
dt = 1/fa;
df = fa/N;

t_axis = dt*(0:N-1);

fo = 35;
if (mod(fo,df) == 0)
    disp("Nao houve leakage");
else
    disp("Houve leakage");
end

if (fa/2 > fo)
    disp("Nao houve aliasing");
else
    disp("Houve aliasing");
end



signal_amplitude = 10;
x = signal_amplitude*cos(2*pi*fo*t_axis);

subplot(2,1,1);
plot(t_axis,x,'ro');
title("cos(2*pi*t)");
xlabel("t");

function X_temp = my_DFT(current_x,current_N)
    X_temp = zeros(1,current_N);

    for k=0:current_N-1
        soma_temp = 0;
        for n=0:current_N-1
            soma_temp = soma_temp + current_x(n+1)*exp(-1i*2*pi*k*n/current_N);
        end
        X_temp(k+1) = soma_temp;
    end
        X_temp = X_temp./current_N;
end

X = my_DFT(x,N);
f_axis = (0:N-1)*df;
subplot(2,1,2);
stem(f_axis(1:N/2),abs(X(1:N/2)));
title("|X(k)|");
xlabel("f");













