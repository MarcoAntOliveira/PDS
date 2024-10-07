addpath("funcoes/")
%{
3 -a)
% Definir a sequência periódica
x = [-2, -1, 0, 1, 2];  % Sequência fundamental

% Número de períodos
periodos = 5;

% Repetir a sequência para obter 5 períodos
x_repetido = repmat(x, 1, periodos);

% Gerar índice de tempo para plotar os 5 períodos
n = 0:length(x_repetido)-1;

% Plotar o gráfico usando stem
figure;
stem(n, x_repetido, 'filled');
title('Sequência Periódica: 5 Períodos');
xlabel('Amostra (n)');
ylabel('Valor de x[n]');
grid on;
pause(45);
%3 - b)

% Função para gerar a sequência de degrau unitário

% Definir os limites de n
n1 = 0;  % Início do intervalo
n2 = 30; % Fim do intervalo
n = n1:n2;

% Gerar as sequências de degrau
[x1, n] = stepseq(0, n1, n2);   % Sequência de degrau em n = 0
[x2, ~] = stepseq(20, n1, n2);  % Sequência de degrau em n = 20

% Calcular a sequência x = exp(0.1 * n) * (stepseq(0) - stepseq(20))
x = exp(0.1 * n) .* (x1 - x2);

% Número de períodos
periodos = 5;

% Repetir a sequência para obter 5 períodos
x_repetido = repmat(x, 1, periodos);
n_repetido = 0:length(x_repetido)-1;

% Plotar a sequência usando stem
figure;
stem(n_repetido, x_repetido, 'filled');
title('Sequência x[n] = exp(0.1 * n) * (u[n] - u[n-20]) (5 Períodos)');
xlabel('n');
ylabel('x[n]');
grid on;

pause(45);

%3 - c)

% Definir os limites de n
n1 = 0;  % Início do intervalo
n2 = 30; % Fim do intervalo
n = n1:n2;

% Gerar as sequências de degrau
[x1, n] = stepseq(0, n1, n2);   % Sequência de degrau em n = 0
[x2, ~] = stepseq(10, n1, n2);  % Sequência de degrau em n = 20

% Calcular a sequência x = exp(0.1 * n) * (stepseq(0) - stepseq(20))
x = sin(0.1 * pi * n) .* (x1 - x2);

% Número de períodos
periodos = 4;

% Repetir a sequência para obter 5 períodos
x_repetido = repmat(x, 1, periodos);
n_repetido = 0:length(x_repetido)-1;

% Plotar a sequência usando stem
figure;
stem(n_repetido, x_repetido, 'filled');
title('Sequência x[n] = exp(0.1 * n) * (u[n] - u[n-20]) (5 Períodos)');
xlabel('n');
ylabel('x[n]');
grid on;

pause(45);

%}

%3 - d)
% Definir as sequências
x = [1, 2, 3];
x1 = [1, 2, 3, 4];

% Combinar as sequências
x2 = [x, x1]; % Concatenar x e x1

% Número de períodos
periodos = 5;

% Repetir a sequência para obter 5 períodos
x_repetido = repmat(x2, 1, periodos);

% Gerar índice de tempo para plotar os 5 períodos
n = 0:length(x_repetido)-1; % Ajustar o índice de tempo de acordo com o comprimento de x_repetido

% Plotar o gráfico usando stem
figure;
stem(n, x_repetido, 'filled');
title('Sequência Periódica: 5 Períodos');
xlabel('Amostra (n)');
ylabel('Valor de x[n]');
grid on;
pause(45);

