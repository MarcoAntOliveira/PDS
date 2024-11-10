% function [Hr, w, P, L] = Ampl_Res(h)
%     % [Hr, w, P, L] = Ampl_Res(h)
%     % Calcula a resposta de amplitude Hr(w) e o polinômio P de ordem L,
%     % dada a resposta ao impulso h de um filtro FIR de fase linear.
%     % Determina automaticamente o tipo do filtro FIR.
    
%     % Comprimento do vetor h
%     M = length(h);
%     tolerance = 1e-6;  % Tolerância para comparação de simetria

%     % Verifica o tipo do filtro FIR com base na simetria
%     if all(abs(h - flip(h)) < tolerance)
%         if mod(M, 2) == 1
%             filterType = 1; % Tipo I: h(n) simétrico, M ímpar
%         else
%             filterType = 2; % Tipo II: h(n) simétrico, M par
%         end
%     elseif all(abs(h + flip(h)) < tolerance)
%         if mod(M, 2) == 1
%             filterType = 3; % Tipo III: h(n) antissimétrico, M ímpar
%         else
%             error('Tipo IV não é suportado nesta implementação.');
%         end
%     else
%         error('A resposta ao impulso h(n) não é de fase linear!');
%     end

%     % Determina a resposta de amplitude usando a função apropriada
%     switch filterType
%         case 1
%             [Hr, w, P, L] = Hr_Type1(h);
%         case 2
%             [Hr, w, P, L] = Hr_Type2(h);
%         case 3
%             [Hr, w, P, L] = Hr_Type3(h);
%     end
% end


function [Hr, w, P, L] = Ampl_Res(h)
    % [Hr, w, P, L] = Ampl_Res(h)
    % Calcula a resposta de amplitude Hr(w) e o polinômio P de ordem L,
    % dada a resposta ao impulso h de um filtro FIR de fase linear.
    % Determina automaticamente o tipo do filtro FIR.
    
    % Comprimento do vetor h
    N = length(h);
    tolerance = 1e-6;  % Tolerância para comparação de simetria
    
    % Verifica se h é simétrico ou antissimétrico com uma tolerância
    if all(abs(h - flip(h)) < tolerance)
        if mod(N, 2) == 1
            filterType = 1; % Tipo I: h(n) simétrico, N ímpar
        else
            filterType = 2; % Tipo II: h(n) simétrico, N par
        end
    elseif all(abs(h + flip(h)) < tolerance)
        if mod(N, 2) == 1
            filterType = 3; % Tipo III: h(n) antissimétrico, N ímpar
        else
            filterType = 4; % Tipo IV: h(n) antissimétrico, N par
        end
    else
        error('A resposta ao impulso h(n) não é de fase linear!');
    end
    
    % Determina a frequência angular e inicializa a resposta de amplitude
    w = linspace(0, pi, 512); % Faixa de frequência [0, pi] com 512 pontos
    Hr = zeros(size(w)); % Inicializa a resposta de amplitude
    
    % Calcula a resposta de amplitude Hr(w)
    for k = 1:length(w)
        omega = w(k);
        if filterType == 1 || filterType == 2
            Hr(k) = sum(h .* cos(omega * (0:N-1))); % Para filtros Tipo I e II
        else
            Hr(k) = sum(h .* sin(omega * (0:N-1))); % Para filtros Tipo III e IV
        end
    end
    
    % Ajusta a ordem do polinômio e define o polinômio de amplitude P
    L = N - 1;
    P = poly(h);
end
