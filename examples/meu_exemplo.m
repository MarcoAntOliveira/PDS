addpath("funcoes/");

%{ 

%example 01 - a
n = [-5:5]; 
x = 2 * impeseq(-2, -5, 5) - impeseq(4, -5, 5);
stem(n,x);
xlabel('n'); ylabel("x(n)");
pause(10);

%example 01 - b
n = [0 : 20]; x1 = n .*(stepseq(0, 0, 20) - stepseq(10, 0, 20));
x2 = 10 * exp((-0.3 * n - 10)).*(stepseq(10, 0, 20) - stepseq(20, 0, 20));
x = x1 + x2 ;
subplot(2, 2, 3); stem(n , x);
xlabel('n'); ylabel('x(n)');
pause(10);

%example 01 - c
n = [0:50]; x = cos(0.04*pi*n) + 0.2*randn(size(n));
plot(2,2,2);stem(n, x);
xlabel('n');ylabel('x(n)');
pause(10);

%example 01 - d
n = [-10:9]; x =[5, 4, 3, 2, 1];
xtilde = x '* ones (1 , 4); xtilde = (xtilde(:))';
plot(2,2,4);stem(n, xtilde);
xlabel('n');ylabel('xtilde(n)');
pause(10);
%}

n = [-5:5];



