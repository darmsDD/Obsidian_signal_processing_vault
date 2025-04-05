
Como a transformada de uma sequência é uma função periódica, podemos aplicar a [[Série de Fourier]].

1 - Relembrando a série de Fourier:
$$
\begin{align}
X_k &= \frac{1}{T}\int_{-T/2}^{T/2}x(t)\times e^{-j2\pi kt/T} dt \\
x(t) &= \sum_{k=-\infty}^{\infty}X_k\times e^{j2\pi kt}
\end{align}
$$

2- Para a nossa série periódica $\overline{X}(f)$, calculada em [[Transformada de Fourier de uma sequência]]:
$$
\begin{align}
\overline{X}(f) &= \sum_{n=-\infty}^{\infty}x(n\times \Delta t)\times e^{-j2\pi fn \Delta t} \\
x(n\times \Delta t) &= \frac{1}{fa}\int_{-fa/2}^{fa/2}\overline{X}(f)\times e^{j2\pi nf/fa} df \\

\end{align}
$$

3- Sabemos que x(t) é a transformada inversa de X(f). Se $t = n\times \Delta t$, então a inversa da transformada:

$$
\begin{align}
x(t) &= \int_{-\infty}^{\infty} X(f)\times e^{j2\pi ft}df \\
t &= n\times\Delta t \\
x(n\times\Delta t) &= \int_{-\infty}^{\infty} X(f)\times e^{j2\pi fn\Delta t}df \\
\end{align}
$$


$x(n) = x(n \times \Delta t)$ nas anotações do slide.


4- Reescrever a inversa da transformada.

$$ 
x(n\times\Delta t) = \sum_{r=-\infty}^{\infty}\int_{(2r - 1)\times fa}^{(2r + 1)\times fa} X(f)\times e^{j2\pi fn\Delta t}df
$$

A lógica para a reescrita foi a seguinte: em vez de integrar no intervalo todo de uma vez só, isto é de $[-\infty,\infty]$,  este intervalo foi quebrado em pequenos intervalos de tamanho fa,  $-\infty \ a \ \infty$.   Exemplo:

| r   | limite superior | limite inferior | tamanho do intervalo |
| --- | --------------- | --------------- | -------------------- |
| 0   | fa/2            | -fa/2           | f_a                  |
| 1   | 3fa/2           | fa/2            | f_a                  |
| 1   | 5fa/2           | 3fa/2           | f_a                  |


5- Fazendo substituição de variáveis $\tau = f -rf_a$ e depois $\tau=f$, e fazendo um comparativo a série de fourier vista no passo 2, conseguimos chegar aos resultados abaixo.

$$
\overline{X}(f) = f_a\sum^\infty_{r=-\infty} X(f - rf_a) = \sum_{n=-\infty}^{\infty}x(n\times \Delta t)\times e^{-j2\pi fn\Delta t} \\
$$




