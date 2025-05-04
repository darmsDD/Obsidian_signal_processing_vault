### Algoritmos de cálculo da fft

#### Decimação no tempo


#### Decimação na frequência

Não entendi poha nenhuma de como funciona. Tentar olhar amanhã com calma.

#### Economia de memória

Não me pareceu um algorítmo em si, porém ele comenta sobre 2 fatores.
A dft de um sinal real x(t), tem |X(k)| par e $\angle X(k)$, ímpar.
Os outros algoritmos não se aproveitam deste fato.
Logo, já que a função é par, calcula-se apenas os primeiros N/2 termos, isto é, de 0 a N/2. Os outros N/2 termos serão iguais e não precisam ser calculados.

Sabemos que o espectro, obtido pela FFT, é periódico.

$$
\begin{align}
\overline{X}_{k + nN} &= X_k; k=0,...,N-1 \\
\overline{X}_{N-k} &= \overline{X}_k^*\\
Re\{X_{k+N/2}\} &= Re\{X_{N/2 - k}\}   \\
Im\{X_{k+N/2}\} &= -Im\{X_{N/2 - k}\}   \\
\end{align}

$$






### Zoom da fft

O objetivo é aumentar a resolução em frequência mantendo N constante.

$$
\Delta f = \frac{1}{N\cdot \Delta t} = \frac{fa}{N}
$$
Então, precisamos aumentar o tamanho de $\Delta t$, para reduzir o tamanho de $\Delta f$.

Essa técnica possui 2 nomes: **Zoom da fft** e **análise em banda estreita com memória restrita**.



Etapas do algoritmo.

**Calculo da fft sem zoom**

1- Define a frequência de amostragem: fa
2- Define o número de amostrar:N
3- $\Delta t = \frac{1}{fa}$
4- $\Delta f = \frac{fa}{N} = \frac{1}{N \cdot \Delta t}$
4- Crie o eixo do tempo. $t = (0:\Delta t:(N-1)*\Delta t)$ ou $t = (0:N-1)*\Delta t$
5- Crie o seu sinal x(t) baseado no seu eixo de tempo. Por exemplo: 
$$
x = cos(2\pi f_0t) 
$$
6- Calcule a fft. 
$$
fftX = fft(x*hanning(N))/N
$$
A janela hanning é para reduzir o leakage.
7- Crie o eixo da frequência: $fValues = (0:N-1)*\Delta f$

8- Plote o gráfico

	   plot(fValues(0:N/2),abs(fftX(0:N/2)));
	   title('Espectro Original')



**Calculo da fft com zoom**


1- Repita as 3 primeiras etapas do cálculo da fft sem zoom, ou seja, defina fa,N e Delta t.

2- Escolha o fator de zoom Z. Exemplo: Z = 100.

3- Escolha a frequência de shift fshift. Se originalmente o espectro começava em 0, agora começará em fshift. Exemplo: fshift=995.

4- Defina um novo número de amostras baseado no número de amostras anterior.
	Nz = Z* N;

5- Defina o eixo do tempo: $tz = (0:Nz-1)*\Delta t$

6- Defina o seu sinal: $xReamostrado = cos(2*\pi*f_0*t_z)$

7 - Aplique um filtro passa-baixa:
    Fazendo as contas mais em baixo, sabemos que o professor usou uma frequência de corte de 10hz. Então começando em 995Hz, o corte começará em 1005Hz.
	$$
	 \begin{align}
		[a,b] &= butter(6,1/(2*z), low) \\
		xFiltrado &= filter(b,a,x);
	\end{align}
	$$
		Explicação dos parâmetros da função butter.
		1- Quanto maior mais brupta a transição de antes do filtro para depois.
		n = 6
![[butter_1.png]]
		n = 30
		![[butter_2.png]]

	    2- Frequencia normalizada.
		    Frequencia de nyquist (Fn) = fa/2 
			  Frequencia de corte (Fc) = Fn/(2*Z), Z determinado no zoom
			Frequencia normalizada (Fnor) = Fc/Fn
			 No exemplo do professor Z = 100 e fa = 4000.
			 Fn = 2000
			 Fc = 2000/200 = 10
			  Fnor = 10/2000 = 1/200 = 1/(2*100) = 0.5/100 = 0.5/z

			A frequência de corte é determinada por você, então caso queria usar a função, basta passar fc/(fa/2). Isto é, a frequência de corte dividida pela frequência de amostragem dividida por 2 (Nyquist). No exemplo do professor foi usado como frequência de corte Fn/(2*Z).
	
		3 - Tipo de filtro. Low significa passa-baixa. 


8- Determine a frequência de reamostragem: $faz = fa/z$

9 - Determine a nova resolução em frequência: $\Delta fz = \Delta f/Z$ 

10- Para usar a função x com o número de amostras N, fazemos:
$$
xN = xReamostrado(1:Z:Nz)
$$
O número de amostras original era N, e nós usamos Nz (N*Z). Ou seja, tínhamos muito mais amostras que o original. Porém a ideia do algoritmo é usar a mesma quantidade de amostras.
Então se pegamos valores de xReamostrado de 1 a Nz pulando de Z em Z, temos xN.
Então Xn tem N valores.

11- Aplicação da fft
$$
fftXn = fft(xN *hanning(N))/N
$$

12- Crie o eixo das frequências: $fzValues = fshift + (0:N-1)*\Delta fz$ 

Você está criando a mesma quantidade de amostras 0 a N-1, ou seja, N amostras.
Porém com dfz menor, aumentando a resolução.
Por fim, é necessário adicionar fshift para o gráfico ficar coerente, pois fizemos um shift de frequencia anteriormente.

Então, fzValues é um array com N valores começando em fshift, sendo a diferença de um valor para o próximo dfz.






13 - Plot da figura

	plot(dfz, abs(fftXn))
	title('Espectro com Zoom')



