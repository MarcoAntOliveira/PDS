t = 0:0.01:2;         % Vetor t para o plot contínuo
x_t = sin(2*pi*t);    % Sinal contínuo

n = 0:1:40;           % Vetor n para o plot discreto
x_n = sin(0.1*pi*n);  % Sinal discreto

% Configuração dos gráficos
xlabel('n');
ylabel('x(n)');
title('Stem Plot of sin(0.2 pi n)'); 

% Gráfico contínuo
subplot(2, 1, 1);
plot(t, x_t, 'b');    % Usar x_t para o plot contínuo
xlabel('Tempo (t)');
ylabel('Amplitude (x(t))');
title('Gráfico Contínuo de sin(2 pi t)');

% Gráfico discreto
subplot(2, 1, 2);
Hs = stem(n, x_n, 'b', 'filled');  % Usar x_n para o stem plot
set(Hs, 'markersize', 4);
xlabel('Índice n');
ylabel('Amplitude (x(n))');
title('Gráfico Discreto de sin(0.1 pi n)');

pause(50);
