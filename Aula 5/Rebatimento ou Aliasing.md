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

### Teorema de Shannon - Reconstrução

Objetivo: reconstruir o sinal x(t) a partir do sinal amostrado x(n).

Relembrando de [[Transformada de Fourier de uma sequência]]:

$$
\begin{align}
\overline{X}(f) &= \sum^\infty_{-\infty} x(n) \times e^{-j2\pi fn\Delta t} \\
\text{Usando a série de fourier.} \\
x(n) &= \frac{1}{f_a}\int_{-f_a/2}^{f_a/2}\overline{X}(f) \times e^{j2\pi fn\Delta t}
\end{align}
$$


Sabemos que x(n) é na verdade $x(n\times \Delta t)$, isto é, x(t) com $t=n\times \Delta t$.
A inversa da [[Transformada de fourier]] de x(t) é:

$$
\begin{align}
x(t) &= \int^{\infty}_{-\infty}X(f)\times e^{j2\pi ft} \\
\text{Com t} &= n\times \Delta t \\
x(n) &= \int^{\infty}_{-\infty}X(f)\times e^{j2\pi fn\times \Delta t} \\
\text{Lembrando que }x(n) &= x(n\times \Delta t) \\
\end{align}
$$


Igualando os 2 x(n)
$$
\begin{align}
x(n) = \int^{\infty}_{-\infty}X(f)\times e^{j2\pi fn\times \Delta t} = \frac{1}{f_a}\int_{-f_a/2}^{f_a/2}\overline{X}(f) \times e^{j2\pi fn\Delta t} \\
\text{Substituindo } x(n) = x(n \times \Delta n) \text{ por x(t).} \\
x(t) = \int^{\infty}_{-\infty}X(f)\times e^{j2\pi ft} = \frac{1}{f_a}\int_{-f_a/2}^{f_a/2}\overline{X}(f) \times e^{j2\pi ft} \\
x(t) = \frac{1}{f_a}\int_{-f_a/2}^{f_a/2}\sum^\infty_{-\infty} x(n) \times e^{-j2\pi fn\Delta t}\times e^{j2\pi ft} \\
x(t) = \sum^\infty_{-\infty}x(n)\int_{-f_a/2}^{f_a/2} \frac{1}{f_a} \times e^{(j2\pi f)(t - n\Delta t)}\\
x(t) = \sum^\infty_{-\infty}x(n)\frac{sin[\pi f_a(t-n\Delta t)]}{\pi f_a(t-n\Delta t)}\\

\end{align}
$$

**Sin(x)/x é a função sinc e representa a transformada de fourier inversa de um filtro passa-baixas ideal (função porta)**. Porém, existem 2 problemas:
1- Não é possível implementar filtros passa baixas ideais.
2- Funções sinc infinitas não podem ser implementadas.
Logo, só podemos aproximas o valor de x(t).


