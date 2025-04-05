- **Definição de uma sequência**
	- Uma sequência ou sinal digital pode ser entendida como uma função definida apenas em um conjunto de pontos discretos. Exemplo: suponhamos que tenhamos o nosso sinal x(t), sendo x(t) uma função contínua e $t \in \mathbb{R}$ . Se $t = n\Delta t$, isso quer dizer que temos agora um conjunto de pontos discretos. Aplicar esse conjunto discreto a nossa função, isto é $x(n\Delta t)$, cria a nossa sequência. Se $\Delta t = 1$, então temos x(1), x(2), x(3), ... e assim por diante.
-  **Frequência de amostragem**: $\frac{1}{\Delta t}$
- **Trem de impulsos**:$$\sum_{n=-\infty}^{\infty}\delta(t - n\Delta t)$$

```tikz
\begin{document}
\begin{tikzpicture}[>=stealth]

    % Axes
    \draw[->] (-3.5,0) -- (3.5,0) node[below] {$t$};
    \draw[->] (0,0) -- (0,2.5) node[left] {$\sum_{n=-\infty}^{\infty}\delta(t - n\Delta t)$};
    
    \foreach \x in {-3,-2,-1,1,2,3} {
        \draw (\x,0) node[below] {$\x\Delta t$};
        \draw[very thick,->] (\x,0) -- (\x,1.5);
    }
    \draw (0,0) -- (0,0) node[below] {$0$};
    \draw[very thick,->] (0,0) -- (0,1.5);
 
    % Label for Delta t
    \draw[<->] (0,2) -- (1,2) node[midway,above] {$\Delta t$};
    
\end{tikzpicture}
\end{document}
```
