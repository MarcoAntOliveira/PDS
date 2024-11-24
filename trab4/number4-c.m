pkg load signal

% Especificações do filtro
omega_p = 0.45 * pi; % Frequência de borda da banda passante
omega_s = 0.5 * pi;  % Frequência de borda da banda de parada
Rp = 0.5;            % Ondulação máxima na banda passante (dB)
As = 60;             % Atenuação mínima na banda de parada (dB)

% Frequências normalizadas (para a função cheb2ord)
Wp = omega_p / pi; % Frequência de borda da banda passante normalizada
Ws = omega_s / pi; % Frequência de borda da banda de parada normalizada

% Determinação da ordem e frequência de corte do filtro Chebyshev-II
[N, Wn] = cheb2ord(Wp, Ws, Rp, As); % Ordem e frequência de corte
fprintf('Ordem do filtro Chebyshev-II: %d\n', N);

% Projeto do filtro digital Chebyshev-II
[b_cheby2, a_cheby2] = cheby2(N, As, Wn, 'low'); % Filtro passa-baixa

% Análise da resposta em frequência
[H_cheby2, omega_cheby2] = freqz(b_cheby2, a_cheby2, linspace(0, pi, 500)); % Frequências normalizadas
magnitude_cheby2_dB = 20 * log10(abs(H_cheby2)); % Magnitude em dB

% Determinação da atenuação mínima real na banda de parada
index_stopband = find(omega_cheby2 / pi >= Ws, 1); % Índice da frequência de borda da banda de parada
attenuation_stopband = -magnitude_cheby2_dB(index_stopband); % Atenuação em dB
fprintf('Atenuação mínima na banda de parada: %.2f dB\n', attenuation_stopband);

% Resposta ao impulso
impulse_response_cheby2 = impz(b_cheby2, a_cheby2);

% Plotagem dos resultados
figure;

% Resposta em frequência
subplot(2, 1, 1);
plot(omega_cheby2 / pi, magnitude_cheby2_dB, 'LineWidth', 1.5);
xlabel('Frequência Normalizada (\omega / \pi)');
ylabel('Magnitude (dB)');
title('Resposta de Magnitude - Filtro Passa-Baixa Chebyshev-II');
grid on;

% Resposta ao impulso
subplot(2, 1, 2);
stem(impulse_response_cheby2, 'filled', 'LineWidth', 1.5);
xlabel('Amostras');
ylabel('Amplitude');
title('Resposta ao Impulso - Filtro Passa-Baixa Chebyshev-II');
grid on;
% pause(10);
print("trab4/4-c)png", "-dpng");