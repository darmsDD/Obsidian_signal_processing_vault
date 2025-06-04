
1) Sem ruído

Sem nenhum ruído, o coeficiente de coerência é praticamente 1 sempre. Veja também que os estimadores se aproximaram muito bem da função de transferência.

![[noisex_0_noisey_0_100.png]]


2) Ruído só na saída
	Parece que quanto mais eu aumento o meu ruído na saída, mais espaçado e com maior amplitude ficam os estimadores H1 e H2. Como H2 é o limite superior e H1 o limite inferior, $H1 \leq H2$, que é o que vemos nas imagens abaixo.
	
	Além disso, o coeficiente de coerência que começa em 1 também decai mais rapidamente com quantidades maiores de ruído.

![[noisex_0_noisey_5_100.png]]

![[noisex_0_noisey_10_100.png]]

3) Ruído só na entrada

Não está claro porque o ruído apenas na entrada não afeta, ou não aparenta afetar, os estimadores H1 e H2. O coeficiente de coerência também parece não ter sido afetado.


![[noisex_5_noisey_0_100.png]]
![[noisex_10_noisey_0_100.png]]
4) Ruído na entrada e na saída

A combinação de ruídos na entrada e saída afetou os estimadores H1 e H2.

O ruído de entrada, mesmo parecendo não afetar os estimadores H1 e H2, teve efeitos.
Os valores de H1 e H2 apresentam valores diferentes, para um mesmo ruído em y, mas diferentes ruídos em x.


![[noisex_5_noisey_5_100.png]]
![[noisex_5_noisey_10_100.png]]![[noisex_10_noisey_5_100.png]]![[noisex_10_noisey_10_100.png]]