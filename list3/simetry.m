addpath("funcoes/")
n = 0:10;
x = 10*(0.8) .^ n;
[xec,xoc] = circevod(x);
subplot(2,2,1); stem(n,x); title('Sequencia Original x(n)')
xlabel('n'); ylabel('x(n)'); axis([-0.5,10.5,-1,11])
subplot(2,2,2); stem(n,xec); title('Componente Circular Par')
xlabel('n'); ylabel('xec(n)'); axis([-0.5,10.5,-1,11])
subplot(2,2,4); stem(n,xoc); title('Componente Circular Ímpar')
xlabel('n'); ylabel('xoc(n)'); axis([-0.5,10.5,-4,4])
pause(15);