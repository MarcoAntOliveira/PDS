function X = fft_recursive(x)
    n = length(x);  % Número de amostras no sinal
    
    % Se o tamanho do vetor é 1, retorna o próprio vetor (caso base da recursão)
    if n == 1
        X = x;
        return;
    end
    
    % Verifica se n é uma potência de 2
    if mod(n, 2) ~= 0
        error('O tamanho da entrada deve ser uma potência de 2.');
    end
    
    % Separa os elementos pares e ímpares
    x_even = x(1:2:n); % Elementos de índice par
    x_odd = x(2:2:n);  % Elementos de índice ímpar
    
    % Recursivamente calcula a FFT dos elementos pares e ímpares
    X_even = fft_recursive(x_even);
    X_odd = fft_recursive(x_odd);
    
    % Pré-alocação do vetor de saída
    X = zeros(1, n);
    
    % Calcula a FFT combinada usando as simetrias da DFT
    for k = 1:n/2
        t = exp(-2 * 1i * pi * (k-1) / n) * X_odd(k);
        X(k) = X_even(k) + t;
        X(k + n/2) = X_even(k) - t;
    end
end
