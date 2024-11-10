pkg load signal
% Especificações do Filtro Passa-Baixa com Janela Kaiser
wp = 0.3 * pi;  % Borda da banda passante
ws = 0.2 * pi;  % Borda da banda de parada
As = 50;        % Atenuação na banda de parada (dB)
Rp = 0.25;      % Ondulação na banda passante (dB)

% Cálculo da Largura da Transição
Delta_w = wp - ws;

% Cálculo da Ordem do Filtro
M = ceil((As - 7.95) / (2.285 * Delta_w / pi)); % Ordem aproximada
if mod(M, 2) == 0
    M = M + 1;  % Ajuste para ordem ímpar
end
n = 0:M-1;  % Vetor de índices

% Cálculo da Janela de Kaiser
beta = 0.1102 * (As - 8.7);  % Parâmetro beta da janela de Kaiser
w_kaiser = kaiser(M, beta)'; % Janela de Kaiser

% Resposta Ideal Passa-Baixa
hd = sin(wp * (n - (M-1)/2)) ./ (pi * (n - (M-1)/2));  % Resposta ideal do filtro passa-baixa
hd((M-1)/2 + 1) = wp / pi;  % Correção no centro

% Filtro Passa-Baixa Final
h = hd .* w_kaiser;  % Aplica a janela de Kaiser

% Resposta em Frequência
[H, w] = freqz(h, 1, 1024);

% Plot da Resposta em Frequência

figure;
% subplot(1, 2, 1);
% plot(w/pi, 20*log10(abs(H)), 'LineWidth', 1.5);
% title('Resposta em Frequência do Filtro Passa-Baixa com Janela Kaiser');
% xlabel('Frequência Normalizada (\times \pi rad/sample)');
% ylabel('Magnitude (dB)');
% grid on;
% axis([0 1 -100 5]);

% Mapa de Polos e Zeros
% subplot(1, 2, 2);
zplane(h, 1);
title('Mapa de Polos e Zeros do Filtro Passa-Baixa com Janela Kaiser');
% % pause(10);
print("trab3/7.1.png", "-dpng");