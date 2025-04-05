


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
X(k) &= \sum_{n=0}^{N-1}x(n)x(n)\times e^{\frac{-j2\pi kn}{N}}, k \in \{0,1,2,...,N-1\} 

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