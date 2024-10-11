addpath("funcoes/")
n = 0:10;
x = 10*(0.8) .^ n;
y = cirshftt(x,6,15);
n = 0:14;
x = [x, zeros(1,4)];
subplot(2,1,1); stem(n,x);
title('Sequência Original');xlabel('n'); ylabel('x(n)');
subplot(2,1,2); stem(n,y);
title('Sequencia Deslocada, N=15'); xlabel('n');
ylabel('x((n-6) mod 15)');
pause(15);