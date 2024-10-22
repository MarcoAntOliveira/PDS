addpath("funcoes/")
pkg load signal

[y, Fs] = audioread('trab2/train.wav');

% Criando um vetor de tempo correspondente às amostras
t = (0:length(y)-1) / Fs;

% Gerando o sinal de ruído branco gaussiano
ruido_amplitude = 0.5;  % Amplitude do ruído, ajustável
ruido = ruido_amplitude * randn(size(y));  % Ruído com média 0 e variância controlada

% Adicionando o ruído ao sinal original
y_com_ruido = y + ruido;

% Frequências de corte para o filtro
wc_l = 0;    % Frequência de corte inferior (Hz)
wc_u = 1000; % Frequência de corte superior (Hz)

% Normalizando as frequências de corte
wc_l_norm = wc_l / (Fs/2); % Frequência inferior normalizada (0 a 1)
wc_u_norm = wc_u / (Fs/2); % Frequência superior normalizada (0 a 1)

% Verificando se as frequências de corte estão no intervalo correto
if wc_l_norm >= 0 && wc_u_norm <= 1 && wc_l_norm < wc_u_norm
    % Projeto do filtro passa-banda FIR com frequências normalizadas
    filt_bp = fir1(30, [wc_l_norm wc_u_norm]); % Filtro FIR passa-banda
    
    % Filtrando o sinal
    y_rec = filter(filt_bp, 1, y_com_ruido);
else
    error('As frequências de corte estão fora do intervalo válido.');
end

% Calculando a FFT para magnitude e fase do sinal recuperado
Y_rec_fft = fft(y_rec);
frequencias = (0:length(Y_rec_fft)-1) * (Fs / length(Y_rec_fft));

% a) Plote o sinal original no domínio do tempo
figure;
subplot(3,1,1); 
plot(t, y);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal de Áudio Original');
grid on;

% b) Plote o sinal com ruído adicionado
subplot(3,1,2); 
plot(t, y_com_ruido);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal de Áudio com Ruído');
grid on;

% c) Plote a magnitude do sinal recuperado no domínio da frequência
subplot(3,1,3); 
plot(frequencias, abs(Y_rec_fft));
xlabel('Frequência (Hz)');
ylabel('Magnitude');
title('Magnitude do Sinal Recuperado');
grid on;

% d) Plote a fase do sinal recuperado no domínio da frequência
subplot(3,1,1); 
plot(frequencias, angle(Y_rec_fft));
xlabel('Frequência (Hz)');
ylabel('Fase (radianos)');
title('Fase do Sinal Recuperado');
grid on;

% e) Plote a fase do sinal original no tempo
subplot(3,1,2); 
plot(t, angle(y));
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Fase do Sinal Original');
grid on;

% Sinal recuperado no tempo
subplot(3,1,3); 
plot(t, y_rec);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal Recuperado no Tempo');
grid on;

pause(10);
