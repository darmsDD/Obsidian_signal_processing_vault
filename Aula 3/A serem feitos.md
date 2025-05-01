### **Soma parcial da série de fourier**

 Fenômeno de gibbs: overshoot nos pontos de descontinuidade em aproximadamente 10%
### **Sinal de potência**: é um sinal que tem potência finita e energia infinita.

Um sinal periódico possui energia infinita para o sinal todo, mas energia finita em um período. A potência de um sinal é a média da energia total por unidade de tempo. Sendo o sinal periódico, cada período terá a mesma potência. Exemplo: perceba que calcular a potência de 1 período ou 3 ou n, resultará em sempre a mesma potência. Ao usarmos 2 períodos ao invés de 1, sendo o sinal períodico, acharemos o dobro da potência anterior, porém dividiremos pelo dobro do tempo, retornando a potência original. Então supondo que o resultado da integral é a e N é o número de períodos, então teríamos algo como:
 $$ \begin{align}
		P &= \frac{1}{T}\int_{-T/2}^{T/2} |x(t)|^2 dt \\
		a &= \int_{-T/2}^{T/2} |x(t)|^2 dt \\ 
		P &= \frac{1}{N\times T}\times N\times a = \frac{1}{T}\times a
 \end{align}
	$$
	
	Assim, chamamos este sinal de **sinal de potência**


### **Energia de um sinal**


 Sinal de energia: um sinal que possui energia limitada e potência igual a 0.
	- Um sinal transitório possui energia finita dada por 
	 $$E = \int^T_0 |x(t)|^2$$
	 Com $T \to \infty$. Porém com T tendendo ao infinito a potência $P = \frac{1}{T}\int_T^0|x(t)|^2$  fica igual a zero, pois a energia é limitada e 1/T se tornará 0.



### **Teorema de Parseval** 

 Nenhuma potência é perdida na transformação do sinal no tempo para a frequência.
 $$\frac{1}{T}\int_{-T/2}^{T/2} |x(t)|^2 dt = \sum_{k=-\infty}^{\infty}|X_k|^2 $$
 Nenhuma energia é perdida na transformação do sinal no tempo para a frequência.
		$$\int_{-\infty}^{\infty} |x(t)|^2 dt = \int_{-\infty}^{\infty} |X(f)|^2 df$$


### **Transformada de Fourier**

 Usada para converter um sinal no tempo para a frequência (depois veremos que podemos usar em sinais periódicos também).
- Definição: limite da série de fourier 
- Fórmulas: 
	$$
	\begin{align}
	x(t) &= \int_{-\infty}^{\infty}X(f)\times e^{j2\pi ft}df \\
	X(f) &= \int_{-\infty}^{\infty}x(t) \times e^{-j2\pi ft}dt 
	\end{align}
	$$

- Efeito do espalhamento reverso: sinal estreito no tempo se espalha na frequência, sinal espalhado no tempo se estreira na frequência.
#### **Propriedades da TF**
	
- $X(f) = X_R(f) + iX_I(f)$, se x(t) for real, $X_R(f)$ é par e $X_I(f)$ é ímpar.
- $X(f) = |X(f)|\times e^{i\theta(f)}$, $|X(f)|$ é par e $\theta(f)$ é ímpar.
- mudança de escala no tempo: 
	$$\mathcal{F}[x(at)] = \frac{1}{|a|}X(f/a)$$
- tempo reverso: se x(t) é real, $x^*(t) = x(t)$, propriedade da simetria do conjugado.
			$$\mathcal{F}[x(-t)] = X(-f) = X^*(f)$$
		, sendo $X^*$ o conjugado. Lembrando que X é um número complexo.

- deslocamento no tempo se x(t) é real:
	 $$\mathcal{F}[x(t- t_0)] = e^{-j2\pi ft_0}\times X(f)$$

- deslocamento na frequência (modulação ou multiplicação):
	 $$\mathcal{F}^{-1}[X(f - f_0)] = e^{j2\pi f_0t}\times x(t)$$

- diferenciação: se $x(t) \to \pm \infty = 0$, então:
		$$
		 \mathcal{F}[\dot{x}(t)] = j2\pi f\times X(f)
		$$


### **Função Delta de Dirac**

- Definição: 
	$$\delta(t) = \begin{cases}
		\infty, t = 0 \\
		0, t \neq 0
	\end{cases}$$
- Propriedades:
	- $\delta(t - t_0) = 0, t_0 \neq t$
	- $\int_a^b\delta(t)dt = 1, a < t < b$
	- $\int_a^b\delta(t-t_0)x(t)= x(t_0), a < t_0 < b$
	- $\delta(at) = \frac{\delta(t)}{|a|}, a \neq 0$


### **Pseudo transformada de fourier**:
		
Motraremos que podemos calcular a transformada de fourier para sinais periódicos também.
	  1. Aplicando a transformada de fourier a um sinal periódico
	     $$
			  \begin{align}
			  x(t) & = \int_{-\infty}^{\infty}\delta(f-f_0)e^{j2\pi ft} df= e^{j2\pi f_0t} \\
			  \text{Logo } X(f) &= \delta(f-f_0) \text{ para } x(t) = e^{j2\pi f_0t}  \\ \\
			  X(f) &= \int_{-\infty}^{\infty}x(t)\times e^{-j2\pi ft}dt\\
			  \text{Aplicando a série de fourier} \\
			  X(f) &= \int_{-\infty}^{\infty}[\sum_{k=-\infty}^{\infty}X_k \times e^{j2\pi kt/T}] \times e^{-j2\pi ft}dt\\
			  f_k &= \frac{k}{T} \\
			  X(f) &= \sum_{k=-\infty}^{\infty}X_k \underbrace{\int_{-\infty}^{\infty}e^{j2 \pi f_kt}\times e^{-j2\pi ft}dt}_{Transformada \ de \ Fourier} \\
			  \text{Perceba agora, que }&  \text{podemos aplicar a propriedade que encontramos no ínicio.} \\
			  X(f) &=  \sum_{k=-\infty}^{\infty}X_k\times \delta(f - fk)
			  \end{align}
	       $$
	Ou seja X(f) para um sinal periódico é um trem de impulsos em $f = f_k, f_k = k/T$.


### **Importância da fase:**

Um número infinito de sinais pode ter, no espectro, a mesma magnitude |X(f)| porém fases diferentes. Para a reconstrução correta do sinal é necessário a fase a magnitude.

Um sinal simétrico (função par), possui fase igual a 0. 
O deslocamento puro do sinal no tempo, $\mathcal{F}[x(t- t_o)] = e^{j2\pi ft_0}\times X(f)$. Relembrando que um número complexo pode ser escrito como: $r\times e^{j\theta}$, sendo r o módulo e $\theta$ a fase. Logo, para $e^{j2\pi ft_0}\times X(f)$, $r = |X(f)|$ e $\angle X(f) = 2\pi f t_0$.  Então a mudança de fase é linear.

A inclinação da curva de fase é o atraso, $\frac{d\phi}{df} = -2\pi t_0$ ou $\frac{d\phi}{d\omega} = -t_0$ . $\frac{d\phi}{d\omega} = -t_0$  é conhecido como atraso de grupo do sinal. Por estarmos lidando com atraso puro, não há dispersão e assim o atraso é igual para todas as frequências. 

Se a curva de fase for não linear $\frac{d\phi}{d\omega}$ será uma função não linear de $\omega$ e a forma do sinal será alterada.

![[importancia_fase.png]]

### **Ecos**
![[eco.png]]

Como mostrado na foto, o eco é a chega de 2 fontes de som vindas da mesma origem. Neste caso conseguimos ver que x(t) é o som em linha reta e $ax(t-t_0)$ é o som do eco. A letra 'a' é a amplitude do eco, e $x(t-t_0)$ representa o atraso de $t_0$ do som.

Fazendo a transformada de fourier de y(t):
$Y(f) = (1 + e^{-j2\pi ft_0})X(f)$

Isto quer dizer que Y(f) tem características oscilatórias tanto em espectros de fase e magnitude.

![[transformada_eco.png]]


Então, um sinal com características ondulatórias pode indicar a presença de ecos. Porém, dispersões e ecos adicionais geram características mais complexas/complicadas.


###  **Convolução**

 A convolução de 2 funções é: 
$$
x(t) * h(t) = \int_{-\infty}^{\infty}x(\tau)\times h(t-\tau)d\tau = \int_{-\infty}^{\infty}x(t - \tau)\times h(\tau)d\tau = h(t) * x(t)
$$

![[convolucao.png]]


Suas propriedades são:
- A convolução no tempo é multiplicação na frequência:
$$ x(t) * h(t) \xrightarrow{\mathcal{F}} X(f) \times H(f)$$
- A convolução na frequência é multiplicação no tempo:
$$ x(t) \times h(t) \xrightarrow{\mathcal{F}} X(f) * H(f)$$
- Comutatividade:
	 $X(f) \otimes Y(f) = Y(f) \otimes X(f)$
- Associatividade:
	 $X(f) \otimes [Y(f) + Z(f)] = X(f) \otimes Y(f) +X(f) \otimes Z(f)$
- Invariância do shift:
	 Seja $Z(f) = X(f) \otimes Y(f)$
	 $Z(f-a) = X(f-a) \otimes Y(f) = X(f) \otimes Y(f-a)$
- A função impulso é a identidade da convolução:
	 $X(f)\otimes \delta(f) = X(f)$
     $X(f) \otimes \delta(f - f_0) = X(f - f_0)$


### Janelamento

As transformadas de fourier assum um sinal de duração infinita, isto é, de mais a menos infinito. Porém, em um sinal real, temos apenas uma amostra de dados. A nossa amostra não contém x(t), com $t \to \pm \infty$ .
Assim, escolhemos uma janela na qual avaliaremos o nosso sinal (pense numa janela quadrada). Então:
$$x_{trunc}(t) = x(t) \times w(t)$$, sendo w(t) a sua função de janelamento.

Sabemos pelas propriedades anteriores da convolução que:
$$
x_{trunc}(t) = x(t) \times w(t) \xrightarrow{\mathcal{F}} X(f) *H(f)

$$

Se w(t) for uma janela retangular:
![[janelamento_retangular.png]]

$W(f) = \frac{sin(\pi fT)}{\pi f}$

$x(t) = cos(2\pi f_ot)$, sendo a sua transformada $X(f) = \frac{1}{2}(\delta(f - f_0) + \delta(f + f_0))$

![[x_janelamento.png]]


$x_{trunc}(t) = w(t) \times x(t) = cos(2\pi f_ot), T/2 < t < T/2$. Perceba que só cortou o sinal a este intervalo, nos outros pedaços seria 0.

$$
X(f)_{\text{trunc}} = W(f) \otimes X(f) = \frac{1}{2} \cdot \frac{\sin[\pi(f - f_0)T]}{\pi(f - f_0)} + \frac{1}{2} \cdot \frac{\sin[\pi(f + f_0)T]}{\pi(f + f_0)}
$$

![[janelamento3.png]]
Quando realizamos o janelamento de um sinal, haverá leakage. Veja na imagem acima, no qual H(f) deixa de ser apenas 2 impulsos após o janelamento. É possível ver vários pequenos lóbulos laterais em H(f) convolução X(f).


![[janelamento 4.png]]

Quando um sinal é composto de elementos de frequências vizinhas, neste caso 2 senóides, os lóbulos laterais das 2 senóides podem se misturar e gerar erros na leitura das amplitudes.


**Outros tipos de janelamento**

![[janelamento_5.png]]




![[janelamento6.png]]




###  **Fórmula de Poisson**
1. Escreve a função trem de impulsos. $\sum_{n=-\infty}^{\infty} \delta(t + nT)$
		 ![[poisson3.png]]
2. Calcule o coeficiente Xk da função trem de impulsos (ela é periódica)
	![[poisson4.png]]
3. Calcule o valor de x(t) com base no Xk encontrado
4. Iguale o trem de impulsos ao x(t)
	 ![[poisson5.png]]
5. Faça a transformada de fourier de x(t)
6. Fique de um lado da equação o trem de impulsos e do outro a transformada de fourier de x(t).
	 ![[poisson2.png]]
7. Convolução no tempo é multiplicação na frequência então 
![[poisson.png]]
8. Manipulando o lado esquerdo
	![[poisson6.png]]
9. Fazendo a transformação inversa
	![[poisson7.png]]

Seja a função periódica: $T\times \sum_{n=-\infty}^{\infty}x(t + nT)$, então os valores discretos da transformada de fourier X(f), amostrados em $nf_0$, isto é, $X(nf_0)$ são os coeficiente da série de Fourier.

Sabemos pelos slides da aula 4, que a transformada inversa de fourier nos dá um função periódica no tempo. Logo $T\sum_{n=-\infty}^{\infty}x(t+ nT)$ é uma função periódica e podemos fazer a afirmação abaixo.

**A fórmula de poisson nos mostra que os valores discretos da transformada de fourier X(f), com = kf_0 ou f = k/T, isto é, X(kf_0), de um sinal períódico são os valores dos coeficientes da série de fourier Xk.**



![[poisson8.png]]