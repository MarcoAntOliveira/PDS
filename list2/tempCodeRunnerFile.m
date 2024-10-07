% 1-a)
n = -20:10; % Vetor de índices
w = linspace(-pi, pi, 100); % Frequências
x = ((0.6).^abs(n)) .* (stepseq(-10, -20, 10) - stepseq(11, -20, 10)); % Sinal
y = dtft(x, n, w); % Cálculo da DTFT

% Plotando a magnitude da DTFT
figure; 
plot(w, abs(y)); % Plot da magnitude em função das frequências
xlabel('Frequência (rad/s)');
ylabel('Magnitude');
title('Magnitude da DTFT');
pause(30);