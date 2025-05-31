
A função escolhida para este exercício foi a soma de 4 cossenos.
$$ 
cos(2*\pi*f0.*t) + cos(2*\pi*2*f0.*t) + cos(2*\pi*4*f0.*t) + cos(2*\pi*8*f0.*t);
$$

Pois a transformada de Fourier de um $cosseno(2*pi*f0*t) = \frac{1}{2}(\delta(f - f0) + \delta(f + f0))$. Nos dando apenas 1 componente na frequência positiva e outro na negativa. Assim, para obter 4 frequências múltiplas apenas dobrei o f0 anterior. 

A transformada dessa função ficará: 
$$
X(f) = \frac{1}{2}(\delta(f - f0) + \delta(f + f0) +\delta(f - 2*f0) + \delta(f + 2*f0) + \delta(f - 4*f0) + \delta(f + 4*f0) + \delta(f - 8*f0) + \delta(f + 8*f0))
$$



![[Pasted image 20250508120915.png]]


Na primeira imagem, não há erro de leakage e nem de aliasing. Como f0 = 1, então deveríamos ver componentes de frequência em 1, 2, 4 e 8. Exatamente o que temos na imagem.
 

![[Pasted image 20250508120922.png]]


Já na segunda imagem, vemos o erro de leakage. Observe que, ao contrário da figura 1, temos diversas componentes de frequência > 0. Isto acontece pois, f0 não era um múltiplo de df. Obrigando a componente de um ponto se espalhar para os mais próximos. 


![[Pasted image 20250508120930.png]]


Com o erro de aliasing, houve sobreposição, fazendo com que houvesse apenas uma componente de frequência de valor 4.

Perceba que quase não houve diferença entre as derivadas, pois não mudamos a função, apenas os pontos usados. Fazendo com que os pontos fossem vistos de mais perto ou mais longe.

O mais importante é entender porque as derivadas e integrais de X(f) deram apenas 0. Provavelmente houve erro.

## Código
```
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
```