
### Sem Ruído

Sem nenhum ruído, o coeficiente de coerência é praticamente 1 sempre. Veja também que os estimadores se aproximaram muito bem da função de transferência.

![[noisex_0_noisey_0_100.png]]


 

### Ruído só na saída

Quanto mais eu aumento o meu ruído na saída, mais espaçado e com maior amplitude ficam os estimadores H1 e H2.  Além disso, é possível ver claramente que H2 foi muito mais afetado por este ruído.

H2 é o limite superior e H1 o limite inferior. Então, H1 deve ser sempre menor ou igual a H2, isto é, $H1 \leq H2$. Este comportamento pode ser observado nas imagens abaixo.
	
Além disso, o coeficiente de coerência que começa em 1 também decai rapidamente com quantidades maiores de ruído.

![[noisex_0_noisey_5_100.png]]

![[noisex_0_noisey_10_100.png]]


###  Ruído só na entrada

Não está claro porque o ruído apenas na entrada não afeta, ou aparenta  não afetar, os estimadores H1 e H2. O coeficiente de coerência também parece não ter sido afetado.


![[noisex_5_noisey_0_100.png]]
![[noisex_10_noisey_0_100.png]]


### Ruído na entrada e na saída

A combinação de ruídos na entrada e saída afetou os estimadores H1 e H2.

O ruído de entrada, mesmo parecendo não afetar os estimadores H1 e H2, teve efeitos.
Os valores de H1 e H2 apresentam valores diferentes, para um mesmo ruído em y, mas diferentes ruídos em x.


![[noisex_5_noisey_5_100.png]]
![[noisex_5_noisey_10_100.png]]![[noisex_10_noisey_5_100.png]]![[noisex_10_noisey_10_100.png]]