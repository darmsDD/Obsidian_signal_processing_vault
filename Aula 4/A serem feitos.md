
## Caracterização de sistemas

Um sistema pode ser caracterizado pela sua entrada e pela sua saída.

$$y(t) = L[x(t)]$$
Sendo L a transformação da entrada na saída. Uma maneira de entendermos o L é: $y(t) = x(t) \otimes h(t)$, isto é, a convolução da entrada com a resposta impulsiva nos dará a solução forçada do sistema.


Nesta disciplina, iremos trabalhar apenas com sistemas que são LTI (Linear Time-Invariant), isto é, lineares e invariantes no tempo, e que são fisicamente realizáveis.

### Causalidade
Um sistema é dito causal se a sua saída y(t) depende apenas de entradas $x(\tau)$, com $\tau <=t$.

### Sistemas LTI (Linear Time-Invariant), sistemas lineares e invariantes no tempo:

Um sistema será linear se respeitar o princípio da superposição. Este princípio é composto por 2 propriedades: aditividade e homogeneidade.
- Aditividade: $x_1(t) + x_2(t) \rightarrow y_1(t) + y_2(t)$
- Homogeneidade: $a\times x(t) \rightarrow a\times y(t)$
Juntando estas 2 propriedades temos o princípio da superposição: 
$$
\begin{align}
ax_1(t) + bx_2(t) & \rightarrow ay_1(t) + by_2(t) \\
\text{De outra maneira} \\
L[ax_1(t) + bx_2(t)] & = ay_1(t) + by_2(t) \\
\end{align}
$$




### Caracterização pelo impulso

Uma das maneiras existentes de caracterizar um sistema é utilizando uma excitação (uma entrada) arbitrária. Uma excitação útil é o impulso $\delta(t)$. Então, dada uma entrada impulsiva, a saída do sistema será h(t) (resposta impulsiva).


#### Modelagem do sistema

Um sistema  LTI pode ser modelado por uma ==equação diferencial linear a parâmetros constantes==. Por exemplo um sistema massa-mola.

![[massa_mola.png]]


$$
\begin{align}
	\text{somatório de forças} \\
	m \cdot a &= k \cdot x(t) - F(t) \\
	m \cdot \ddot{x}(t) &= k \cdot x(t) - F(t) \\
	m \cdot \ddot{x}(t) - k \cdot x(t) & = -F(t) \\
	\text{Não gostei do sentido esquerdo ser positivo então vou alterar.} \\
	m \cdot \ddot{x}(t) &= F(t) - k \cdot x(t)\\
	m \cdot \ddot{x}(t) + k \cdot x(t) & = F(t) \\
\end{align}

$$

Para facilitar o entendimento, vou reescrever a equação em termos de y(t) e a entrada será x(t).
$m \cdot \ddot{y}(t) + k \cdot y(t) = x(t)$


A solução de uma equação diferencial por ser dada por:
$$
y(t) = y_{solucaoHomogenea}(t) + y_{solucaoForcada}(t)
$$


Esta solução forçada é dada pela convolução da entrada com a resposta impulsiva.
$$y_{solucaoForcada} = x(t) \otimes h(t) $$

Por isso, dizemos que a resposta impulsiva pode ser usada para caracterizar o sistema.

Porém a convolução pode ser uma operação de difícil resolução. Portanto, uma solução é trabalhar no domínio da frequência. Pois, sabemos que a operação de convolução no tempo é multiplicação na frequência e vice-versa.


### Fourier e Laplace

A transformada de laplace da resposta impulsiva h(t) é chamada de Função de Transferência H(s).
A transformada de Fourier da resposta impulsiva h(t) é chamada de Função de Resposta em Frequência (FRF).


A relação entre a transformada de Fourier e Laplace é dada por:
$$
 \begin{align}
	\underbrace{H(s)}_{Transformada \ de \ Laplace} &= \underbrace{H(w)}_{Transformada \ de \ Fourier}, s=jw \\
	w &= 2\pi f \\
	\underbrace{H(s)}_{Transformada \ de \ Laplace} &= \underbrace{H(f)}_{Transformada \ de \ Fourier}, s = j2\pi f
 \end{align}
$$
![[fourier_laplace.png]]

$$
\begin{align}
	Y(s) &= X(s) \cdot H(s) \\
	\frac{Y(s)}{X(s)} &= H(s) \\
	Y(f) &= X(f) \cdot H(f) \\
	\frac{Y(f)}{X(f)} &= H(f)
\end{align}
$$

A relação do espectro de energia entre entrada e saída pode ser dada por

$$|Y(f)|^2 = |X(f)|^2 \cdot |H(f)|^2 $$


### Filtros

==Qualquer sistema linear é considerado um filtro.==

Um filtro é usado para atenuar ou reduzir determinadas faixas de frequência de um sinal. Logo, um filtro trabalha com frequências.
Um filtro analógico é fisicamente realizável se h(t) = 0, para t<0. Sendo h(t) a resposta impulsiva.

Em filtros ideais, componentes de frequência maiores que a frequência de corte seriam totalmente eliminados, isto é, haveria um ponto de descontinuidade em vez de uma rampa de descida como vemos na **figura 2.7**.


Tipos de filtro: passa-baixa, passa-alta, passa-banda, rejeita-banda.

![[filtros_passaBaixa_passaAlta.png]]

![[filtros_passaBanda_rejeitaBanda.png]]


![[filtro.png]]

Usando a imagem acima como exemplo: a frequência de corte é a frequência na qual houve uma atenuação de 3 decibéis depois da aplicação do filtro. Então neste caso seria 100hz. Já a largura de banda seria o intervalo das frequências até a frequência de corte, neste caso de 1 a 100 hz.
	
			
