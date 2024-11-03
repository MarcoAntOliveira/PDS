clear all; 
addpath('funcoes/')
%-------------------------------------------------------------------------------------------
% Parâmetros do sinal
% fs = 100;            % Taxa de amostragem (Hz)
% t = 0:1/fs:1;        % Vetor de tempo de 0 a 1 segundo

% % Frequências e amplitudes das senóides
% f1 = 5;              % Frequência da primeira senóide (Hz)
% f2 = 20;             % Frequência da segunda senóide (Hz)
% f3 = 50;             % Frequência da terceira senóide (Hz)
% f4 = 75;             % Frequência da quarta senóide (Hz)

% A1 = 1;              % Amplitude da primeira senóide
% A2 = 0.5;            % Amplitude da segunda senóide
% A3 = 0.3;            % Amplitude da terceira senóide
% A4 = 0.2;            % Amplitude da quarta senóide

% % Geração do sinal com múltiplas componentes
% x = A1 * sin(2 * pi * f1 * t) + ...
%     A2 * sin(2 * pi * f2 * t) + ...
%     A3 * sin(2 * pi * f3 * t) + ...
%     A4 * sin(2 * pi * f4 * t);
%-------------------------------------------------------------------------------------
% Parâmetros do sinal
fs = 100;               % Taxa de amostragem (Hz)
t = 0:1/fs:1;           % Vetor de tempo de 0 a 1 segundo
f1 = 5;                 % Frequência da primeira senóide (Hz)
f2 = 20;                % Frequência da segunda senóide (Hz)
noise_amplitude = 0.5;  % Amplitude do ruído

% Geração do sinal com ruído
x = sin(2 * pi * f1 * t) + sin(2 * pi * f2 * t) + noise_amplitude * randn(size(t));
%--------------------------------------------------------------------------------------
% Aplicação da FFT
X = fft(x);
N = length(x);        % Número de pontos na FFT
X_magnitude = abs(X/N); % Magnitude da FFT
X_magnitude = X_magnitude(1:N/2+1); % Mantém apenas a metade positiva do espectro
X_magnitude(2:end-1) = 2 * X_magnitude(2:end-1); % Corrige a magnitude

X_fase = angle(X/N); % Magnitude da FFT
X_fase = X_fase(1:N/2+1); % Mantém apenas a metade positiva do espectro
X_fase(2:end-1) = 2 * X_fase(2:end-1); % Corrige a magnitude
%------------------------------------------------------------------------------------------------
% Aplicação da FFT prime factor
Z = fft_prime_factor(x);
Z_magnitude = abs(Z/N); % Magnitude da FFT
Z_magnitude = Z_magnitude(1:N/2+1); % Mantém apenas a metade positiva do espectro
Z_magnitude(2:end-1) = 2 * Z_magnitude(2:end-1); % Corrige a magnitude

Z_fase = angle(Z/N); % fase da FFT
Z_fase = Z_fase(1:N/2+1); % Mantém apenas a metade positiva do espectro
Z_fase(2:end-1) = 2 * Z_fase(2:end-1); % Corrige a magnitude
%------------------------------------------------------------------------------------------------
% Eixo de frequências para FFT e FFT Prime Factor
f = fs * (0:(N/2)) / N;

% Ajustar o comprimento do sinal para a próxima potência de 2
next_pow2 = 2^nextpow2(N);  % Próxima potência de 2
x_padded = [x, zeros(1, next_pow2 - N)]; % Preencher com zeros

% Aplicação da FFT recursiva
R = fft_recursive(x_padded);
R_magnitude = abs(R/next_pow2); % Magnitude da FFT
R_magnitude = R_magnitude(1:next_pow2/2+1); % Mantém apenas a metade positiva do espectro
R_magnitude(2:end-1) = 2 * R_magnitude(2:end-1); % Corrige a magnitude

R_fase = angle(R/next_pow2); % fase da FFT
R_fase = R_fase(1:next_pow2/2+1); % Mantém apenas a metade positiva do espectro
R_fase(2:end-1) = 2 * R_fase(2:end-1); % Corrige a magnitude

%-----------------------------------------------------------------------------------------------
% Tamanho do sinal após zero-padding
N = length(x_padded);  
next_pow2 = 2^nextpow2(N);  

% Calcula a FFT usando fft_mixed_radix
C = fft_mixed_radix(x_padded);

% Calcula a magnitude e corrige para a metade positiva do espectro
C_magnitude = abs(C) / next_pow2;  % Normaliza a magnitude
C_magnitude = C_magnitude(1:next_pow2/2+1);  % Mantém a metade positiva do espectro
C_magnitude(2:end-1) = 2 * C_magnitude(2:end-1);  % Corrige a magnitude

% Calcula a fase e corrige para a metade positiva do espectro
C_fase = angle(C);  % Calcula a fase
C_fase = C_fase(1:next_pow2/2+1);  % Mantém a metade positiva do espectro

% Define o eixo de frequência com o mesmo tamanho que C_magnitude e C_fase
fs = 1000;  % Frequência de amostragem, por exemplo, 1000 Hz
frequencies = (0:(next_pow2/2)) * (fs / next_pow2);

%------------------------------------------------------------------------------------------
% Eixo de frequências para FFT Recursiva
f_recursive = fs * (0:(next_pow2/2)) / next_pow2;
N = length(x);        % Número de pontos na FFT
Y = dft(x, N);
Y_magnitude = abs(Y/N); % Magnitude da FFT
Y_phase = angle(Y/N); % Fase da FFT
Y_magnitude = Y_magnitude(1:N/2+1); % Mantém apenas a metade positiva do espectro
Y_phase = Y_phase(1:N/2+1); % Mantém apenas a metade positiva do espectro

%-----------------------------------------------------------------------------------------
% % Visualização do sinal no domínio do tempo
% figure;
% plot(t, x);
% title('Sinal no Domínio do Tempo');
% xlabel('Tempo (s)');
% ylabel('Amplitude');
% grid on;

% % Plot do espectro de frequência usando DFT

% subplot(1,2,1);
% plot(f, Y_magnitude);
% title('Espectro de Frequência (Magnitude)');
% xlabel('Frequência (Hz)');
% ylabel('Magnitude');
% grid on;

% subplot(1,2,2);
% plot(f, Y_phase);
% title('Espectro de Frequência (Fase)');
% xlabel('Frequência (Hz)');
% ylabel('Fase (radianos)');
% grid on;


% Plot do espectro de frequência usando FFT
% subplot(1,2,1);
% plot(f, X_magnitude);
% title('Espectro de Frequência (FFT)');
% xlabel('Frequência (Hz)');
% ylabel('Magnitude');
% grid on;

% subplot(1,2,2);
% plot(f, X_fase);
% title('Espectro de Frequência (Fase)');
% xlabel('Frequência (Hz)');
% ylabel('Fase (radianos)');
% grid on;

% % Plot do espectro de frequência usando FFT Prime Factor
% subplot(1,2,1);
% plot(f, Z_magnitude);
% title('Espectro de Frequência (FFT Prime Factor)');
% xlabel('Frequência (Hz)');
% ylabel('Magnitude');
% grid on;

% subplot(1,2,2);
% plot(f, Z_fase);
% title('Espectro de Frequência (Fase)');
% xlabel('Frequência (Hz)');
% ylabel('Fase (radianos)');
% grid on;

% Plot do espectro de frequência usando FFT Recursiva
% subplot(1,2,1);
% plot(f_recursive, R_magnitude);
% title('Espectro de Frequência (FFT Recursiva)');
% xlabel('Frequência (Hz)');
% ylabel('Magnitude');
% grid on;

% subplot(1,2,2);
% plot(f_recursive, R_fase);
% title('Espectro de Frequência (Fase)');
% xlabel('Frequência (Hz)');
% ylabel('Fase (radianos)');
% grid on;

% Plot do espectro de frequência usando FFT mixed
subplot(1,2,1);
plot(frequencies, C_magnitude);
title('Espectro de Frequência (FFT mixed Factor)');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
grid on;

subplot(1,2,2);
plot(frequencies, C_fase);
title('Espectro de Frequência (Fase)');
xlabel('Frequência (Hz)');
ylabel('Fase (radianos)');
grid on;


pause(10);
% print("Test1/time_domain-1.png", "-dpng");
% print("Test1/prime_fft-1.png", "-dpng");
% print("Test1/recursive_fft-1.png", "-dpng");
% print("Test1/dft-1.png", "-dpng");

% % Cálculo da energia no domínio do tempo
% energia_tempo = sum(abs(x).^2);

% % Energia no domínio da frequência para a FFT
% energia_fft = sum(abs(X).^2) / N;

% % Energia no domínio da frequência para a FFT Prime Factor
% energia_prime_factor = sum(abs(Z).^2) / N;

% % Energia no domínio da frequência para a FFT Recursiva
% energia_fft_recursiva = sum(abs(R).^2) / next_pow2;

% % Energia no domínio da frequência para a DFT
% energia_dft = sum(abs(Y).^2) / N;

% % Exibir os resultados
% fprintf('Energia no domínio do tempo: %.4f\n', energia_tempo);
% fprintf('Energia no domínio da frequência (FFT): %.4f\n', energia_fft);
% fprintf('Energia no domínio da frequência (Prime Factor): %.4f\n', energia_prime_factor);
% fprintf('Energia no domínio da frequência (FFT Recursiva): %.4f\n', energia_fft_recursiva);
% fprintf('Energia no domínio da frequência (DFT): %.4f\n', energia_dft);