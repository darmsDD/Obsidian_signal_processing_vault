
A análise em frequência é feita para entender e visualizar as componentes de frequência de um sinal complexo.



As componentes em frequência  podem ser representadas como uma soma de senos e cossenos ou como vetores girantes no plano complexo.

Isto está diretamente ligado a [[Série de Fourier]].
Podemos representar a série de 2 maneiras:
- Por soma de senos e cossenos
- Por exponencial
No caso da forma exponencial, podemos dividir a representação em 2 vetores no plano complexo ao invés de 1.
Por exemplo: a representação em 2 vetores girantes seria $e^{jwt} + e^{-jwt}$, sendo w a frequência no sentido positivo e -w no sentido negativo. Isto fica mais claro na imagem abaixo.

Exemplo para um sinal: $A* cos(2\pi ft + \phi)$, isto é, o sinal real cos deslocado por uma fase $\phi$.

No lado esquerdo vemos a representação típica (a) e do lado direito vemos a representação por uma soma de 2 vetores em direções opostas. Normalmente a representação no plano complexo usa apenas 1 vetor.


![[vetores_girantes_plano_complexo.png]] 

Veja que, por ser um sinal real, as componentes imaginárias se cancelam nos vetores girantes.


Vantagens de usar a representação em vetores girantes:
- Melhor visualização da fase.
- O conceito de frequência negativa fica mais claro de ser visualizado. Um ângulo de fase negativo, significa uma rotação no sentido contrário e assim, temos uma frequência negativa. Um ângulo de fase positivo, significa uma rotação no sentido padrão e assim, temos uma frequência positiva. Então, uma frequência negativa representa uma taxa de variação negativa do ângulo de fase e uma frequência positiva representa uma taxa de variação positiva do ângulo de fase.
- Fica mais fácil separar os componentes reais e imaginários na representação usando exponenciais.

| Ângulo de fase | Frequência |
| -------------- | ---------- |
| Positivo       | Positivo   |
| Negativo       | Negativo   |

- Operações de integração e diferenciação são mais fáceis (por estar trabalhando com exponenciais).


**Equivalência das 2 representações:**
$$
A cos \theta = \frac{A}{2}(e^{i\theta} + e^{-i\theta}), \ \theta = 2\pi f + \phi
$$