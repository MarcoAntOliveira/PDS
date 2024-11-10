pkg load signal
% Especificações do Filtro
ws = 0.4 * pi; % Borda da banda de parada
wp = 0.6 * pi; % Borda da banda passante
As = 50;       % Atenuação em dB na banda de parada
Rp = 0.004;    % Ondulação na banda passante em dB

% Cálculo da Ordem do Filtro
Delta_w = wp - ws;                % Largura de transição
M = ceil((As - 7.95) / (2.285 * Delta_w / pi)); % Ordem aproximada do filtro
if mod(M, 2) == 0
    M = M + 1; % Ajuste para ordem ímpar para simetria de fase linear
end
n = 0:M-1; % Vetor de índices para o filtro

% Filtro Ideal Passa-Alta
wc = (ws + wp) / 2; % Frequência de corte
hd = -sin(wc * (n - (M-1)/2)) ./ (pi * (n - (M-1)/2)); % Filtro passa-baixa
hd((M-1)/2 + 1) = 1 - wc / pi;                         % Correção no centro
h = (-1).^n .* hd;                                      % Conversão para passa-alta

% Aplicação da Janela Fixa (exemplo: Janela de Hamming)
w_hamming = (hamming(M))'; % Janela de Hamming
h = h .* w_hamming;        % Filtro passa-alta final no domínio do tempo

% Resposta em Frequência
[H, w] = freqz(h, 1, 1024);

% Plot da Resposta em Magnitude
figure;
% subplot(2, 1, 1);
% plot(w/pi, 20*log10(abs(H)), 'LineWidth', 1.5);
% title('Resposta em Frequência do Filtro Passa-Alta com Janela Fixa');
% xlabel('Frequência Normalizada (\times \pi rad/sample)');
% ylabel('Magnitude (dB)');
% grid on;
% axis([0 1 -100 5]);

% Mapa de Polos e Zeros
% subplot(2, 1, 2);
zplane(h, 1);
title('Mapa de Polos e Zeros do Filtro Passa-Alta');
% pause(10);
print("trab3/6.1.png", "-dpng");