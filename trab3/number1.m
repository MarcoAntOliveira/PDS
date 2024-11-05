% Conversão de especificações absolutas para relativas (dB)


% Parâmetros de entrada (exemplo)
delta1 = 0.1;  % Valor de ripple (tolerância na banda de passagem)
delta2 = 0.01; % Valor de atenuação na banda de rejeição

% Cálculo de R_p (Ripple em dB)
Rp = -20 * log10((1 - delta1) / (1 + delta1));

% Cálculo de A_s (Atenuação em dB)
As = -20 * log10(delta2 / (1 + delta1));

% Exibição dos resultados
fprintf("Ripple (R_p) em dB: %.2f dB\n", Rp);
fprintf("Atenuação (A_s) em dB: %.2f dB\n", As);

% Conversão de especificações relativas para absolutas
% Supondo Rp e As conhecidos, queremos calcular delta1 e delta2

% Parâmetros de entrada (exemplo inverso)
Rp_dB = 1;  % Ripple em dB
As_dB = 40; % Atenuação em dB

% Cálculo de delta1
delta1_calc = (1 - 10^(-Rp_dB / 20)) / (1 + 10^(-Rp_dB / 20));

% Cálculo de delta2
delta2_calc = 10^(-As_dB / 20) * (1 + delta1_calc);

% Exibição dos resultados
fprintf("Delta1: %.5f\n", delta1_calc);
fprintf("Delta2: %.5f\n", delta2_calc);

% a) Escreva uma função para converter as especificações absolutas 𝛿1 e 𝛿2 nas
% especificações relativas 𝑅𝑝 e 𝐴𝑠 em dB. O formato da função deve ser

