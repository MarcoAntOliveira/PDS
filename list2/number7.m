addpath("funcoes/")
% Coeficientes do numerador b (para x(n))
b = [1, 1, 1, 1]; % Corresponde ao somatório de m=0 a m=3

% Coeficientes do denominador a (para y(n))
a = [1, -0.81, -0.81^2, -0.81^3]; % Corresponde ao somatório de l=1 a l=3 com fator (0.81)^l

% Frequências em rad/s (por exemplo, de 0 a pi)
w = linspace(0, pi, 500);

% Calcular a resposta em frequência
H = freqresp(b, a, w);

% Plotar a magnitude e fase
figure;
subplot(2, 1, 1);
plot(w, abs(H));
title('Magnitude da Resposta em Frequência');
xlabel('Frequência (rad/s)');
ylabel('|H(w)|');

subplot(2, 1, 2);
plot(w, angle(H));
title('Fase da Resposta em Frequência');
xlabel('Frequência (rad/s)');
ylabel('Fase de H(w) (radianos)');
print("2.7.png", "-dpng");
pause(45)