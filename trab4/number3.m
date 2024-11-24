pkg load signal

% Condições do filtro
Omega_p = 0.3 * pi; % Frequência de borda da banda passante
Omega_s = 0.4 * pi; % Frequência de borda da banda de parada
Rp = 0.25;          % Ondulação máxima na banda passante (dB)
As = 50;            % Atenuação mínima na banda de parada (dB)

% Conversão para frequências normalizadas no domínio digital
Wp = Omega_p / pi; % Normalizar pela frequência de Nyquist
Ws = Omega_s / pi;

% Cálculo da ordem e frequência de corte do filtro digital Chebyshev-I
[n, Wn] = cheb1ord(Wp, Ws, Rp, As); % Ordem e frequência de corte
fprintf('Ordem do filtro: %d\n', n);

% Projeto do filtro digital Chebyshev-I
[b_d, a_d] = cheby1(n, Rp, Wn, 'low');

% Análise da resposta em frequência
[H, omega] = freqz(b_d, a_d, linspace(0, pi, 500)); % Frequência normalizada
magnitude_dB = 20 * log10(abs(H)); % Magnitude em dB

% Resposta ao impulso
impulse_response = impz(b_d, a_d);

% Plotagem dos resultados
figure;

% Resposta em frequência
subplot(2, 1, 1);
plot(omega / pi, magnitude_dB, 'LineWidth', 1.5);
xlabel('Frequência Normalizada (\omega / \pi)');
ylabel('Magnitude (dB)');
title('Resposta de Magnitude - Filtro Passa-Baixa (Transformação Bilinear)');
grid on;

% Resposta ao impulso
subplot(2, 1, 2);
stem(impulse_response, 'filled', 'LineWidth', 1.5);
xlabel('Amostras');
ylabel('Amplitude');
title('Resposta ao Impulso - Filtro Passa-Baixa');
grid on;
% pause(10);
print("trab4/3-a)png", "-dpng");