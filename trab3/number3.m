pkg load signal
% Especificações do Filtro
wp1 = 0.35 * pi; % Borda inferior da banda passante
wp2 = 0.55 * pi; % Borda superior da banda passante
ws1 = 0.2 * pi;  % Borda inferior da banda de parada
ws2 = 0.75 * pi; % Borda superior da banda de parada
As = 40;         % Atenuação em dB

% Cálculo da Ordem do Filtro
Delta_w = min(wp1 - ws1, ws2 - wp2); % Largura de transição
M = ceil(3.3 * pi / Delta_w);        % Ordem do filtro aproximada
if mod(M, 2) == 0
    M = M + 1; % Ajuste para ter uma ordem ímpar
end
n = 0:M-1; % Vetor de índices para o filtro

% Cálculo do Filtro Ideal Passa-Banda
wc1 = (wp1 + ws1) / 2; % Frequência de corte inferior
wc2 = (wp2 + ws2) / 2; % Frequência de corte superior
hd = (sin(wc2 * (n - (M-1)/2)) - sin(wc1 * (n - (M-1)/2))) ./ (pi * (n - (M-1)/2));
hd((M-1)/2 + 1) = (wc2 - wc1) / pi; % Corrige divisão por zero no centro

% Aplicação da Janela de Hann
w_hann = (hann(M))'; % Janela de Hann
h = hd .* w_hann;    % Filtro final no domínio do tempo

% Resposta em Frequência
[H, w] = freqz(h, 1, 1024);

% Plot da Resposta em Magnitude
figure;
% % subplot(2, 1, 1);
% plot(w/pi, 20*log10(abs(H)), 'LineWidth', 1.5);
% title('Resposta em Frequência do Filtro Passa-Banda com Janela de Hann');
% xlabel('Frequência Normalizada (\times \pi rad/sample)');
% ylabel('Magnitude (dB)');
% grid on;
% axis([0 1 -100 5]);

% % Mapa de Polos e Zeros
% subplot(2, 1, 2);
zplane(h, 1);
title('Mapa de Polos e Zeros do Filtro Passa-Banda com Janela de Hann');
xlabel('Parte Real');
ylabel('Parte Imaginária');
grid on;
% pause(10);
print("trab3/3.1.png", "-dpng");