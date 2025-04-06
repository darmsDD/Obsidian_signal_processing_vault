


1- Define a tranformada de uma sequência de 0 a N-1 em vez de -inf a +inf

2- $\overline{X}(f)$ é contínua e queremos uma função discreta
Então $\overline{X}(f) = X(k)$, com $f = \frac{k \times f_a}{N}$  

3- Substitui na fórmula

$$
\begin{align}
\overline{X}(f) &= \sum^\infty_{n=-\infty}x(n)\times e^{-j2\pi fn\Delta t} \\
\text{Acredito que a mudança dos limites} & \text{ de n, torne a equação abaixo em uma aproximação de} \overline{X}(f)\\
\overline{X}(f) &= \sum_{n=0}^{N-1}x(n)\times e^{-j2\pi fn\Delta t} \\
\overline{X}(f) &= X(k), \ com \ f = \frac{k \times f_a}{N}  \\
X(k) &= \sum_{n=0}^{N-1}x(n)\times e^{\frac{-j2\pi k\times f_a n\Delta t}{N}} \\


\Delta t &= \frac{1}{f_a} \\
X(k) &= \sum_{n=0}^{N-1}x(n)\times e^{\frac{-j2\pi kn}{N}}, k \in \{0,1,2,...,N-1\} 

\end{align}
$$

## Inversa da Transformada de Fourier discreta

$$
x(n) = \frac{1}{N}\sum^{N-1}_{k=0}X(k)\times e^{j2\pi kn/N}, \ k \in \{0,1,2,...,N-1\} 
$$

Fazendo a substituição: $e^{-j2\pi/N} = w_N$ e outras operações
$$
\begin{align}

X_r &= \frac{1}{N}\sum_{n=0}^{N-1}x(n)\times w^{-nr}_N, r \in \{0,1,2,...,N-1\} \\
x_n &= \sum_{r=0}^{N-1}X(r)\times w^{nr}_N, n \in \{0,1,2,...,N-1\} 

\end{align}
$$




## Propriedades da DFT (Discrete fourier transformation) | TFD( Transformada Discreta de Fourier)


Linearidade:

$TFD [ ax(n) + by(n) ]  =  aX(k) + bY(k)$ 


Shifting:

$TFD[x(n+m)] = e^{j2\pi m/N}\times X(k)$


Simetria:
Seja x(n) um sinal real, então $X(k) = X_r(k) + jX_i(k)$, isto é X(k) pode ser decomposto em sua parte real e imaginária.

$$
\begin{align}
X_r(N-k) &= X_r(k) \\
X_i(N-k) &= -X_i(k) \\
X(N-k) &= X_r(k) - jX_i(k) = X(k)^* \\ \\

|X(N-k)| &= |X(k)| \\
  \\
Arg(X(N-k))& = -Arg(X(k))

\end{align}
$$

X(N-k) é decomposto em uma parte real e uma parte imaginária imaginária em X(k) isto é,
$X(N-k) = X_r(k) - jX_i(k)$ , então o cálcula da fase e módulo ficam.
$$
\begin{align}
|X(N-k)| &= |X(k)| \\
Arg(X(N-k))& = -Arg(X(k))\\
\end{align}
$$



## Comparação rudimentar com a FFT

Relembrando que:
$$
X_r = \sum_{n=0}^{N-1}x_n\times w^{-nr}_N
$$

A complexidade assintótica desse algoritmo é aproximadamente N², pois na realidade são $N\times r$ operações, porém para a FFT a complexidade é de $Nlog_2N$.

Com 1024 pontos:
$DFT = 1024*1024 = 2^{10} \times 2^{10} = 2^{20} = 1.048.576 \ operações$
$FFT = 1024\times log_2 1024 = 10240 \ operações$
$\frac{1.048.576}{10240} = 102.4 \text{ vezes mais lento a DFT}$



## Gráfico com o comportamento dos sinais

(a) x(t): sinal original e contínuo
(b) x(n): amostragem de x(t)
(c) $\overline{x}(t)$: reconstrução do sinal usando $\overline{X}(f)$, [[Teorema de Shannon (Reconstrução do sinal)]]
(d) $\overline{x}(n)$: amostragem de $\overline{x}(t)$

![[Transformada de diferentes sinais.png]]