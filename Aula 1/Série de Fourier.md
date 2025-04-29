Um sinal periódico pode ser reescrita como a soma infinita de senos e cossenos.

### Geométrica
	$$ \begin{align}
		  x(t) &= \frac{a_0}{2} + \sum_{n=1}^{n=\infty}a_ncos(nw_ot) + b_nsin(nw_ot) \\
		  w_o &= 2\pi f, f = \frac{1}{T}, w_0 = \frac{2\pi}{T}\\
		  a_n &= \frac{2}{T}\int_{-T/2}^{T/2}x(t)cos(nw_ot)dt \\
		  b_n &= \frac{2}{T}\int_{-T/2}^{T/2}x(t)sin(nw_ot)dt\\
		  a_0 &= \frac{2}{T}\int_{-T/2}^{T/2}x(t)dt \\
		  \text{Se x(t) é uma função par:} \\
		  a_n &= \frac{4}{T}\int_{0}^{T/2}x(t)cos(nw_ot)dt \\
		  b_n &= 0 \\
		  \text{Se x(t) é uma função ímpar:} \\
		  b_n &= \frac{4}{T}\int_{0}^{T/2}x(t)sin(nw_ot)dt \\
		  a_n &= 0 \\
		\end{align}
		 	
	$$
### Exponencial 

	$$ \begin{align}
		  x(t) &= \sum_{k=-\infty}^{\infty}X_k\times e^{j2\pi kt/T} \\
		  X_k &= \frac{1}{T}\int_{-T/2}^{T/2}x(t)\times e^{-j2\pi kt/T}dt
		\end{align}
		 	
	$$


### Relacionando a trigonométrica com a exponencial

$$
	\begin{align}
	X_k &= \frac{a_n - jb_n}{2} \\
	X_{-k} &= \frac{a_n + jb_n}{2} \\
	X_0 &= \frac{a_0}{2}\\
	a_n &= X_k + X_{-k}, n \geq 0 \\
	b_n &= j(X_k - X_{-k}), n \geq 1
	\end{align}
$$