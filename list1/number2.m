%{
%2- a)
% Número de amostras
N = 100000;

% Gerar a sequência aleatória uniformemente distribuída no intervalo [0, 2]
x1 = 2 * rand(1, N);

% Criar o histograma com 100 bins
[counts, centers] = hist(x1, 100);

% Plotar o histograma usando a função bar
bar(centers, counts, 'hist');

% Configurar o gráfico
title('Histograma de x_1(n)');
xlabel('Valor');
ylabel('Frequência');
grid on;

pause(10);  % Pausar por 10 segundos para visualizar o gráfico
%2 - b)


% Parâmetros
N = 10000;     % Número de amostras
mu = 10;       % Média
sigma = sqrt(10);  % Desvio padrão (raiz quadrada da variância)

% Gerar a sequência aleatória gaussiana
x2 = mu + sigma * randn(1, N);

% Criar o histograma com 100 bins
[counts, centers] = hist(x2, 100);

% Plotar o histograma usando a função bar
bar(centers, counts, 'hist');

% Configurar o gráfico
title('Histograma de x_2(n)');
xlabel('Valor');
ylabel('Frequência');
grid on;

pause(10);  % Pausar por 10 segundos para visualizar o gráfico

%2 - c)

%}

% Número de amostras
N = 100000;

% Gerar a sequência aleatória x1(n) uniformemente distribuída no intervalo [0, 2]
x1 = 2 * rand(1, N);

% Criar x3(n) = x1(n) + x1(n-1)
x3 = x1(2:end) + x1(1:end-1);

% Criar o histograma de x3 com 100 bins
[counts, centers] = hist(x3, 100);

% Plotar o histograma usando a função bar
bar(centers, counts, 'hist');

% Configurar o gráfico
title('Histograma de x_3(n)');
xlabel('Valor');
ylabel('Frequência');
grid on;

pause(10);  % Pausar por 10 segundos para visualizar o gráfico

