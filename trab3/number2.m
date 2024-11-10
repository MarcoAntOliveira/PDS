addpath("funcoes/")
n = 0:20;  % Definindo o intervalo de n
u = @(n) double(n >= 0);  % Função unitária

% % Sequência h1(n)
% h1 = (0.9).^abs(n - 5) .* cos(pi * (n - 5) / 12) .* (u(n, 0) - u(n, 11));

% % Sequência h2(n)
% h2 = (0.9).^abs(n - 4.5) .* cos(pi * (n - 4.5) / 11) .* (u(n, 0) - u(n, 10));

% Sequência h3(n)
h3 = (0.9).^abs(n - 5) .* sin(pi * (n - 5) / 12) .* (u(n, 0) - u(n, 11));

% % Sequência h4(n)
% h4 = (0.9).^abs(n - 4.5) .* sin(pi * (n - 4.5) / 11) .* (u(n, 0) - u(n, 10));

% % Sequência h5(n)
% h5 = (0.9).^n .* cos(pi * (n - 5) / 12) .* (u(n, 0) - u(n, 11));

% Chamada da função Ampl_Res para calcular Hr e polinômio P
[Hr, w, P, L] = Ampl_Res(h3);

% Plot da resposta de amplitude
figure;
plot(w, Hr);
title('Resposta de Amplitude de h1(n)');
xlabel('\omega');
ylabel('Hr(\omega)');
pause(15);