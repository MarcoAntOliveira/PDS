addpath("funcoes/")
t =0:0.0001:0.1;
x1_t = sin(2*pi*50*t); % Sinal senoidal de 50 Hz
x2_t = cos(2*pi*150*t); % Sinal cossenoidal de 150 Hz
% Definir parâmetros
Fs = 2100; % alinhando com as frequências dos sinais
n1 = 0:1/Fs:0.1;
n2 = n1;
x1 = sin(2*pi*50*n1);
x2 = cos(2*pi*150*n2);
x_comb = 2*x1 + 0.5*x2; % Combinação linear com coeficientes 2 e 0.5
N = length(x1); %Definindo o tamanho da amostra
X1 = dft(x1, N); % Transformada do primeiro sinal
X2 = dft(x2, N); % Transformada do segundo sinal
X_comb = dft(x_comb, N); % Transformada da combinação linear

%% Plotando os sinais contínuos e discretos
figure('NumberTitle','off','Name','Exemplos DFT Linearidade');
subplot(3,2,1);
plot(t,x1_t);
xlabel('t');
title(['x_1(t) = sin(2{\pi}50t)']);
ylabel('x_1(t)');
subplot(3,2,2);
stem(n1,x1,'filled','markersize',2);
xlabel('n');
title(['x_1(n) = sin(2{\pi}50nT_s)']);
ylabel('x_1(n)');
% ... Basta plotas os demais sinais contínuos e discretos
% Plotar os sinais e suas transformadas

subplot(3,2,3);
stem(n1,x1,'filled','markersize',2);
xlabel('n');
title(['x_1(n) = sin(2{\pi}50nT_s)']);
ylabel('x_1(n)');
subplot(3, 2, 4);
stem(abs(X1));
axis([0,210,min(abs(X1)),max(abs(X1))]);
title('DFT de x1');
xlabel('Frequência (bins)');
ylabel('Magnitude');
%basta plotas os demais sinais discretos e suas respectivas
%magnitudes da DF
% Plotar os sinais e suas transformadas em hertz

k=(0:N-1); % Fs e N já foram definidos
subplot(3,2,5);
stem(n1,x1,'filled','markersize',2);
xlabel('n');
title(['x_1(n) = sin(2{\pi}50nT_s)']);
ylabel('x_1(n)');
subplot(3, 2, 6);
plot((Fs/N)*k,abs(X1));
axis([0,200,min(abs(X1)),max(abs(X1))]);
title('DFT de x1');
xlabel('Frequência (Hz)');
ylabel('Magnitude');
% Plot os outros sinais da mesma forma
pause(15);