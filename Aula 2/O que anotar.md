## Classificação dos sinais ou dados

 - Contínuos e discretos
	- determinístico (periódico, não periódico (transitório, quase-periódico)): o comportamento do sinal no futuro pode ser predito por comportamentos no passado, isto é, tem um padrão.
	- aleatório (estacionário, não estacionário): o comportamento do sinal não tem um padrão, assim, não podemos predizer seu comportamento futuro.
- Os [[Sinal]] podem ser entendidos muitas vezes como: um sinal deterministíco misturado com um ruído aleatório.


## Métodos de processamento de sinais

- Não-paramétrico (Fourier)
- Paramétrico (identificação de parâmetros)

## Modelos de geração de sinais: modelando sistemas com base nos sinais

 (siso)
		 ![[siso.png]]
-  **Modelos de sistemas lineares**
	- **Linear invariável no tempo** 
		- y(t) = x(t) convolução h(t) : reposta no tempo
		- H(f) = X(s) * Y(s) : resposta na frequência
		-  equação diferencial (parâmetros concentrados (edo), parâmetros distribuídos (edp))
		- equação de diferenças (sistema discreto)
	- **Linear variável no tempo**
		- $y(t) = \int h(t,t_1),x(t_1)dt_1$: resposta no tempo
		- Não existe equivalente simples para a resposta na frequência.
		- equação diferencial (parâmetros concentrados (edo), parâmetros distribuídos (edp))
		- equação de diferenças (sistema discreto)
	- **Não linear**

## Métodos de análise de sinais
- **Domínio do tempo**
		- Amplitude
		- Momentos estatísticos
		- Funções de covariância
- **Domínio da frequência**
		- Transformadas de Fourier
		- Espectro
 

## Energia e Potência dos Sinais

- Energia: energia de um sinal pode ser entendido como o tamanho do sinal, isto é, a área embaixo da curva do sinal. Como podem haver áreas negativas, usasse $|x(t)|^2$.
- Potência: definida como a quantidade de energia consumida por unidade de tempo.
- Potência instantânea:$|x^2(t)|$, se x complexo: $x(t)*x^*(t)$
- Sinais periódicos:
	- sinal: x(t) = x(t + nT), com n pertencendo aos inteiros.
	- potência média:$\frac{1}{T}\int_0^T|x(t)|^2dt = \frac{1}{T}\int_{-T/2}^{T/2}|x(t)|^2dt$ , como o intervalo de tempo é de 0 a T ou -T/2 a T/2, é fácil descobrir a quantidade consumida por uma unidade de tempo, isto é, basta dividir o resultado pela duração do período T.
	- energia: $\int_0^T|x(t)|^2dt$, a ideia é pegar a energia de 1 período, pois se o sinal é periódico, a energia total será infinita para um t -> $\pm \infty$.
- Sinais Transitórios
	- sinal: x(t) -> 0, t-> $\infty$
	- potência instantânea: $|x^2(t)|$
	- potência média: é 0, pois, como o sinal é não periódico, pode-se considerar um período $T = \infty$. Assim, $\frac{1}{T}\int_{-T/2}^{T/2}|x(t)|^2dt$, terá $\frac{1}{\infty}$ e isso é 0.
	- energia: $\int_{-\infty}^{\infty}|x(t)|^2$, mesma fórmula de antes, mas agora T -> $\pm \infty$ e infinito /2 é infinito.
- Sinais Aleatórios estacionários
	- A média do sinal se mantém constante ao longo do tempo.
	- potência média: $\int_{-T/2}^{T/2}|x(t)|^2$, neste caso não pense em T como o período de um sinal período, mas sim como o comprimento em tempo de uma amostra x(t). 
	- energia: para t -> $\pm \infty$, a energia será infinita, e para um intervalo ela será variável.