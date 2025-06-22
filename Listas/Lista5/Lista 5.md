
## Sem ruído


Para o caso sem ruído, acontece o esperado, no qual H1 e H2 são imperceptíveis de Hb e a coerência ordinária é praticamente unitária.
Além disso, não é possível notar a presença do ruído no espectro da frequência.


![[noisex_0_noisey_0_100.png]]

## Ruído só na entrada

Percebe-se que a coerência ordinária caiu bruscamente ao adicionar ruído na entrada, chegando próximo a zero. Esse comportamento pode ser devido a alta presença do ruído no espectro da frequência (X noise). Além disso, conseguimos observar H2 e H1 como os limites superiores e inferiores da função de reposta em frequência Hb. Com H2 sendo um estimador melhor no início.


![[noisex_5_noisey_0_100.png]]
![[noisex_10_noisey_0_100.png]]



## Ruído só na saída

A coerência ordinária se manteve mais próxima de 1 no início e caiu mais rapidamente de acordo com a quantide de ruído inserido. Neste caso, H1 foi um estimador melhor. Perceba que a presença do ruído não é muito notada no espectro da frequência.


![[noisex_0_noisey_5_100.png]] 
![[noisex_0_noisey_10_100.png]]





## Ruído na entrada e na saída


Com a adição de ruído na entrada e na saída, a coerência ordinária despencou, se aproximando cada vez mais de 0, conforme cresce os ruídos.

Perceba que parecido com o caso de ruído apenas na entrada, H2 foi um melhor estimador no inicío. Além disso, como visto antes, fica claro pelas imagens os comportamentos como limites superior (H2) e inferior (H1).


![[noisex_5_noisey_5_100.png]]

![[noisex_5_noisey_10_100.png]]


![[noisex_10_noisey_5_100.png]]


![[noisex_10_noisey_10_100.png]]


## Observação final

Não consegui demonstrar, mas pelo comportamento ruídoso da entrada X não se propagar para a saída Y, supõe-se que a função de resposta em frequência H(f) está atuando como um filtro.