- Processemanto de sinais
- Processo físico
- Identificação de sistemas
- Identificação de sistemas com base em medidas ruidosas
- Sinal
- Frequência de rotação
- Frequência
- Frequência fundamental:
		- Seja x(t) um sinal periódico, logo x(t) possui um período T. A frequência fundamental seria 1/T, isto é o primeiro harmônico. O segundo harmônico seria 2*(1/T), o terceiro 3*(1/T), e assim por diante. Então a  enésima frequência harmônica seria n*(1/T) . Sendo n um número inteiro.
- Amplitude
- Período T
- Fase
- Série de fourier
	- Condições de diritchlet
	- Propriedades de integrais seno com cosseno $w_o = 2 \pi/T$
		-  $\int^{T/2}_{-T/2}sen(mw_ot)dt$=0, for all m
		- $\int^{T/2}_{-T/2}cos(mw_ot)dt$=0, for $m\neq0$
		-  
		 $$
			\int^{T/2}_{-T/2}sen(mw_ot)\times sen(nw_ot) dt =  
	         \begin{cases}
	         0 , \ m \neq n\\
	         T/2, \ m = n \neq 0
	         \end{cases}
			$$=, for all m
		- cosseno cosseno
		 $$
			\int^{T/2}_{-T/2}cos(mw_ot)\times cos(nw_ot) dt =  
	         \begin{cases}
	         0 , \ m \neq n\\
	         T/2, \ m = n \neq 0
	         \end{cases}
			$$
		- seno cosseno  $\int^{T/2}_{-T/2}sen(mw_ot)\times cos(nw_ot)dt$=0, for all m and n
	- trigonométrica
		- $w_o = 2\pi f$
		- $x(t) = \frac{a_0}{2} + \sum_{n=1}^{\infty}a_ncos(nw_ot)+ b_nsin(nw_ot), \ n={1,2,3,...}$
		- $a_n = \frac{2}{T}\times \int_{-T/2}^{T/2}x(t)cos(nw_ot)$
		-  $b_n = \frac{2}{T}\times \int_{-T/2}^{T/2}x(t)sin(nw_ot) , \ n={1,2,3,...}$
		- $a_0 = \frac{2}{t}\int_{-T/2}^{T/2}x(t)$, valor média da função no período
	- exponencial
		- $x(t) = \sum_{k=-\infty}^{\infty} X_ke^{j2\pi kft}$
		- $X_k = \frac{1}{T}\int_{-T/2}^{T/2}x(t)e^{-j2\pi kft dt}$
		- Vantagem de usar ao invés da trigonométrica
		- Vetores girantes
	- Relacionando a exponencial com a trigonométrica
		- $X_k = \frac{a_n - jb_n}{2}$
		- $X_{-k} = \frac{a_n + jb_n}{2}$
		- $X_0 = \frac{a_0}{2}$
		- $$ \begin{align}
				X_k - X_{-k} &= \frac{a_n - jb_n - a_n -jb_n}{2} = \frac{-2jb_n}{2} = -jb_n \\
				j(X_k - X_{-k}) &= b_n
			 \end{align}
		 $$
		- $$ \begin{align}
				X_k + X_{-k} &= \frac{a_n - jb_n + a_n +jb_n}{2} = \frac{2a_n}{2} = a_n \\
			 \end{align}
		 $$
	- Espectro de frequência
		- espectro de frequência em raias
	- Conclusão
		- Um sinal periódico pode ser representado pela série de fourier. O espectro deste sinal é discreto, onde as componentes (X_k) caem em múltiplos da frequência fundamental. Para esclarecer:
			- Sabemos que k é um número inteiro, então como pode X_k cair em múltiplos da frequência fundamental?
			- Resposta: Primeiro, calcula-se os valores de X_k, com k inteiro. Este pedaço se mantém normal. Quando queremos plotar o espectro, se fizessemos isto com X_k e k, não conseguiríamos ver as frequências equivalentes. Assim, para ver os valores na frequência, basta multiplicar k pela frequência fundamental.
				![[Xk_k_vs_fk.png]]
			 Veja que os valores são iguais, mas agora sabemos a frequência equivalente em vez de um inteiro k.
		- Se um sinal periódico for real, então cada componente de frequência f_k, deve estar pareada com -f_k. Isto é, têm a mesma amplitude, mas fases opostas, cancelando a parte imaginária.