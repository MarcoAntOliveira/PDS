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
frequencias = (0:N-1) * (fs / N); % Frequências para os bins; 
% Amostrando apenas a metade positiva da FFT
frequencias_positivas = frequencias(1:N/2);  % Frequências positivas
fft_positiva = abs(fft_result(1:N/2));       % Magnitude da FFT
fft_dcb = mag2db(fft_positiva);
% Plotando o sinal no domínio do tempo
figure;
subplot(3,1,1); % Primeiro gráfico (domínio do tempo)
plot(t, xt);
title('Sinal no domínio do tempo');
xlabel('Tempo [s]');
ylabel('Amplitude');
grid on;


% Exibindo os resultado
subplot(3,1,2); 
plot(frequencias_positivas, fft_positiva);
title('FFT Amostrada em Bins');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
grid on;
pause(10)

subplot(3,1,3); 
plot(frequencias_positivas, fft_dcb);
title('FFT Amostrada em Bins');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
grid on;
pause(10)