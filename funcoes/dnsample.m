

function [y, m] = dnsample(x, n, M)
    % Downsample sequence x(n) by a factor M to obtain y(m)
    % x: sequência original
    % n: vetor de índices correspondente à sequência x
    % M: fator de downsampling
    % y: sequência dizimada
    % m: novo vetor de índices correspondente à sequência y

    % Verifica se a sequência começa com n == 0
    if n(1) ~= 0
        error('A sequência de índices deve começar em n == 0.');
    end

    % Utiliza a função downsample do pacote signal
    y = downsample(x, M);
    
    % Reduz os índices de acordo com o fator de downsampling
    m = downsample(n, M);
end