addpath("funcoes/");
pkg load signal;

b = [1]; 
a = [1, -1, 0.9]; 

% Número de amostras desejado
n_samples = 141;  % De -20 a 120 = 141 amostras

% Gerar a resposta ao impulso com impz
h = impz(b, a, n_samples);

% Definir o vetor de n para plotar corretamente
n = [-20:120];

x = stepseq(0, -20, 120); s = filter(b, a, x);

% Plotar a resposta ao impulso
subplot(2, 1, 1);stem(n, h);
title('Impulse Response'); xlabel('n');ylabel('h(n)');

subplot(2, 1, 2); stem(n, s);
title('Step response'); xlabel('n');ylabel('s(n)')

pause(45);
