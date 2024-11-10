 function [delta1, delta2] = db2delta(Rp, As)
    % db2delta - Converte especificações em dB (Rp e As) para especificações absolutas (delta1 e delta2)
    %
    % Sintaxe:
    %   [delta1, delta2] = db2delta(Rp, As)
    %
    % Entradas:
    %   Rp - Especificação em dB para a banda de passagem
    %   As - Especificação em dB para a banda de rejeição
    %
    % Saídas:
    %   delta1 - Especificação absoluta para a banda de passagem
    %   delta2 - Especificação absoluta para a banda de rejeição
    
    % Cálculo de delta1 a partir de Rp
    delta1 = (10^(-Rp/20) - 1) / (10^(-Rp/20) + 1);
    
    % Cálculo de delta2 a partir de As
    delta2 = (1 + delta1) * 10^(-As/20);
end