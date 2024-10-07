addpath("funcoes/");
pkg load signal

% n = 0:50; 
% M = 4; 
% x = sin(0.125*pi*n);

% % Chama a função dnsample
% [y, m] = dnsample(x, n, M);

% % Plota os gráficos
% subplot(2,1,1);
% stem(n, x);
% title('Sinal original');

% subplot(2,1,2);
% stem(m, y);
% title('Sinal dizimado por fator M');
% print("02_a.png", "-dpng");
% pause(40);


n = 0:50; 
M = 4; 
x = sin(0.5*pi*n);

% Chama a função dnsample
[y, m] = dnsample(x, n, M)

% Plota os gráficos
subplot(2,1,1);
stem(n, x);
title('Sinal original');

subplot(2,1,2);
stem(m, y);
title('Sinal dizimado por fator M');
print("02_b.png", "-dpng");
pause(40);