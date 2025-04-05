---
tags:
  - important
---


É a caracterização de um processo físico quantitativamente.
Com isso, podemos entender o comportamento do processo e saber como ele se comportou no passado e fazer predições para o futuro.


```tikz
\begin{document}
\begin{tikzpicture}[scale=0.8]
  % Axis (thick black lines)
  \draw[->, line width=2.0pt, black] (-5,0) -- (5,0) node[right]{$x$};
  \draw[->, line width=2.0pt, black] (0,-5) -- (0,5) node[above]{$y$};

  % Grid (dark gray, thin lines)
  \draw[gray!50, line width=1pt, step=1] (-5,-5) grid (5,5);

  % Random points (red dots)
  \foreach \i in {1,...,20} {
    \pgfmathsetmacro{\rx}{0.1+4.8*rand}
    \pgfmathsetmacro{\ry}{0.1+4.8*rand}
    \fill[red] (\rx,\ry) circle (2pt);
  }
\end{tikzpicture}
\end{document}
```
 
Uma maneira simples de entender: olhando para o gráfico acima, como podemos prever o comportamento do sistema no futuro,  enquanto ==minimizamos os erros e tentamos reduzir os ruídos==. Por exemplo: será que uma reta descreveria bem esse sistema?


Uma maneira de caracterizar o processo é excitar o sistema. Como visto em análise, a resposta ao impulso pode ser usada para modelar o sistema. Relembrando que a resposta ao impulso h(t) é a saída quando a entrada é um impulso.

Relembrando
$$ y(t) = x(t) * h(t), sendo \ $ \ a \ convolução. $$

Porém convoluções são de difícil resolução, logo geralmente usamos laplace ou a transformada de fourier, pois transformamos a convolução em uma simples multiplicação.
$$
\begin{align}
Y(s) & = X(s) \times H(s) \\  
Y(f) & = X(f) \times H(f)
\end{align}
$$
H(s) é a função de transferência.
H(f) é a função de resposta em frequência (FRF)







