addpath("funcoes/")
%% Deslocamento em frequência X(k-l) com l=2
k_shifted = 2; % Exemplo de deslocamento de k
N = 11;
n = 0:N-1;
x = 10 * (0.8).^n;
X = dft(x,N);
% Aplicar o deslocamento circular no domínio da frequência
X_shifted = circshift(X, [0, k_shifted]);
% Plotar a magnitude da DFT original e do deslocamento circular
subplot(2, 1, 1);stem(abs(X));
title('Magnitude da DFT original');xlabel('k');ylabel('|X[k]|');
subplot(2, 1, 2);stem(abs(X_shifted));
title('Magnitude da DFT com deslocamento circular de k');
xlabel('k');ylabel('|X_shifted[k]|');
pause(15);