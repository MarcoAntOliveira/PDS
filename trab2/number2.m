addpath("funcoes/")
[y, Fs] = audioread('trab2/train.wav');

% Criando um vetor de tempo correspondente às amostras
t = (0:length(y)-1) / Fs;

% Gerando o sinal de ruído branco gaussiano
ruido_amplitude = 0.5;  % Amplitude do ruído, você pode ajustar
ruido = ruido_amplitude * randn(size(y));  % Ruído com média 0 e variância controlada

% Adicionando o ruído ao sinal original
y_com_ruido = y + ruido;

% Plotando o áudio em função do tempo
figure;
subplot(3,1,1); 
plot(t, y);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal de Áudio Original');
grid on;

% Sinal com ruído adicionado
subplot(3,1,2); 
plot(t, y_com_ruido);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal de Áudio com Ruído');
grid on;

pause(10);
