- Soma parcial da série de fourier
	- Fenômeno de gibbs: overshoot nos pontos de descontinuidade em aproximadamente 10%
- Sinal de potência
	- Um sinal periódico possui energia infinita para o sinal todo, mas energia finita em um período. A potência de um sinal é a média da energia total por unidade de tempo. Sendo o sinal periódico, cada período terá a mesma potência. Exemplo: perceba que calcular a potência de 1 período ou 3 ou n, resultará em sempre a mesma potência. Ao usarmos 2 períodos ao invés de 1, sendo o sinal períodico, acharemos o dobro da potência anterior, porém dividiremos pelo dobro do tempo, retornando a potência original. Então supondo que o resultado da integral é a e N é o número de períodos, então teríamos algo como:
	- $$ \begin{align}
		P &= \frac{1}{T}\int_{-T/2}^{T/2} |x(t)|^2 dt \\
		a &= \int_{-T/2}^{T/2} |x(t)|^2 dt \\ 
		P &= \frac{1}{N\times T}\times N\times a = \frac{1}{T}\times a
 \end{align}
	$$
	Assim, chamamos este sinal de **sinal de potência**
- Energia de um sinal
	- Um sinal transitório possui energia finita dada por 
	- $$E = \int^T_0 |x(t)|^2$$
	- Sinal de energia
	- 
- Teorema de Parseval 
	- Nenhuma potência é perdida na transformação do sinal no tempo para a frequência.
	- $$\frac{1}{T}\int_{-T/2}^{T/2} |x(t)|^2 dt = \sum_{k=-\infty}^{\infty}|X_k|^2 $$
	- Nenhuma energia é perdida na transformação do sinal no tempo para a frequência.
		$$\int_{-\infty}^{\infty} |x(t)|^2 dt = \int_{-\infty}^{\infty} |X(f)|^2 df$$
- Transformada de Fourier
	- Definição: limite da série de fourier
	- Fórmulas
	- Propriedades
	- efeito do espalhamento reverso: sinal estreito no tempo se espalha na frequência, sinal espalhado no tempo se estreira na frequência.
- Função Delta de Dirac
	- Propriedades
- Pseudo transformada de fourier
- Propriedades da TF
	- mudança de escala no tempo
	- tempo reverso
	- deslocamento no tempo
	- deslocamento na frequência (modulação ou multiplicação)
	- diferenciação
- Importância da fase
- Ecos
- Convolução
	- fórmula
	- propriedades
- Janelamento
	- Não entendi muito bem o efeito do janelamento no sinal.
- Fórmula de Poisson
	- Dúvida aqui também.
- 