

function xt = sinsum(t, ck)
%x = sinsum(t, ck)

K = length(ck); k = 1:K;
ck= ck(:)';t =t(:)';
xt = ck * sin(2*pi*k'*t);

% Definir os valores de entrada
t = 0:0.1:1;      % Vetor de tempo
ck = [1, 0.5, 0.25]; % Coeficientes ck

% Chamar a função sinsum
xt = sinsum(t, ck);

% Exibir o resultado
disp(xt);

