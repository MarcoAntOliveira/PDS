addpath("funcoes/")
n = [0 : 10]; x = stepseq(0, 0, 10) - stepseq(10, 0, 10);
[xe, xo, m] = evenodd(x, n);

subplot(2,2,1);stem(n,x);title('rectangular pulse')
xlabel('n');ylabel('x(n)');axis([-10, 10, 0, 1.2])


subplot(2, 2, 2); stem(m, xe);title('even part')
xlabel('n');ylabel('xe(n)');axis([-10, 10, 0, 1.2])

subplot(2, 2, 4);stem(m, xo); title('odd part')
xlabel('n');ylabel('xo(n)');axis([-10, 10, -0.6, 0.6]);pause(10);