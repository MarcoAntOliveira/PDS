clear all; 
pkg load control
addpath('funcoes/')

fs = 100;               % Taxa de amostragem (Hz)
t = 0:1/fs:1;           % Vetor de tempo de 0 a 1 segundo
f1 = 5;                 % Frequência da primeira senóide (Hz)
f2 = 20;                % Frequência da segunda senóide (Hz)
noise_amplitude = 0.5;  % Amplitude do ruído

% Geração do sinal com ruído
x = sin(2 * pi * f1 * t) + sin(2 * pi * f2 * t) + noise_amplitude * randn(size(t));

N = length(x); 
tic;
X = fft(x);
time_fft = toc;

tic;
Z = fft_prime_factor(x);
time_prime = toc;
% Eixo de frequências para FFT e FFT Prime Factor
f = fs * (0:(N/2)) / N;

% Ajustar o comprimento do sinal para a próxima potência de 2
next_pow2 = 2^nextpow2(N);  % Próxima potência de 2
x_padded = [x, zeros(1, next_pow2 - N)]; % Preencher com zeros
tic;
R = fft_recursive(x_padded);
time_recursive = toc;

tic;
Y = dft(x, N);
time_dft = toc;

fprintf('O tempo de execucao da fft : %.4f\n', time_fft);
fprintf('O tempo de execucao da fft_prime_factor : %.4f\n', time_prime);
fprintf('O tempo de execucao da fft_recursive : %.4f\n', time_recursive);
fprintf('O tempo de execucao da dft : %.4f\n', time_dft);
