pkg load control

f1 = 1; f2 = 2; f3 = 3;
fs = 1000; % Frequência de amostragem
T = 1.5;  % Tempo total de amostragem
N = T * fs; % Número total de amostras
t = linspace(0, T, N); % Vetor de tempo

% Funções cosseno
x1 = 3*cos(2*pi*f1*t); 
x2 = cos(2*pi*f2*t - 0.3); 
x3 = 2*cos(2*pi*f3*t + 2.4); 
 
% Sinal resultante
xt = x1 + x2 + x3;

% Aplicação da FFT (usando potência de 2 para otimizar)
n = 2^nextpow2(length(xt)); % Próxima potência de 2
sinal_padded = [xt, zeros(1, n - length(xt))]; % Preenchimento com zeros

% Calculando a FFT
fft_result = fft(sinal_padded);
fft_positiva = abs(fft_result(1:n/2)); % Magnitude da FFT (metade positiva)

% Frequências correspondentes para FFT positiva
frequencias_positivas = (0:(n/2)-1)*(fs/n);

% a) Plote o sinal no domínio do tempo.
figure;
subplot(3,1,1); % Primeiro gráfico (domínio do tempo)
plot(t, xt);
title('Sinal no domínio do tempo');
xlabel('Tempo [s]');
ylabel('Amplitude');
grid on;

% b) Realize a FFT e plote o sinal no domínio da frequência (em bins)
subplot(3,1,2); 
plot(frequencias_positivas, fft_positiva);
title('FFT Amostrada em Bins');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
grid on;

% c) Calcular magnitude em dB
fft_dcb = mag2db(fft_positiva); % Convertendo a magnitude para dB

% d) Plote o gráfico com a magnitude em decibéis
subplot(3,1,3); 
plot(frequencias_positivas, fft_dcb);
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');
title('Magnitude em dB da Resposta em Frequência');
grid on;
pause(10);