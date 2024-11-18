addpath("funcoes/")
% n = 0:30;  % Definindo o intervalo de n
% u = @(n) double(n >= 0);  % Função unitária

% % % % % Sequência h1(n)
% h1 = (0.9).^abs(n - 5) .* cos(pi * (n - 5) / 12) .* (u(n, 0) - u(n, 11));

% % % % % Sequência h2(n)
% % h2 = (0.9).^abs(n - 4.5) .* cos(pi * (n - 4.5) / 11) .* (u(n, 0) - u(n, 10));

% % % Sequência h3(n)
% % % h3 = (0.9).^abs(n - 5) .* sin(pi * (n - 5) / 12) .* (u(n, 0) - u(n, 11));

% % % % Sequência h4(n)
% % % h4 = (0.9).^abs(n - 4.5) .* sin(pi * (n - 4.5) / 11) .* (u(n, 0) - u(n, 10));

% % % % Sequência h5(n)
% % % h5 = (0.9).^n .* cos(pi * (n - 5) / 12) .* (u(n, 0) - u(n, 11));

% % % Chamada da função Ampl_Res para calcular Hr e polinômio P
% [Hr, w, P, L] = Ampl_Res(h1);

% % % Plot da resposta de amplitude
% figure;
% plot(w, Hr);
% title('Resposta de Amplitude de h1(n)');
% xlabel('\omega');
% ylabel('Hr(\omega)');
% pause(15);


% Definindo o intervalo de n
n = 0:20;

% Função degrau unitário
u = @(n, n0) double(n >= n0);

% Sequência h1(n)
h1 = (0.9).^abs(n - 5) .* cos(pi * (n - 5) / 12) .* (u(n, 0) - u(n, 11));

% Sequência h2(n)
h2 = (0.9).^abs(n - 4.5) .* cos(pi * (n - 4.5) / 11) .* (u(n, 0) - u(n, 10));

% Sequência h3(n)
h3 = (0.9).^abs(n - 5) .* sin(pi * (n - 5) / 12) .* (u(n, 0) - u(n, 11));

% Sequência h4(n)
h4 = (0.9).^abs(n - 4.5) .* sin(pi * (n - 4.5) / 11) .* (u(n, 0) - u(n, 10));

% Sequência h5(n)
h5 = (0.9).^n .* cos(pi * (n - 5) / 12) .* (u(n, 0) - u(n, 11));

% Exibindo as sequências para verificar se não são todas zeros
figure;
subplot(5, 1, 1);
stem(n, h1);
title('Sequência h1(n)');
xlabel('n');
ylabel('h1(n)');

subplot(5, 1, 2);
stem(n, h2);
title('Sequência h2(n)');
xlabel('n');
ylabel('h2(n)');

subplot(5, 1, 3);
stem(n, h3);
title('Sequência h3(n)');
xlabel('n');
ylabel('h3(n)');

subplot(5, 1, 4);
stem(n, h4);
title('Sequência h4(n)');
xlabel('n');
ylabel('h4(n)');

subplot(5, 1, 5);
stem(n, h5);
title('Sequência h5(n)');
xlabel('n');
ylabel('h5(n)');
% pause(10);

print("trab3/2.png", "-dpng");