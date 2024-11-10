
pkg load signal
% Especificações do Filtro
ws1 = 0.3 * pi; % Borda inferior da banda de parada
ws2 = 0.6 * pi; % Borda superior da banda de parada
wp1 = 0.4 * pi; % Borda inferior da banda passante
wp2 = 0.5 * pi; % Borda superior da banda passante
As = 50;        % Atenuação em dB

% Cálculo da Ordem do Filtro
Delta_w = min(wp1 - ws1, ws2 - wp2); % Largura de transição
M = ceil(3.3 * pi / Delta_w);        % Ordem do filtro aproximada
if mod(M, 2) == 0
    M = M + 1; % Ajuste para ter uma ordem ímpar
end
n = 0:M-1; % Vetor de índices para o filtro

% Cálculo do Filtro Ideal Passa-Faixa
wc1 = (ws1 + wp1) / 2; % Frequência de corte inferior
wc2 = (wp2 + ws2) / 2; % Frequência de corte superior
hd = (sin(wc2 * (n - (M-1)/2)) - sin(wc1 * (n - (M-1)/2))) ./ (pi * (n - (M-1)/2));
hd((M-1)/2 + 1) = (wc2 - wc1) / pi; % Corrige divisão por zero no centro

% Aplicação da Janela de Hamming
w_hamming = (hamming(M))'; % Janela de Hamming
h = hd .* w_hamming;       % Filtro final no domínio do tempo

% Resposta em Frequência
[H, w] = freqz(h, 1, 1024);

% Plot da Resposta em Magnitude
figure;
% subplot(1, 2, 1);
% plot(w/pi, 20*log10(abs(H)), 'LineWidth', 1.5);
% title('Resposta em Frequência do Filtro Passa-Faixa com Janela de Hamming');
% xlabel('Frequência Normalizada (\times \pi rad/sample)');
% ylabel('Magnitude (dB)');
% grid on;
% axis([0 1 -100 5]);

% % Mapa de Polos e Zeros
% subplot(1, 2, 2);
zplane(h, 1);
title('Mapa de Polos e Zeros do Filtro Passa-Faixa');
% % pause(10);
print("trab3/5.1.png", "-dpng");