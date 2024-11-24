pkg load signal

% Parâmetros do filtro
Fs = 8000;       % Frequência de amostragem (8 kHz)
Wp = 3200 / (Fs/2); % Frequência de corte na banda passante (normalizada)
Ws = 3800 / (Fs/2); % Frequência de corte na banda de parada (normalizada)
Rp = 0.5;         % Ondulação na banda passante (dB)
As = 45;          % Atenuação mínima na banda de parada (dB)

% 1. Cálculo da ordem e frequência de corte
[n, Wn] = cheb1ord(Wp, Ws, Rp, As);

% 2. Projeto do filtro Chebyshev-I digital
[b_d, a_d] = cheby1(n, Rp, Wn, 'low');

% 3. Resposta em frequência
[H_digital, omega_digital] = freqz(b_d, a_d, 500);

% Escala em dB
magnitude_digital = 20*log10(abs(H_digital));

% 4. Resposta ao impulso
impulse_digital = impz(b_d, a_d);

% 5. Plotagem
figure;
subplot(2, 1, 1);
plot(omega_digital / pi, magnitude_digital, 'b', 'LineWidth', 1.5);
xlabel('Frequência Normalizada (\omega / \pi)');
ylabel('Magnitude (dB)');
title('Resposta de Magnitude Logarítmica');
grid on;

subplot(2, 1, 2);
stem(impulse_digital, 'b');
xlabel('Amostras');
ylabel('Amplitude');
title('Resposta ao Impulso');
grid on;

% % Salvando a figura
% if ~exist('trab4', 'dir')
%     mkdir('trab4');
% end
print("trab4/2-a.png", "-dpng");
% pause(10);