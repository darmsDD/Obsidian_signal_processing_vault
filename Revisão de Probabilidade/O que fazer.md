
## O que é probabilidade



## O que são conjuntos

Um conjunto é uma coleção de itens no qual a ordem não importa.
Exemplo: {a,b} e {b,a} são o mesmo conjunto.

Um conjunto pode ser definido matematicamente como:
$$
\begin{align}
A &= \{x| x\text{ satisfies some property\}} \\
& or \\
A &= \{x: x\text{ satisfies some property\}} \\
\end{align}
$$
| e : são "such that", em português, tal que.


$\in$: símbolo de pertence. Um elemento pertence ou não a um conjunto.
Exemplo: A = {1 , 2 , 3, 4}, 6 $\notin$ A (6 não pertence ao conjunto A) e 2 $\in$ A (2 pertence ao conjunto A).

$\subset$: símbolo de contido. Um conjunto pode estar ou não contido em outro conjunto.
Seja A = {1,2,3} e B={1,2,3,4,5}, dizemos que $A \subset B$ (A está contido no superconjunto B) ou $B \supset A$ (O superconjunto B contém o conjunto A).
$A \not\subset B$ A não está contido em B.

Um superconjunto é um conjunto que contém um ou mais conjutos.


Um conjunto sem elementos $\emptyset = \{\}$ é chamada de conjunto vazio ou nulo.

$\forall A, \emptyset \subset A$, isto é, para qualquer conjunto A, o conjunto vazio $\emptyset$ estará contido nele. 


Existe um conjunto universal, que contém todos os possíveis elementos sobre o que estamos estudando. Frequentemente denominado de conjunto S. Este conjunto universal também é chamada de espaço amostral.
Exemplos: para a jogada de um dado de 6 lados, S = {1,2,3,4,5,6}, para o lance de uma moeda S = {H,T} (heads = cara, tails = coroa).






## Variável aleatória

Uma variável aleatória X é uma função que atribui no dominío dos números reais a um elemento do espaço amostral S.

$$
X:S \rightarrow R
$$

Por exemplo: Seja o seu espaço amostral S = {cara,coroa}
X(cara) = 1
X(coroa) = -1

Definimos também Rx como a faixa de todos os valores que a variável aleatória X pode assumir.

Exemplo: uma pessoa joga uma moeda 5 vezes, a nossa variável aleatória dá um valor para a quantidade de caras que apareceram na rolagem.
H = cara
T = coroa

S = {TTTTT,TTTTH,TTTHH,TTHHH,THHHH,HHHHH};
X(0) = 0
X(1) = 1
X(2) = 2
X(3) = 3
X(4) = 4
X(5) = 5

Logo Rx = {0,1,2,3,4,5}, o conjunto de todos os valores que a variável aleatória X pode assumir.




Referências:https://en.wikipedia.org/wiki/Random_variable
Referências: https://www.probabilitycourse.com/chapter3/3_1_1_random_variables.php
## Processo Aleatório or processo estocástico


Seja X uma variável aleatória, o conjunto de todas as variáveis aleatórias em um determinado tempo, $\{X(t),t \in [0,\infty)\}$ é um **processo estocástico**.

Obs: não necessariamente precisa ser no eixo do tempo, existem casos do eixo ser o espaço.


Referências: https://www.probabilitycourse.com/chapter10/10_1_0_basic_concepts.php


## Valor esperado

Devemos pensar em valor esperador esperado como a média de uma variável aleatória.
Vamos pensar nos eventos x1,x2,x3,e assim por diante. N1 é a quantidade de vezes que aconteceu o evento x1, N2 a quantidade de eventos de x2 e assim por diante.

A probabilidade de $x_k$ acontecer é aproximadamente:
$$
P_X(x_k) \approx \frac{N_k}{N}
$$
Isto é, a quantidade de vezes que o evento aconteceu dividida pela quantidade total de eventos.

$$
\begin{align}
N \cdot P_X(x_k) &\approx N_k \\
Media &= \frac{N_1 \cdot x_1 + N_2 \cdot x_2 + N_3 \cdot x_3 + ... + N_k \cdot x_k}{N} \\
\text{Manipulando Ni} \\
Media &\approx \frac{N \cdot P_X(x_1)\cdot x_1 + N \cdot P_X(x_2)\cdot x_2+ N \cdot P_X(x_3)\cdot x_3 + ... + N \cdot P_X(x_k)\cdot x_k}{N} \\
Media & = P_X(x_1)\cdot x_1 + P_X(x_2)\cdot x_2+  P_X(x_3)\cdot x_3+ ...+  P_X(x_k) \cdot x_k \\
Media &= Valor Esperado, N \to \infty
\end{align}
$$
Esta média é o valor esperado quando $N \to \infty$.

Notações para o valor esperado
$X:EX = E[X] = E(X) = \mu_X$







## o que é um momento estatístico?
Momentos estatícos são usados para caracterizar a forma e distruibuição dos dados.
Existem vários momentos estatíticos, e como foi feito no exemplo,
- 1º Momento: média
- 2º Momento: variância
- 3º Momento: assimetria
- 4º Momento: curtose

Referência: https://estatisticafacil.org/glossario/o-que-e-momento-estatistico-definicao-e-aplicacoes/



## Propriedades médias de um sinal

Basicamente, queremos saber como um sinal se comporta na média, ou seja, seu comportamento estatístico esperado. Assim, usamos momentos estatísticos para descobrir os comportamentos médios, isto é, as propriedades médias de um sinal.



## O que é ensemble average

Seja uma variável u = u1,u2,...,uN
A probabilidade de u1 acontecer é p1, de u2 é p2 e assim por diante.
A probabilidade p1 é dada por: número de vezes que u1 ocorre/número de acontecimentos totais.

$$
asemble\_average = \overline{u} = \sum_{n=0}^Np_n\cdot u_n
$$
Para uma funçao f(u)
$$
asemble\_average = \overline{f(u)} = \sum_{n=0}^Np_n\cdot f(u_n)
$$


Referência:https://www.youtube.com/watch?v=B2wc1Qv99Go&ab_channel=%C3%96zhan%C3%96zatay
## Ergodicidade


















