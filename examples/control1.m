pkg load control  % Carregar o pacote Control

% Definir os parâmetros de um sistema de segunda ordem
wn = 2;  % Frequência natural
zeta = 0.5;  % Fator de amortecimento

% Criar a função de transferência do sistema de segunda ordem
num = [wn^2];  % Numerador
den = [1 2*zeta*wn wn^2];  % Denominador
sys = tf(num, den);  % Função de transferência

% Exibir a função de transferência
disp('Função de Transferência:');
disp(sys);
pause(5);

% Plotar a resposta ao degrau do sistema
figure;
step(sys);
title('Resposta ao Degrau de um Sistema de Segunda Ordem');
grid on;
pause(5);

