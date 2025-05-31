clc; clear all; close all;

%Declara uma funcao
% derivada do cos(at) = -asin(at) integral = sin(at)/a
% derivada x = -2*pi*fo*sin(2*pi*fo*t) -2*pi*2*f0*sin(2*pi*2*f0*t)
% -2*pi*4*f0*sin(2*pi*4*f0*t) -2*pi*8*f0*sin(2*pi*8*f0*t)
% integral de x = sin(2*pi*fo*t)/2*pi*fo + sin(2*pi*2*f0*t)/2*pi*2*f0 
% + sin(2*pi*4*f0*t)/2*pi*4*f0 + sin(2*pi*8*f0)/2*pi*8*f0
function X_temp = my_DFT(current_N,current_dt,message)
    X_temp = zeros(1,current_N);
    fa = 1/current_dt;
    df = fa/current_N;
    f0=1; 
    t = (0:current_N-1)*current_dt;
    
    current_x = cos(2*pi*f0.*t) + cos(2*pi*2*f0.*t) + cos(2*pi*4*f0.*t) + cos(2*pi*8*f0.*t);
    x_derivative = -2*pi*f0*sin(2*pi*f0.*t) -2*pi*2*f0*sin(2*pi*2*f0*t) -2*pi*4*f0*sin(2*pi*4*f0*t) -2*pi*8*f0*sin(2*pi*8*f0*t);
    x_integral = sin(2*pi*t.*f0)./(2*pi*f0) + sin(2*pi*2*t.*f0)./(2*pi*2*f0) + sin(2*pi*4*t.*f0)./(2*pi*4*f0) + sin(2*pi*8*t.*f0)./(2*pi*8*f0);

    if (mod(f0,df) == 0)
    disp("Nao houve leakage");
    else
        disp("Houve leakage");
    end
    
    if (fa/2 > 8*f0)
        disp("Nao houve aliasing");
    else
        disp("Houve aliasing");
    end

    for k=0:current_N-1
        soma_temp = 0;
        for n=0:current_N-1
            soma_temp = soma_temp + current_x(n+1)*exp(-1i*2*pi*k*n/current_N);
        end
        X_temp(k+1) = soma_temp;
    end
        X_temp = X_temp./current_N;
        f_axis = (0:current_N-1)*df;
        figure;
        

        subplot(3,2,[1 2]);
        stem(f_axis(1:current_N/2),abs(X_temp(1:current_N/2)));
        title(message);
        xlabel("f");
        ylabel("|dft(x)|");
        subplot(3,2,3);
       
        plot(t,x_derivative);
        xlabel("t");
        ylabel("dx/dt");
        subplot(3,2,4);
        plot(t,x_integral);
        xlabel("t");
        ylabel("Sx dt");
       
        syms f
        X = (1/2)*(dirac(f - f0) + dirac(f + f0) +dirac(f - 2*f0) + dirac(f + 2*f0) + dirac(f - 4*f0) + dirac(f + 4*f0) + dirac(f - 8*f0) + dirac(f + 8*f0));
        der_F = diff(X);
        int_F = int(X);
        subplot(3,2,5);
        plot(t, vpa(subs(der_F,f,f_axis)));
        xlabel("t");
        ylabel("|dX(f)df");
         subplot(3,2,6);
        plot(t, vpa(subs(int_F,f,f_axis)));
        xlabel("t");
        ylabel("Int X(f)df");

    

       
end



% Sem erro de leakage e alising
N= 100;
dt = 0.01;
my_DFT(N,dt,"Sem erro de leakeage e aliasing");


% Com erro de leakage
N=98;
dt = 0.01;
my_DFT(N,dt, "Com erro de leakage");

% Com erro de aliasing

N=100;
dt = 1;
my_DFT(N,dt, "Com erro de aliasing");