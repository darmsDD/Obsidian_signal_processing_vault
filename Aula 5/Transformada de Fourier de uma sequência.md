Vamos tentar reproduzir os passos feitos nos slides sem olhar


1- Relembrar as fórmulas da transformada
$$
\begin{align}
	x(t) &= \int_{-\infty}^{\infty} X(f)\times e^{j2\pi ft} df \\
	X(f) &= \int_{-\infty}^{\infty} x(t)\times e^{-j2\pi ft} dt

\end{align}
$$2- Definição da [[Sequência]]
$$x(t)|_{t=n\Delta t} = x(n\Delta t)$$
3- Aplicação da [[Transformada de fourier]]
$$X(f) = \int_{-\infty}^{\infty} x(n\Delta t) \times e^{j2\pi fn\Delta t}$$

Perceba que não faz sentido aplicar uma integral a uma função com pontos discretos, só poderíamos aplicar se fosse contínua.

4- Solução: função pente de dirac

Seja $i(t) = \sum_{n=-\infty}^{\infty} \delta(t - n\Delta t)$, a multiplicação de i(t)*x(t), nos dará o valor de x(t) nos pontos de amostragem ($n\Delta t$) e zero nos outros pontos. Porém, como a função é contínua, podemos realizar a integração.

Lembrando que $\delta(t - t_0) = 0$, para $t\ne t_0$.

Então a transformada de uma sequência fica: 
$$
\begin{align}
	\overline{X}(f) &= \int_{-\infty}^{\infty} x(t)\times i(t) \times e^{-j2\pi ft} \\
	\overline{X}(f) &= \int_{-\infty}^{\infty} x(t)\times \sum_{n=-\infty}^{\infty} \delta(t - n\Delta t) \times e^{-j2\pi fnt} \\
	\overline{X}(f) &= \sum_{n=-\infty}^{\infty} \int_{-\infty}^{\infty} x(t)\times  \delta(t - n\Delta t) \times e^{-j2\pi fnt} \\
	\overline{X}(f) &= \sum_{n=-\infty}^{\infty} x(n\Delta t)\times e^{-j2\pi fn\Delta t} \\
	
	
\end{align}
$$


**Note que a função $\overline{X(f)}$ é periódica na frequência, $\overline{X}(f) = \overline{X}(f + kfa))$.**





