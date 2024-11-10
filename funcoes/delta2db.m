function [Rp, As] = delta2db(delta1, delta2)
    % delta2db - Converte especificações absolutas (delta1 e delta2) em especificações em dB (Rp e As)
    %
    % Sintaxe:
    %   [Rp, As] = delta2db(delta1, delta2)
    %
    % Entradas:
    %   delta1 - Especificação absoluta para a banda de passagem
    %   delta2 - Especificação absoluta para a banda de rejeição
    %
    % Saídas:
    %   Rp - Especificação em dB para a banda de passagem
    %   As - Especificação em dB para a banda de rejeição
    
    % Cálculo de Rp em dB
    Rp = -20 * log10((1 - delta1) / (1 + delta1));
    
    % Cálculo de As em dB
    As = -20 * log10(delta2 / (1 + delta1));
end
