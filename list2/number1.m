addpath("funcoes/")


% 1-a)
% n = -20:10; % Vetor de índices
% w = linspace(-pi, pi, 100); % Frequências
% x = ((0.6).^abs(n)) .* (stepseq(-10, -20, 10) - stepseq(11, -20, 10)); % Sinal
% y = dtft(x, n, w); % Cálculo da DTFT

n = -10:10; % Vetor de índices
w = linspace(-pi, pi, 100); % Frequências
x = (n.*(0.9).^n) .* (stepseq(0, -10, 10) - stepseq(21, -10, 10));
y = dtft(x, n, w); % Cálculo da DTFT

% Plotando a magnitude da DTFT
figure; 
plot(w, abs(y)); % Plot da magnitude em função das frequências
xlabel('Frequência (rad/s)');
ylabel('Magnitude');
title('Magnitude da DTFT');

print("2.1_a).png", "-dpng");


% % Plotando a magnitude da DTFT
% figure; % Criando e selecionando explicitamente a figura 1
% plot(w, abs(y)); % Plot da magnitude em função das frequências
% xlabel('Frequência (rad/s)');
% ylabel('Magnitude');
% title('Magnitude da DTFT');
% pause(30); % Pausa de 30 segundos para visualizar o gráfico

% % Salvando a figura após a pausa
% print("hhh.png", "-dpng"); % Salvando a figura como PNG

% %1 - c)
% n = -20:10; % Vetor de índices
% w = linspace(-pi, pi, 100); % Frequências
% x = [cos(0.5 * pi * n) + j*sin (0.5*pi*n)];
% y = dtft(x, n, w); % Cálculo da DTFT

% % Plotando a magnitude da DTFT
% figure; 
% plot(w, abs(y)); % Plot da magnitude em função das frequências
% xlabel('Frequência (rad/s)');
% ylabel('Magnitude');
% title('Magnitude da DTFT');
% pause(30);
