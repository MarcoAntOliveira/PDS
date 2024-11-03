function X = fft_mixed_radix(x)
    N = length(x);
    
    % Verifica se N é um número primo
    if isprime(N)
        % Se N é primo, usa a DFT direta
        X = dft_direct(x);
        return;
    end
    
    % Fatoração em primos de N
    factors = unique(prime_factorization(N));
    
    % Inicializa X com zeros
    X = zeros(1, N);
    
    % Divide e conquista com cada fator primo
    for p = factors
        % Número de subproblemas
        M = N / p;
        
        % Inicializa os subresultados para combinação
        X_sub = zeros(p, M);
        
        % Calcula a FFT de cada sub-sequência
        for m = 1:M
            sub_seq = x(m:M:end);  % Extrai a subsequência
            X_sub(:, m) = fft_recursive(sub_seq);  % Aplica FFT recursiva nos subgrupos
        end
        
        % Combina os resultados dos subproblemas
        for m = 1:M
            for k = 0:(p-1)
                twiddle = exp(-2i * pi * k * (m-1) / N);  % Fator de rotação
                X(k * M + m) = sum(X_sub(:, m) .* twiddle.^(0:(p-1))');
            end
        end
    end
end

function X = dft_direct(x)
    % Implementa a DFT direta
    N = length(x);
    X = zeros(1, N);
    for k = 0:(N-1)
        for n = 0:(N-1)
            X(k + 1) = X(k + 1) + x(n + 1) * exp(-2i * pi * k * n / N);
        end
    end
end

function factors = prime_factorization(n)
    % Retorna os fatores primos de n como um vetor
    factors = [];
    divisor = 2;
    while n > 1
        while mod(n, divisor) == 0
            factors = [factors, divisor];
            n = n / divisor;
        end
        divisor = divisor + 1;
    end
end

function X = fft_recursive(x)
    % Implementação da FFT recursiva radix-2
    n = length(x);
    
    % Caso base
    if n == 1
        X = x;
        return;
    end
    
    % Verifica se n é uma potência de 2
    if mod(n, 2) ~= 0
        error('O tamanho da entrada deve ser uma potência de 2.');
    end
    
    % Divide entre pares e ímpares
    X_even = fft_recursive(x(1:2:end));
    X_odd = fft_recursive(x(2:2:end));
    
    % Combina os resultados
    X = zeros(1, n);
    for k = 1:n/2
        t = exp(-2 * 1i * pi * (k-1) / n) * X_odd(k);
        X(k) = X_even(k) + t;
        X(k + n/2) = X_even(k) - t;
    end
end
