addpath("funcoes/")

% %5 - a)
% n = [0:9]; x = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
% y = evenodd(x, n);
% stem(y);
% pause(10);

% %5 - b)

% n = [0:20]; x2 = exp(0.1 * n).*(stepseq(-5, 0, 20) - stepseq(10, 0, 20));
% y2 = evenodd(x2, n);
% stem(y2);
% pause(10);


% %5 - c)

% n = [-20:20]; x3= cos(0.2*n*pi + pi/4);
% y3 = evenodd(x3, n);
% stem(y3);
% pause(20);

%5 - d)

n = 0:100; x4 = exp(-0.05*n) + sin(0.1*pi*n + pi/3);
y4 = evenodd(x4, n);
stem(y4);
pause(10);