addpath("funcoes/")
% Testando a implementação
fs = 1000; % Frequência de amostragem
t = 0:1/fs:1-1/fs; % Vetor de tempo de 1 segundo
f1 = 50; % Frequência 1
f2 = 120; % Frequência 2

% Sinal composto por duas senoidais
sinal = sin(2*pi*f1*t) + sin(2*pi*f2*t);

% Zero-padding para garantir que o comprimento do sinal seja uma potência de 2
n = 2^nextpow2(length(sinal));  % Próxima potência de 2
sinal_padded = [sinal, zeros(1, n - length(sinal))];

% Calculando a FFT usando a implementação
fft_result = fft_recursive(sinal_padded);

% Comparando com a FFT nativa do Octave
fft_native = fft(sinal_padded);

% Exibindo resultados
figure;
subplot(2,1,1);
plot(abs(fft_result));
title('FFT Implementada');

subplot(2,1,2);
plot(abs(fft_native));
title('FFT Nativa');
pause(15)
% Comparação de erros
diff_result = max(abs(fft_result - fft_native));
fprintf('Máxima diferença entre as FFTs: %e\n', diff_result);
