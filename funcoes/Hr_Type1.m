% function [Hr, w, a, L] = Hr_Type1(h)
%     % Computes Amplitude response Hr(w) of a Type-1 LP FIR filter
%     % -----------------------------------------------------------
%     % [Hr, w, a, L] = Hr_Type1(h)
%     % Hr = Amplitude Response
%     % w = 500 frequencies between [0 pi] over which Hr is computed
%     % a = Type-1 LP filter coefficients
%     % L = Order of Hr
%     % h = Type-1 LP filter impulse response
    
%     M = length(h);
%     L = (M - 1) / 2;
%     a = [h(L + 1), 2 * h(L:-1:1)]; % 1x(L+1) row vector
%     n = (0:1:L)';                  % (L+1)x1 column vector
%     w = (0:1:500)' * pi / 500;
%     Hr = cos(w * n) * a';
% end

function [Hr, w, a, L] = Hr_Type1(h)
    % Resposta de Amplitude Hr(w) de um filtro FIR Tipo-1 de fase linear
    M = length(h);
    L = (M - 1) / 2;
    a = [h(L + 1), 2 * h(L:-1:1)]; % Coeficientes do filtro (vetor 1x(L+1))
    n = (0:L);                     % Vetor de índices (1x(L+1))
    w = (0:500)' * pi / 500;       % Vetor de frequências (501x1)
    
    % Verifica se as dimensões de `cos(w * n)` e `a'` são compatíveis
    Hr = cos(w * n) * a';          % Multiplicação (501x(L+1)) * (L+1)x1 -> 501x1
end
