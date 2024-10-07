
function [x, n] = impseq(n0, n1, n2)
    % Função para gerar uma sequência impulso unitário
    n = n1:n2;          % Gera o vetor de índices de n1 a n2
    x = (n - n0) == 0;  % Impulso unitário em n = n0