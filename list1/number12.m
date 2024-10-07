addpath("funcoes/")

% Coeficientes de y(n) (parte à esquerda)
a = [1, -0.5, 0.25];

% Coeficientes de x(n) (parte à direita)
b = [1, 2, 0, 1];

% Sinal de entrada: impulso unitário no intervalo 0 ≤ n ≤ 100
n = 0:100;
x = impseq(0, 0, 100);  % Impulso unitário (delta de Dirac)

% Calcula a resposta y(n) usando a função filter
y = filter(b, a, x);

% Representação gráfica
stem(n, y);
title('Resposta ao Impulso do Sistema');
xlabel('n');
ylabel('y(n)');
grid on;

print("4_a).png", "-dpng");

% Soma dos valores absolutos da resposta ao impulso
soma_abs = sum(abs(y));

% Exibe a soma e verifica se o sistema é estável
if soma_abs < inf
    disp('O sistema é estável.');
else
    disp('O sistema é instável.');
end


% % Coeficientes de y(n) (parte à esquerda)
% a = [1, -0.5, 0.25];

% % Coeficientes de x(n) (parte à direita)
% b = [1, 2, 0, 1];

% % Sinal de entrada: impulso unitário no intervalo 0 ≤ n ≤ 100
% n = 0:200;
% x =  (5 +3*cos(0.2*pi*n) + 4*sin(0.6*pi*n));

% % Calcula a resposta y(n) usando a função filter
% y = filter(b, a, x);

% % Representação gráfica
% stem(n, y);
% title('Resposta ao Impulso do Sistema');
% xlabel('n');
% ylabel('y(n)');
% grid on;

% print("4_b).png", "-dpng");