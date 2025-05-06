

Leakage: quando um sinal no domínio da frequência X(f) não consegue ser representado no seu ponto correto, fazendo com que X(f) será espalhado para frequências próximas, como X(f+1).

Exemplo: um cosseno de 250 hz ($cos (2\pi*250*t)$)com frequência de amostragem de 1000hz.
Se estivermos trabalhando com hertz. 
Porém se estivermos trabalhando com w, um cos de 250hz seria cos(250t), pois cos(wt) é um cos de frequência angular w.

Usando 4 amostras, N=4;
Com N=4, não há leakage.
![[leakage_2.png]]

Com N=5 há leakage.


![[leakage.png]]



