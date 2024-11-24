pkg load signal

% Definição dos parâmetros
Rp = 0.5;         % Ripple na banda passante (dB)
As = 50;          % Atenuação na banda de parada (dB)
Omega_p = 0.4 * pi; % Frequência de corte na banda passante (rad/s)
Omega_s = 0.6 * pi; % Frequência de corte na banda de parada (rad/s)
Fs = 2;           % Frequência de amostragem normalizada (1 corresponde a pi rad/s)

% Frequências normalizadas (análise contínua)
Wp = Omega_p / pi; % Banda passante normalizada (0 a 1)
Ws = Omega_s / pi; % Banda de parada normalizada (0 a 1)

% 1. Cálculo da ordem do filtro e frequência de corte (protótipo analógico)
[n, Wn] = buttord(Wp, Ws, Rp, As); % Ordem e frequência de corte
fprintf("Ordem do filtro: %d\n", n);

% 2. Projeto do filtro analógico Butterworth
[z, p, k] = butter(n, Wn, 's'); % Protótipo analógico em polos e zeros
[b_a, a_a] = zp2tf(z, p, k);    % Conversão para coeficientes do numerador e denominador

% 3. Conversão para filtro digital usando Transformação Bilinear
[b_d, a_d] = bilinear(b_a, a_a, Fs);

% 4. Análise de magnitude logarítmica (em dB)
% Frequências para análise (em rad/s) para o filtro analógico
omega_analog = logspace(-1, log10(2*pi), 500);  % Frequências contínuas positivas

% Resposta em frequência do filtro analógico
H_analog = freqs(b_a, a_a, omega_analog);  % Frequências contínuas (rad/s)

% Resposta em frequência do filtro digital
[H_digital, omega_digital] = freqz(b_d, a_d, linspace(0, pi, 500));  % Frequências normalizadas

% Corrigir valores para evitar log de zero ou valores negativos
eps = 1e-10;
magnitude_analog = 20 * log10(max(abs(H_analog), eps));
magnitude_digital = 20 * log10(max(abs(H_digital), eps));

% 5. Respostas ao impulso
impulse_digital = impz(b_d, a_d); % Resposta ao impulso digital

% Plotando os resultados
figure;
subplot(2, 1, 1);
semilogx(omega_analog/(2*pi), magnitude_analog, 'r', 'LineWidth', 1.5); hold on;
plot(omega_digital/pi, magnitude_digital, 'b--', 'LineWidth', 1.5);
xlabel('Frequência Normalizada (\omega / \pi)');
ylabel('Magnitude (dB)');
title('Resposta de Magnitude Logarítmica');
legend('Analógico', 'Digital');
grid on;

subplot(2, 1, 2);
stem(0:length(impulse_digital)-1, impulse_digital, 'b--', 'DisplayName', 'Digital');
xlabel('Amostras');
ylabel('Amplitude');
title('Resposta ao Impulso (Digital)');
legend;
grid on;
% pause(10);
print("trab4/1-a)png", "-dpng");