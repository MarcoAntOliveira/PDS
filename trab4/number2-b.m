pkg load signal

% Definição dos parâmetros
Fs = 8000;       % Frequência de amostragem (8 kHz)
Wp = 3200 / (Fs/2); % Frequência de corte na banda passante (normalizada)
Ws = 3800 / (Fs/2); % Frequência de corte na banda de parada (normalizada)
Rp = 0.5;         % Ondulação na banda passante (dB)
As = 45;          % Atenuação mínima na banda de parada (dB)

% Cálculo da ordem do filtro e frequência de corte
[n, Wn] = cheb1ord(Wp, Ws, Rp, As);

% 1. Projeto do filtro digital Chebyshev-I usando cheby1
[b_cheby, a_cheby] = cheby1(n, Rp, Wn, 'low');

% 2. Resposta em frequência
[H_cheby, omega_cheby] = freqz(b_cheby, a_cheby, 500); % Frequências normalizadas

% Escala em dB
magnitude_cheby = 20*log10(abs(H_cheby));

% 3. Resposta ao impulso do filtro Chebyshev-I
impulse_cheby = impz(b_cheby, a_cheby);

% Plotando os resultados da parte (b)
figure;
subplot(2, 1, 1);
plot(omega_cheby/pi, magnitude_cheby, 'g:', 'LineWidth', 1.5);
xlabel('Frequência Normalizada (\omega / \pi)');
ylabel('Magnitude (dB)');
title('Resposta de Magnitude - Filtro Chebyshev-I');
legend('Digital (cheby1)');
grid on;

subplot(2, 1, 2);
stem(impulse_cheby, 'g:', 'DisplayName', 'Digital (cheby1)');
xlabel('Amostras');
ylabel('Amplitude');
title('Resposta ao Impulso - Filtro Chebyshev-I');
legend;
grid on;

% % Garantindo a criação do diretório e salvando o gráfico
% if ~exist('trab4', 'dir')
%     mkdir('trab4');
% end
print("trab4/2-b.png", "-dpng");
% pause(10);