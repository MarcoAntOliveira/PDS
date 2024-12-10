% Carregar os dados
load lampcomp;

% Definir os parâmetros
L = 512; % Comprimento do sinal a ser analisado
N = 512; % Número de pontos da FFT (potência de 2)
fs = 1 / dtcomp; % Taxa de amostragem (Hz)

% Selecionar os primeiros L pontos do sinal de tensão
v1 = vcomp(1:L);

% Aplicar a janela retangular
w_rect = ones(L, 1); % Janela retangular
v1r = v1 .* w_rect; % Sinal com janela retangular
V1r = fft(v1r, N); % FFT com janela retangular
V1r = V1r(1:N/2); % Espectro unilateral
magnitude_rect = abs(V1r); % Magnitude
magnitude_rect_dB = 20 * log10(magnitude_rect / max(magnitude_rect)); % Normalizado em dB

% Aplicar a janela de Hanning
w_hann = hanning(L); % Janela de Hanning
v1h = v1 .* w_hann; % Sinal com janela de Hanning
V1h = fft(v1h, N); % FFT com janela de Hanning
V1h = V1h(1:N/2); % Espectro unilateral
magnitude_hann = abs(V1h); % Magnitude
magnitude_hann_dB = 20 * log10(magnitude_hann / max(magnitude_hann)); % Normalizado em dB

% Criar o eixo de frequência unilateral
f = (0:N/2-1) * (fs / N); % Frequências correspondentes (somente positivas)

% Plotar os espectros
figure;
plot(f, magnitude_rect_dB, 'r', 'DisplayName', 'Janela Retangular');
hold on
plot(f, magnitude_hann_dB, 'b', 'DisplayName', 'Janela de Hanning');
hold off;
title('Comparação do Espectro com Janelas Retangular e Hanning');
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');
legend('show');
grid on;
% pause(10);
print("8.png", "-dpng");