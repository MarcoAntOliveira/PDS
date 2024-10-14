addpath("funcoes/")

%1 - a)
f1 = 1; f2 = 2; f3 = 3;
fs = 1000; T = 1.5; N = T*fs;
t = linspace(0, T, N) ;

% Funções
x1 = 3*cos(2*pi*f1*t);
x2 = cos(2*pi*f2*t - 0.3);
x3 = 2*cos(2*pi*f3*t + 2.4); 

xt = x1 + x2 + x3;


figure;
plot(t, xt);
title('Sinal no domínio do tempo');
xlabel('Tempo [s]');
ylabel('Amplitude');
grid on;
pause(15);