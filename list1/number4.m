addpath("funcoes/")
%{
% Definindo a sequência original x(n)
x = [2, 4, -3, 1, -5, 4, 7];

% Definindo o intervalo de n (o termo inicial é n=1)
n = -3:length(x);

% Extensão de x para lidar com os deslocamentos
x_ext = [zeros(1, 5), x, zeros(1, 4)];  % Adiciona zeros nas bordas

% Cálculo de x1(n)
x1 = 2 * x_ext(4+(1:length(x))) + 3 * x_ext(9+(1:length(x))) - x;

% Representando graficamente com stem
figure;
stem(n, x1);
xlabel('n');
ylabel('x1(n)');
title('Sequência x1(n)');
grid on;
pause(45);

%}

% Definindo a sequência x(n)
x = [0, 1, 2, 3, 2, 1, 0, -1, -1];

% Definindo o intervalo de n (de -5 a 3)
n = -5:3;

% Representando graficamente com stem
figure;
stem(n, x);
xlabel('n');
ylabel('x(n)');
title('Sequência x(n) de n = -5 a n = 3');
grid on;
pause(45);