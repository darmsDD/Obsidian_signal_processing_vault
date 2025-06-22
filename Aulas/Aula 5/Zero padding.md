O zero padding é usado para melhorar a visualização da frequência do espectro. Se tivemos um números limitado de amostra N,  adicionam-se pontos em x(n)=0 para aumentar o período artificialmente e por consequência reduzir o $\Delta f$. Estamos basicamente aumentando a densidade dos pontos.


![[zero_padding.png]]
![[outro_exemplo_zero_padding.png]], esta imagem veio do vídeo https://www.youtube.com/watch?v=ukHTfD37THI&ab_channel=IllinoisDSP aos 2:20 min.

Neste mesmo vídeo ele explica que aumentar a janela de pontos do sinal original contribui melhor para a visualização. Então usando 64 pontos do cosseno ao invés de 32.

![[zero_padding3.png]]

Por fim, ele comenta que é muito importante usar potências de 2, pois acelera muito o cálculo da TFT, visto em [[Transformada de Fourier Discreta]], pois a TFT são $Nlog_2(N)$ operações.
![[zero_padding4.png]]