addpath("funcoes/")

% 1 - a)
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

% Frequências correspondentes
frequencies = (0:n-1) * (fs/n); % Vetor de frequências para plot

% Plotando o sinal no domínio do tempo
figure;
subplot(2,1,1); % Primeiro gráfico (domínio do tempo)
plot(t, xt);
title('Sinal no domínio do tempo');
xlabel('Tempo [s]');
ylabel('Amplitude');
grid on;

% Plotando a magnitude da FFT
subplot(2,1,2); % Segundo gráfico (magnitude da FFT)
plot(frequencies, abs(fft_result));
title('Magnitude da FFT');
xlabel('Frequência [Hz]');
ylabel('Magnitude');
grid on;
pause(15)