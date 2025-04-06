Sabe-se que a transformada de fourier de um sinal discreto nos dá $\overline{X}(f)$, visto em [[Sequência]], que é uma função periódica.

Por ser uma função periódica, pode acontecer o seguinte fenômeno:

![[aliasing.png]]

Veja na figura b que o período de um sinal interferiu com o outro. Para resolver basta utilizar uma frequência de amostragem 2 vezes maior que a frequência máxima do seu sinal, isto é, a **frequência de Nyquist.**
$$
f_a > 2\times f_{max}
$$
Ou seja, a frequência máxima de um sinal é deve ser menor que metade da frequência de amostragem: $f_{max} \lt \frac{fa}{2}$ 


### Como combater o aliasing

Dificilmente um sinal terá uma largura de banda limitada o suficiente para respeitar a frequência de Nyquist, isto é, $fa > 2 \times f_{max}$.
Logo, deve-se filtrar frequências que não sigam a propriedade da frequência de Nyquist. Então, podemos aplicar um filtro passa-baixa, visto em [[Filtros]], e limitar a largura de banda.
Porém, o ponto de 3db não é o suficiente para satisfazer este critério, a resposta do filtro deve ser desprezível (pelo menos 40db abaixo da banda de passagem). Então na imagem abaixo, a frequência de corte de 100hz não seria o suficiente. Se traçarmos uma linha de -40db, chegamos a aproximadamente 800hz, então $\textcolor{red}{a \ nossa \ largura \ de \ banda \ seria \ de \ 1 \ a \ 800hz? A \ frequência \ de \ corte \ seria \ 800hz?}$.
![[filtro.png]]


![[aliasing_filtro.png]]

