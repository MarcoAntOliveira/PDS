addpath("funcoes/")
[y, Fs] = audioread('trab2/train.wav');

% Criando um vetor de tempo correspondente às amostras
t = (0:length(y)-1) / Fs;
f1 = 1;
x1 = 3*cos(2*pi*f1*t); 
y1 = y + x1;

% Plotando o áudio em função do tempo
figure;
title('Sinal de Áudio');
subplot(2,1,1); 
plot(t, y);
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;


subplot(2,1,2); 
plot(t, y1);
xlabel('Tempo (s)');
ylabel('Amplitude com ruido');
grid on;
pause(10);