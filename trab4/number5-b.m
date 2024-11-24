pkg load signal

% Especificações do filtro
omega_p = 0.6 * pi; % Frequência de borda da banda passante
omega_s = 0.4 * pi; % Frequência de borda da banda de parada
Rp = 0.25;          % Ondulação máxima na banda passante (dB)
As = 60;            % Atenuação mínima na banda de parada (dB)

% Normalização das frequências para o intervalo [0, 1]
Wp = omega_p / pi; % Frequência de borda da banda passante normalizada
Ws = omega_s / pi; % Frequência de borda da banda de parada normalizada

% Determinação da ordem e frequência de corte com cheb1ord
[N, Wn] = cheb1ord(Wp, Ws, Rp, As);

% Projeto do filtro digital Chebyshev-I passa-alta
[b, a] = cheby1(N, Rp, Wn, 'high');

% Resposta em frequência
[H, omega] = freqz(b, a, 500); % Análise da resposta em 500 pontos
magnitude_dB = 20 * log10(abs(H)); % Magnitude logarítmica

% Resposta ao impulso
impulse_response = impz(b, a);

% Plotagem dos resultadoss
figure;

% Resposta em frequência
subplot(2, 1, 1);
plot(omega / pi, magnitude_dB, 'LineWidth', 1.5);
xlabel('Frequência Normalizada (\omega / \pi)');
ylabel('Magnitude (dB)');
title('Resposta de Magnitude - Filtro Passa-Alta (cheby1)');
grid on;

% Resposta ao impulso
subplot(2, 1, 2);
stem(impulse_response, 'filled', 'LineWidth', 1.5);
xlabel('Amostras');
ylabel('Amplitude');
title('Resposta ao Impulso - Filtro Passa-Alta (cheby1)');
grid on;

% Exibição da ordem do filtro
fprintf('Ordem do filtro: %d\n', N);
pause(10);
print("trab4/5-b)png", "-dpng");