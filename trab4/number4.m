 pkg load signal

% Especificações do filtro
omega_p = 0.45 * pi; % Frequência de borda da banda passante
omega_s = 0.5 * pi;  % Frequência de borda da banda de parada
Rp = 0.5;            % Ondulação máxima na banda passante (dB)
As = 60;             % Atenuação mínima na banda de parada (dB)

% Frequências normalizadas (para a função butterord)
Wp = omega_p / pi; % Frequência de borda da banda passante normalizada
Ws = omega_s / pi; % Frequência de borda da banda de parada normalizada

% Determinação da ordem e frequência de corte do filtro Butterworth
[N, Wn] = buttord(Wp, Ws, Rp, As); % Ordem e frequência de corte
fprintf('Ordem do filtro Butterworth: %d\n', N);

% Projeto do filtro digital Butterworth
[b_butter, a_butter] = butter(N, Wn, 'low'); % Filtro passa-baixa

% Análise da resposta em frequência
[H_butter, omega_butter] = freqz(b_butter, a_butter, linspace(0, pi, 500)); % Frequências normalizadas
magnitude_butter_dB = 20 * log10(abs(H_butter)); % Magnitude em dB

% Determinação da atenuação mínima real na banda de parada
index_stopband = find(omega_butter / pi >= Ws, 1); % Índice da frequência de borda da banda de parada
attenuation_stopband = -magnitude_butter_dB(index_stopband); % Atenuação em dB
fprintf('Atenuação mínima na banda de parada: %.2f dB\n', attenuation_stopband);

% Resposta ao impulso
impulse_response_butter = impz(b_butter, a_butter);

% Plotagem dos resultados
figure;

% Resposta em frequência
subplot(2, 1, 1);
plot(omega_butter / pi, magnitude_butter_dB, 'LineWidth', 1.5);
xlabel('Frequência Normalizada (\omega / \pi)');
ylabel('Magnitude (dB)');
title('Resposta de Magnitude - Filtro Passa-Baixa Butterworth');
grid on;

% Resposta ao impulso
subplot(2, 1, 2);
stem(impulse_response_butter, 'filled', 'LineWidth', 1.5);
xlabel('Amostras');
ylabel('Amplitude');
title('Resposta ao Impulso - Filtro Passa-Baixa Butterworth');
grid on;
% pause(10);
print("trab4/4-a)png", "-dpng");
