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
fprintf("Ordem do filtro (Transformação Bilinear): %d\n", n);

% 2. Projeto do filtro analógico Butterworth
[z, p, k] = butter(n, Wn, 's'); % Protótipo analógico em polos e zeros
[b_a, a_a] = zp2tf(z, p, k);    % Conversão para coeficientes do numerador e denominador

% Verificação dos coeficientes
disp("Coeficientes do filtro analógico:");
disp("Numerador: "), disp(b_a);
disp("Denominador: "), disp(a_a);

% 3. Conversão para filtro digital usando Transformação Bilinear
[b_d, a_d] = bilinear(b_a, a_a, Fs);

% Resposta ao impulso do filtro digital
[H_digital_bilinear, omega_digital] = freqz(b_d, a_d, linspace(0, pi, 500));

% Conversão para escala dB
eps = 1e-10; % Evitar logaritmo de zero
magnitude_digital_bilinear = 20 * log10(max(abs(H_digital_bilinear), eps));

% Plotando a resposta em frequência do filtro digital
figure;
plot(omega_digital/pi, magnitude_digital_bilinear, 'b--', 'LineWidth', 1.5);
xlabel('Frequência Normalizada (\omega / \pi)');
ylabel('Magnitude (dB)');
title('Resposta de Magnitude - Filtro Digital (Transformação Bilinear)');
grid on;
% pause(10);
print("trab4/1-b)png", "-dpng");
