

Objetivo: reconstruir o sinal x(t) a partir do sinal amostrado x(n).

Relembrando de [[Transformada de Fourier de uma sequência]]:

$$
\begin{align}
\overline{X}(f) &= \sum^\infty_{-\infty} x(n) \times e^{-j2\pi fn\Delta t} \\
\text{Usando a série de fourier.} \\
x(n) &= \frac{1}{f_a}\int_{-f_a/2}^{f_a/2}\overline{X}(f) \times e^{j2\pi fn\Delta t}
\end{align}
$$


Sabemos que x(n) é na verdade $x(n\times \Delta t)$, isto é, x(t) com $t=n\times \Delta t$.
A inversa da [[Transformada de fourier]] de x(t) é:

$$
\begin{align}
x(t) &= \int^{\infty}_{-\infty}X(f)\times e^{j2\pi ft} \\
\text{Com t} &= n\times \Delta t \\
x(n) &= \int^{\infty}_{-\infty}X(f)\times e^{j2\pi fn\times \Delta t} \\
\text{Lembrando que }x(n) &= x(n\times \Delta t) \\
\end{align}
$$


Igualando os 2 x(n)
$$
\begin{align}
x(n) = \int^{\infty}_{-\infty}X(f)\times e^{j2\pi fn\times \Delta t} = \frac{1}{f_a}\int_{-f_a/2}^{f_a/2}\overline{X}(f) \times e^{j2\pi fn\Delta t} \\
\text{Substituindo } x(n) = x(n \times \Delta n) \text{ por x(t).} \\
x(t) = \int^{\infty}_{-\infty}X(f)\times e^{j2\pi ft} = \frac{1}{f_a}\int_{-f_a/2}^{f_a/2}\overline{X}(f) \times e^{j2\pi ft} \\
x(t) = \frac{1}{f_a}\int_{-f_a/2}^{f_a/2}\sum^\infty_{-\infty} x(n) \times e^{-j2\pi fn\Delta t}\times e^{j2\pi ft} \\
x(t) = \sum^\infty_{-\infty}x(n)\int_{-f_a/2}^{f_a/2} \frac{1}{f_a} \times e^{(j2\pi f)(t - n\Delta t)}\\
x(t) = \sum^\infty_{-\infty}x(n)\frac{sin[\pi f_a(t-n\Delta t)]}{\pi f_a(t-n\Delta t)}\\

\end{align}
$$

**Sin(x)/x é a função sinc e representa a transformada de fourier inversa de um filtro passa-baixas ideal (função porta)**. Porém, existem 2 problemas:
1- Não é possível implementar filtros passa baixas ideais.
2- Funções sinc infinitas não podem ser implementadas.
Logo, só podemos aproximas o valor de x(t).


