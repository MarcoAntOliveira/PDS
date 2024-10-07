pkg load signal  % Carregar o pacote Signal

% Criar um sinal de exemplo com ruído
fs = 1000;  % Frequência de amostragem
t = 0:1/fs:1-1/fs;  % Vetor de tempo
x = sin(2*pi*50*t) + sin(2*pi*120*t);  % Sinal original com duas frequências
y = x + 2.5*randn(size(t));  % Sinal com ruído

% Criar um filtro passa-baixa de ordem 6 com frequência de corte de 100 Hz
fc = 100;  % Frequência de corte
[b, a] = butter(6, fc/(fs/2));  % Coeficientes do filtro Butterworth

% Aplicar o filtro ao sinal ruidoso
y_filtered = filter(b, a, y);

% Plotar os sinais
figure;
subplot(3, 1, 1);
plot(t, x);
title('Sinal Original');

subplot(3, 1, 2);
plot(t, y);
title('Sinal com Ruído');

subplot(3, 1, 3);
plot(t, y_filtered);
title('Sinal Filtrado (Passa-baixa)');

waitforbuttonpress;
