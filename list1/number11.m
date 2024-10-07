addpath("funcoes/");
% 3-a)
% x = [2, -4, 5, 3, -1, -2, 6]; y =[1, -1, 1, -1, 1];
% nx = [-3 : 3]; ny = [-1:3];
% [h, nh] = conv_m(x, nx, y, ny)

%3 - b)

nx = [-10:10];  % Agora nx tem o mesmo tamanho de n
nh = [-10:10];  % Definindo nh para o mesmo intervalo

n = [-10:10];
x = n./(4.*(stepseq(0, -10, 10) - stepseq(6, -10, 10)));
h = 2*(stepseq(-2, -10, 10) - stepseq(3, -10, 10));

[y, ny] = conv_m(x, nx, h, nh)

pause(40);
