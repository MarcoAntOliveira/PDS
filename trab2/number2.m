addpath("funcoes/")
pkg load signal
[y, Fs] = audioread('trab2/train.wav');

% Criando um vetor de tempo correspondente às amostras
t = (0:length(y)-1) / Fs;


% Gerando o sinal de ruído branco gaussiano
ruido_amplitude = 0.5;  % Amplitude do ruído, você pode ajustar
ruido = ruido_amplitude * randn(size(y));  % Ruído com média 0 e variância controlada

wc_l = 0;
wc_u = 1000;
% Adicionando o ruído ao sinal original
y_com_ruido = y + ruido;

filt_bp = fir1(30,[wc_l wc_u]/(Fs/2)); %Projeto Band-Pass
y_rec = filter(filt_bp,1,y_com_ruido);

% Plotando o áudio em função do tempo
figure;
subplot(5,1,1); 
plot(t, y);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal de Áudio Original');
grid on;

% Sinal com ruído adicionado
subplot(5,1,2); 
plot(t, y_com_ruido);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal de Áudio com Ruído');
grid on;

%sinal filtrado
subplot(5,1,3); 
plot(t, abs(y_rec));
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Magnitude do sinal');
grid on;


%sinal filtrado
subplot(5,1,4); 
plot(t, angle(y_rec));
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Fase do sinal recuperado');
grid on;


%sinal filtrado
subplot(5,1,5); 
plot(t, y_rec);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal recuperado');
grid on;


pause(10);
