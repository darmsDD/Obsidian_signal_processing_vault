

```tikz
\begin{document}
	\begin{tikzpicture}[scale=1]
	\draw[->] (-3.5,0) -- (3.5,0) node[right] {$x$};
    \draw[->] (0,-1.5) -- (0,1.5) node[above] {$y$};

	\draw[domain=-3.14:3.14, smooth, variable=\x, samples=100] 
        plot ({\x}, {sin(\x r)});

    \end{tikzpicture}
\end{document}

```


Um sinal é qualquer grandeza física medida no tempo.

Basicamente, podemos entender qualquer função f que depende da variável independente tempo, f(t), como um sinal.


**Frequência**: número de vezes que um evento ocorre a cada unidade de tempo. 
-  Então: $\frac{n}{\Delta t}$
- Se dizermos que o evento é a execução completa de 1 ciclo, e lembrando que uma função demora um tempo T (período) para executar o ciclo.
- Então: $f=\frac{1}{T}$
- Em hertz: f
-  Em rotação, isto é rad/s: w
- $w = 2\pi f$


**Período**:
Seja uma função periódica definida por x(t) = x(t + n*T).
O período seria a quantidade de tempo necessária para que a função complete um ciclo.
Obviamente este conceito só funciona se a função contém ciclos, isto é $x(t) = x(t + n*T)]$ para qualquer t. Por exemplo: sin(x) é uma função periódica, mas x² não é.
Então se o período é igual a $2\pi$, a função x(t) completará um ciclo a cada T (ou seja a cada período).
	- $$T = \frac{1}{f}$$

****

**Amplitude**: a amplitude de um sinal pode ser medidade de 3 maneiras:
- zero-a-pico(X)
- pico-a-pico(2X)
- RMS: $\frac{X}{\sqrt{2}}$

**Fase**
É a posição atual de uma onda em seu ciclo em um determinado instante de tempo, medida em radianos (rad) ou graus (º).



**Tipos de sinais**