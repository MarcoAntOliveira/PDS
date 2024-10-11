addpath('funcoes/')
x = [1, 2, 3, 4, 4, 3, 2, 1]; N=8;
X = dft(x,N);
x_conj = conj(x);
X_conj = dft(x_conj,N);
subplot(2, 2, 1);stem(x);
title('Sequencia x[n]');xlabel('n');ylabel('x(n)');
subplot(2, 2, 2);stem(abs(X));
title('Magnitude da DFT de x[n]');xlabel('k');ylabel('|X[k]|');
subplot(2, 2, 3);stem(x_conj);
title('Sequencia x^*[n]');xlabel('k');ylabel('|X^*[k]|');
subplot(2, 2, 4);stem(abs(X_conj));
title('Magnitude da DFT de x^*[n]');xlabel('k');ylabel('|X^*[k]|');
pause(15)