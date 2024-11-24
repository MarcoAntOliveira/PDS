pkg load signal

% Especificações do filtro
Omega_p = 0.3 * pi; % Frequência de borda da banda passante
Omega_s = 0.4 * pi; % Frequência de borda da banda de parada
Rp = 0.25;          % Ondulação máxima na banda passante (dB)
As = 50;            % Atenuação mínima na banda de parada (dB)

% Normalização das frequências
Wp = Omega_p / pi; % Frequência de borda da banda passante normalizada
Ws = Omega_s / pi; % Frequência de borda da banda de parada normalizada

% Cálculo da ordem e frequência de corte do filtro digital elíptico
[n, Wn] = ellipord(Wp, Ws, Rp, As); % Ordem e frequência de corte
fprintf('Ordem do filtro (ellip): %d\n', n);

% Projeto do filtro digital elíptico
[b_ellip, a_ellip] = ellip(n, Rp, As, Wn, 'low');

% Análise da resposta em frequência
[H_ellip, omega_ellip] = freqz(b_ellip, a_ellip, linspace(0, pi, 500)); % Frequência normalizada
magnitude_ellip_dB = 20 * log10(abs(H_ellip)); % Magnitude em dB

% Resposta ao impulso
impulse_response_ellip = impz(b_ellip, a_ellip);

% Plotagem dos resultados
figure;

% Resposta em frequência
subplot(2, 1, 1);
plot(omega_ellip / pi, magnitude_ellip_dB, 'LineWidth', 1.5);
xlabel('Frequência Normalizada (\omega / \pi)');
ylabel('Magnitude (dB)');
title('Resposta de Magnitude - Filtro Passa-Baixa Elíptico');
grid on;

% Resposta ao impulso
subplot(2, 1, 2);
stem(impulse_response_ellip, 'filled', 'LineWidth', 1.5);
xlabel('Amostras');
ylabel('Amplitude');
title('Resposta ao Impulso - Filtro Passa-Baixa Elíptico');
grid on;
% pause(10);
print("trab4/3-b)png", "-dpng");