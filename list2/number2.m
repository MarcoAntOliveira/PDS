addpath("funcoes/")
% 2- a)


n = 0:10;w = linspace(0, pi, 100); 
x = 2*(0.5).^n .*stepseq(-2, 0, 10);
y = dtft(x, n, w); % Cálculo da DTFT