pkg load signal
% Especificações
fs = 2; % Frequência de amostragem normalizada (fs = 1 para normalização)
wp = [0.25 0.75] * pi; % Frequências de passagem (em radianos)
ws = [0.35 0.65] * pi; % Frequências de rejeição (em radianos)
rp = 0.5; % Ripple na banda de passagem (em dB)
rs = 40; % Atenuação mínima na banda de rejeição (em dB)

% Conversão para valores normalizados (para cheby1)
wp_norm = wp / pi; % Frequências de passagem normalizadas
ws_norm = ws / pi; % Frequências de rejeição normalizadas

% Determinação da ordem do filtro
[n, wn] = cheb1ord(wp_norm, ws_norm, rp, rs);

% Projeto do filtro Chebyshev-I
[b, a] = cheby1(n, rp, wn, 'stop');

% Resposta em frequência
[H, w] = freqz(b, a, 1024);

% Gráficos
figure;
subplot(2, 1, 1);
plot(w/pi, 20*log10(abs(H)));
xlabel('Frequência Normalizada (\omega/\pi)');
ylabel('Magnitude (dB)');
title('Resposta em Magnitude (dB)');
grid on;

% Resposta ao impulso
subplot(2, 1, 2);
impz(b, a);
title('Resposta ao Impulso');
grid on;
% pause(10);
print("trab4/6png", "-dpng");