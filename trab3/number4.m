pkg load signal
% Especificações do Filtro
ws1 = 0.4 * pi; % Borda inferior da banda de parada
ws2 = 0.6 * pi; % Borda superior da banda de parada
wp1 = 0.3 * pi; % Borda inferior da banda passante
wp2 = 0.7 * pi; % Borda superior da banda passante
As = 50;        % Atenuação em dB

% Cálculo da Ordem do Filtro
Delta_w = min(wp1 - ws1, ws2 - wp2); % Largura de transição
M = ceil(3.3 * pi / Delta_w);        % Ordem do filtro aproximada

% Garantir que M seja pelo menos 11 e ímpar
if M < 11
    M = 11;
elseif mod(M, 2) == 0
    M = M + 1; % Ajuste para ter uma ordem ímpar para fase linear
end

n = 0:M-1; % Vetor de índices para o filtro
middle = (M-1)/2;

% Cálculo do Filtro Ideal Rejeita-Faixa com Simetria
wc1 = (wp1 + ws1) / 2; % Frequência de corte inferior
wc2 = (wp2 + ws2) / 2; % Frequência de corte superior

% Construção de hd para garantir simetria
hd = zeros(1, M);
for i = 1:M
    % A simetria deve ser mantida ao redor do centro
    n = i - middle - 1;
    if n == 0
        hd(i) = 1 - (wc2 - wc1) / pi; % Valor central sem divisão por zero
    else
        hd(i) = (sin(pi * n) - (sin(wc2 * n) - sin(wc1 * n))) / (pi * n);
    end
end

% Garantir simetria de hd
hd = hd - mean(hd); % Ajustar o filtro para garantir simetria em torno de 0

% Aplicação da Janela de Hamming
w_hamming = (hamming(M))'; % Janela de Hamming
h = hd .* w_hamming;       % Filtro final no domínio do tempo

% % Verificação de Fase Linear (Simetria)
% if ~isequal(h, flip(h))
%     error('A resposta ao impulso h(n) não é de fase linear!');
% end

% Resposta em Frequência
[H, w] = freqz(h, 1, 1024);

% Plot da Resposta em Magnitude
figure;
% % subplot(2, 1, 1);
% plot(w/pi, 20*log10(abs(H)), 'LineWidth', 1.5);
% title('Resposta em Frequência do Filtro Rejeita-Faixa com Janela de Hamming');
% xlabel('Frequência Normalizada (\times \pi rad/sample)');
% ylabel('Magnitude (dB)');
% grid on;
% axis([0 1 -100 5]);

% % Mapa de Polos e Zeros
% subplot(2, 1, 2);
zplane(h, 1);
title('Mapa de Polos e Zeros do Filtro Rejeita-Faixa');
% pause(10);
print("trab3/4.1.png", "-dpng");
