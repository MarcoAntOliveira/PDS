% 1) Certifique-se de importar os arquivos de dados fornecidos para o mesmo diretório
% em que irá salvar suas implementações. Para carregar os dados da lâmpada, utilize o
% comando:
% load lampcomp
% O período de amostragem está na variável dtcomp. Qual a taxa de amostragem em
% Hertz? Nesse caso, qual a máxima frequência que pode ser visualizada? pode fazer isso em octave

% % Carregar os dados
% load lampcomp;

% % Taxa de amostragem
% fs = 1 / dtcomp;
% fprintf('Taxa de amostragem: %.2f Hz\n', fs);

% % Frequência de Nyquist
% f_nyquist = fs / 2;
% fprintf('Frequência de Nyquist: %.2f Hz\n', f_nyquist);


% % 2)Qual o comprimento total dos sinais de tensão (vcomp) e corrente (icomp)?
% % Chamaremos esse valor de Lt.


% % Determinar o comprimento dos sinais
% Lt_vcomp = length(vcomp);
% Lt_icomp = length(icomp);

% fprintf('Comprimento do sinal de tensão (vcomp): %d\n', Lt_vcomp);
% fprintf('Comprimento do sinal de corrente (icomp): %d\n', Lt_icomp);

% % Verificar se os comprimentos são iguais
% if Lt_vcomp == Lt_icomp
%     fprintf('O comprimento total dos sinais (Lt) é: %d\n', Lt_vcomp);
% else
%     fprintf('Os sinais têm comprimentos diferentes.\n');
% end



% % 3) Plote os gráficos de tensão e corrente no domínio do tempo. Qual a duração dos sinais
% % em segundos? É possível notar alguma anomalia, por exemplo, no sinal de tensão?

% % Carregar os dados
% load lampcomp;

% % Determinar o comprimento dos sinais
% Lt = length(vcomp);

% % Calcular a duração dos sinais
% T = Lt * dtcomp;
% fprintf('Duração dos sinais em segundos: %.2f s\n', T);

% % Gerar o eixo do tempo
% t = (0:Lt-1) * dtcomp;

% % Plotar os sinais
% figure;
% subplot(2, 1, 1);
% plot(t, vcomp, 'b');
% title('Sinal de Tensão (vcomp) no Domínio do Tempo');
% xlabel('Tempo (s)');
% ylabel('Tensão (V)');
% grid on;

% subplot(2, 1, 2);
% plot(t, icomp, 'r');
% title('Sinal de Corrente (icomp) no Domínio do Tempo');
% xlabel('Tempo (s)');
% ylabel('Corrente (A)');
% grid on;
% % pause(10);
% print("3.png", "-dpng");


% 4) Agora, faça a análise espectral do sinal de tensão. Calcule a DFT usando o algoritmo
% FFT do Octave/Matlab. Supondo que o sinal a ser analisado tenha o comprimento L,
% a DFT deve ser calculada com 𝑁 ≥ 𝐿 pontos. Conforme visto na Avaliação 01, o
% algoritmo de FFT é otimizado para quando o comprimento é uma potência de 2: 𝑁 =
% 2𝑣. Primeiramente, vamos realizar a análise com L=512 pontos e utilizar a janela
% retangular N=512 pontos nesse sinal (pode usar a função Octave/Matlab denominada
% boxcar). Basta multiplicar o sinal pela função da janela.
% v1r=vcomp(1:L).*boxcar(L);
% fft(v1r,N);

% % Carregar os dados
% load lampcomp;

% % Definir os parâmetros
% L = 512; % Comprimento do sinal a ser analisado
% N = 512; % Número de pontos da FFT (potência de 2)
% fs = 1 / dtcomp; % Taxa de amostragem (Hz)

% % Selecionar os primeiros L pontos do sinal de tensão
% v1 = vcomp(1:L);

% % Criar e aplicar a janela retangular manualmente
% w = ones(L, 1); % Janela retangular
% v1r = v1 .* w; % Sinal com janela aplicada

% % Calcular a FFT
% V1 = fft(v1r, N);

% % Criar o eixo de frequência
% f = (0:N-1) * (fs / N); % Frequências correspondentes

% % Magnitude da FFT (espectro de amplitude)
% magnitude = abs(V1);

% % Plotar o espectro de amplitude
% figure;
% plot(f(1:N/2), magnitude(1:N/2)); % Exibir apenas as frequências positivas
% title('Espectro de Amplitude do Sinal de Tensão');
% xlabel('Frequência (Hz)');
% ylabel('Amplitude');
% grid on;
% % pause(10);
% print("4.png", "-dpng");

%  5) Obtendo a FFT complexa, deve-se agora plotar o gráfico de magnitude em dB com
% o eixo das abscissas em Hz. Normalize os dados para o valor máximo, ou seja, o
% valor máximo no gráfico deve ser zero e os demais devem mostrar o decaimento dB
% da magnitude. Plote o espectro em frequência unilateral ao invés do bilateral
% (pesquise a função fft, na página do Matlab são fornecidos exemplos que podem
% ajudar na implementação). Abaixo, o exemplo do gráfico que deverá ser obtido.

% Carregar os dados
load lampcomp;

% Definir os parâmetros
L = 512; % Comprimento do sinal a ser analisado
N = 512; % Número de pontos da FFT (potência de 2)
fs = 1 / dtcomp; % Taxa de amostragem (Hz)

% Selecionar os primeiros L pontos do sinal de tensão
v1 = vcomp(1:L);

% Criar e aplicar a janela retangular
w = ones(L, 1); % Janela retangular
v1r = v1 .* w; % Sinal com janela aplicada

% Calcular a FFT
V1 = fft(v1r, N);

% Magnitude da FFT (espectro de amplitude)
magnitude = abs(V1);

% Normalizar a magnitude
magnitude = magnitude / max(magnitude); % Normalização

% Converter para dB
magnitude_dB = 20 * log10(magnitude);

% Criar o eixo de frequência
f = (0:N-1) * (fs / N); % Frequências correspondentes

% Selecionar apenas o espectro unilateral (frequências positivas)
magnitude_dB_unilateral = magnitude_dB(1:N/2);
f_unilateral = f(1:N/2);

% Plotar o espectro em dB
figure;
plot(f_unilateral, magnitude_dB_unilateral);
title('Espectro de Magnitude Normalizado (dB)');
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');
grid on;
xlim([0 fs/2]); % Limitar o eixo de frequência ao Nyquist
ylim([-100 0]); % Limitar o eixo de magnitude para melhor visualização
% pause(10);
print("5.png", "-dpng");