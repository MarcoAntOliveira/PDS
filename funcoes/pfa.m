function X = fft_prime_factor(x)
    N = length(x);
    
    % Fatorar N em números primos
    factors = prime_factorization(N);
    
    % Inicializa a saída da DFT
    X = zeros(1, N);
    
    % Loop para calcular a DFT usando PFA
    for k = 0:N-1
        sum_result = 0;
        for n = 0:N-1
            sum_result = sum_result + x(n + 1) * exp(-2i * pi * k * n / N);
        end
        X(k + 1) = sum_result;  % Armazenar o resultado
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
        divisor += 1;
    end
end

% Exemplo de uso
x = rand(1, 12);  % Exemplo com N = 12
disp("Sequência de entrada:");
disp(x);

X = fft_prime_factor(x);
disp("Resultado da FFT:");
disp(X);
