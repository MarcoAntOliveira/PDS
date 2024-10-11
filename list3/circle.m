addpath("funcoes/")
%a)
n = 0:10;
x = 10*(0.8) .^ n;
y = x(mod(-n,11)+1);
subplot(2,1,1);
stem(n,x);
title('Sequencia Original')
xlabel('n'); ylabel('x(n)');
subplot(2,1,2);
stem(n,y);
title('Sequencia com dobramento circular')
xlabel('n'); ylabel('x(-n mod 10)');
pause(45);
%b)

X = dft(x,11);
Y = dft(y,11);
subplot(2,2,1);
stem(n,real(X));
title('Real{DFT[x(n)]}'); xlabel('k');
subplot(2,2,2);
stem(n,imag(X));
title('Imag{DFT[x(n)]}'); xlabel('k');
subplot(2,2,3);
stem(n,real(Y));
title('Real{DFT[x((-n))11]} '); xlabel('k');
subplot(2,2,4); stem(n,imag(Y));
title('Imag{DFT[x((-n))11]}'); xlabel('k');
pause(15)