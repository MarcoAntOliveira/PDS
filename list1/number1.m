addpath("funcoes/");


% %01 - a)
% n = [ -5: 15];
% x1 = 3*impseq(-2, -5, 15) + 2 * impseq(0, -5, 15) - impseq(3, -5, 15) + 5*impseq(7, -5, 15);
% stem(n, x1, 'b');  
% pause(60);


% %01 -c)
% n= [-5: 15];

% x3 = 10*stepseq(0, -5, 15) - 5*stepseq(5, -5, 15) - 10*stepseq(10, -5, 15) + 5*impseq(15 , -5, 15);
% stem(n , x3);
% pause(45);
% %01 -d)
% n = [-10:10];

% % Calcular x(n) com multiplicação ponto a ponto (element-wise)
% x4 = exp(0.1*(n)) .* (impseq(-20, -10, 10) - impseq(10, -10, 10));

% % Plotar o gráfico de x(n)
% stem(n, x);
% pause(10);

% %01 -d)
% n = [-200 : 200];

% x5 = 5 *[cos(0.49*pi*n) + cos(0.51*pi*n)];

% stem(n, x, "r");
% pause(10);
% %01 - e)

% n = [-200 : 200];

% x6 = 2 *sin(0.01*pi*n).*cos(0.5*pi*n);
% stem(n , x6);
% pause(10);

% % assim  como na anterior as ondas de frequecias angular diferentes se sobrepoem
% %01 - f)
% n = [ 0: 100];

% x7 = exp(- 0.05 * n).*sin(0.1*pi*n + pi/3);
% stem(n, x7, 'g');
% pause(10); 
% % oscilação amortecida 
% n= [0:100];
% x8 = exp(0.01 * n).*sin(0.1*pi*n);
% stem(n , x8);
% pause(9);

% % %01- b)
% k = -5:5;
% n = -10:10;

% Ex = zeros(length(k), length(n));  % Matriz para armazenar os valores

% for i = 1:length(k)
%     [x, n_seq] = stepseq(-2*k(i), -10, 10);  % Obtem a sequência de degrau e seu índice n
%     Ex(i, :) = exp(-abs(k(i))) * x;  % Multiplica escalar pelo vetor gerado por stepseq
% end

% stem(Ex);
% print("01_b.png", "-dpng");
% pause(10);
