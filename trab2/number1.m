pkg load control

% Parâmetros
f1 = 1; f2 = 2; f3 = 3;
fs = 1000; % Frequência de amostragem
T = 1.5;   % Tempo total de amostragem
N = T * fs; % Número total de amostras
t = linspace(0, T, N); % Vetor de tempo

% Funções cosseno
x1 = 3*cos(2*pi*f1*t); 
x2 = cos(2*pi*f2*t - 0.3); 
x3 = 2*cos(2*pi*f3*t + 2.4); 

% Sinal resultante
xt = x1 + x2 + x3;

% a) Sinal no domínio do tempo
figure;
% subplot(4,1,1);
% plot(t, xt);
% title('a) Sinal no domínio do tempo');
% xlabel('Tempo [s]');
% ylabel('Amplitude');
% grid on;

% b) FFT e plotagem no domínio da frequência em bins
n = 2^nextpow2(length(xt)); % Próxima potência de 2 para FFT
sinal_padded = [xt, zeros(1, n - length(xt))]; % Preenchimento com zeros

fft_result = fft(sinal_padded); % Calculando a FFT
fft_positiva = abs(fft_result(1:n/2)) * (2/N); % Magnitude (apenas metade positiva)

% % subplot(4,1,2);
% plot(0:(n/2)-1, fft_positiva); % Eixo x em bins
% title('b) FFT no domínio da frequência em bins');
% xlabel('Bins');
% ylabel('Magnitude');
% grid on;

% c) Frequência em Hz no eixo x
frequencias_positivas = (0:(n/2)-1)*(fs/n); % Convertendo para Hz

% % subplot(4,1,3);
% plot(frequencias_positivas, fft_positiva);
% title('c) FFT no domínio da frequência em Hz');
% xlabel('Frequência (Hz)');
% ylabel('Magnitude');
% grid on;

% d) Magnitude em dB da resposta em frequência
fft_dcb = mag2db(fft_positiva); % Convertendo a magnitude para dB

% % subplot(4,1,4);
plot(frequencias_positivas, fft_dcb);
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');
title('d) Magnitude em dB da Resposta em Frequência');
grid on;

% Salvar a figura
print("trab2/2.1.png", "-dpng");
% pause(10);