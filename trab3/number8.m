pkg load signal

% Especificações do filtro
ws1 = 0.25 * pi;  % Borda inferior da primeira banda de parada
wp1 = 0.35 * pi;  % Borda inferior da banda passante
wp2 = 0.65 * pi;  % Borda superior da banda passante
ws2 = 0.75 * pi;  % Borda superior da segunda banda de parada

As = 40;          % Atenuação mínima nas bandas de parada (dB)
Rp = 0.05;        % Ondulação máxima na banda passante (5%)

% Largura de transição
delta_w = min(wp1 - ws1, ws2 - wp2);

% Cálculo da Ordem do Filtro
M = ceil((As - 7.95) / (2.285 * (delta_w / pi)));
if mod(M, 2) == 0
    M = M + 1;  % Ajusta para ordem ímpar
end
n = 0:M-1;  % Vetor de índices

% Janela de Kaiser
beta = 0.1102 * (As - 8.7);
w_kaiser = kaiser(M, beta)';

% Frequências de corte para o filtro ideal
wc1 = (wp1 + ws1) / 2;
wc2 = (wp2 + ws2) / 2;

% Resposta em frequência ideal do filtro passa-banda
hd = (sin(wc2 * (n - (M-1)/2)) - sin(wc1 * (n - (M-1)/2))) ./ (pi * (n - (M-1)/2));
hd((M-1)/2 + 1) = (wc2 - wc1) / pi;

% Filtro final com janela de Kaiser
h = hd .* w_kaiser;

% Resposta em Frequência
[H, w] = freqz(h, 1, 1024);


figure;
% subplot(1, 2, 1);
% plot(w/pi, abs(H), 'LineWidth', 1.5);
% title('Resposta de Amplitude do Filtro Passa-Banda com Janela de Kaiser');
% xlabel('Frequência Normalizada (\times \pi rad/sample)');
% ylabel('Amplitude');
% grid on;

% subplot(1, 2, 2);
% plot(w/pi, 20*log10(abs(H)), 'LineWidth', 1.5);
% title('Resposta de Magnitude em dB');
% xlabel('Frequência Normalizada (\times \pi rad/sample)');
% ylabel('Magnitude (dB)');
% grid on;

% % Mapa de Polos e Zeros
% subplot(2, 2, 3);
zplane(h, 1);  % Mostra apenas os zeros, já que é um FIR
title('Mapa de Polos e Zeros do Filtro Passa-Banda com Janela de Kaiser');
xlabel('Parte Real');
ylabel('Parte Imaginária');
grid on;
axis([-1.5 1.5 -1.5 1.5]);  % Ajusta o limite dos eixos para uma visualização melhor
% pause(10);

print("trab3/8.1.png", "-dpng");


% pkg load signal
% % Especificações do filtro
% ws1 = 0.25 * pi;  % Borda inferior da primeira banda de parada
% wp1 = 0.35 * pi;  % Borda inferior da banda passante
% wp2 = 0.65 * pi;  % Borda superior da banda passante
% ws2 = 0.75 * pi;  % Borda superior da segunda banda de parada

% As = 40;          % Atenuação mínima nas bandas de parada (dB)
% Rp = 0.05;        % Ondulação máxima na banda passante (5%)

% % Largura de transição
% delta_w = min(wp1 - ws1, ws2 - wp2);

% % Cálculo da Ordem do Filtro
% M = ceil((As - 7.95) / (2.285 * (delta_w / pi)));
% if mod(M, 2) == 0
%     M = M + 1;  % Ajusta para ordem ímpar
% end
% n = 0:M-1;  % Vetor de índices

% % Janela de Kaiser
% beta = 0.1102 * (As - 8.7);
% w_kaiser = kaiser(M, beta)';

% % Frequências de corte para o filtro ideal
% wc1 = (wp1 + ws1) / 2;
% wc2 = (wp2 + ws2) / 2;

% % Resposta em frequência ideal do filtro passa-banda
% hd = (sin(wc2 * (n - (M-1)/2)) - sin(wc1 * (n - (M-1)/2))) ./ (pi * (n - (M-1)/2));
% hd((M-1)/2 + 1) = (wc2 - wc1) / pi;

% % Filtro final com janela de Kaiser
% h = hd .* w_kaiser;

% % Resposta em Frequência
% [H, w] = freqz(h, 1, 1024);

% % Gráfico da Resposta em Frequência

% Mapa de Polos e Zeros
% figure
% zplane(h, 1);
% title('Mapa de Polos e Zeros do Filtro Passa-Banda com Janela de Kaiser');
% title('Mapa de Polos e Zeros do Filtro Passa-Banda com Janela de Hann');
% xlabel('Parte Real');
% ylabel('Parte Imaginária');
% grid on;
% pause(10);