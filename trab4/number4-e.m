pkg load signal

% Especificações do filtro
Wp = 0.45; % Frequência de borda da banda passante (normalizada 0 a 1)
Ws = 0.5;  % Frequência de borda da banda de parada (normalizada 0 a 1)
Rp = 0.5;  % Ondulação máxima na banda passante (dB)
As = 60;   % Atenuação mínima na banda de parada (dB)

% 1. Butterworth
[N_butter, Wn_butter] = buttord(Wp, Ws, Rp, As);
[b_butter, a_butter] = butter(N_butter, Wn_butter, 'low');
[H_butter, omega_butter] = freqz(b_butter, a_butter, 500);
attenuation_stopband_butter = -max(20 * log10(abs(H_butter(omega_butter >= Ws * pi))));

% 2. Chebyshev I
[N_cheby1, Wn_cheby1] = cheb1ord(Wp, Ws, Rp, As);
[b_cheby1, a_cheby1] = cheby1(N_cheby1, Rp, Wn_cheby1, 'low');
[H_cheby1, omega_cheby1] = freqz(b_cheby1, a_cheby1, 500);
attenuation_stopband_cheby1 = -max(20 * log10(abs(H_cheby1(omega_cheby1 >= Ws * pi))));

% 3. Chebyshev II
[N_cheby2, Wn_cheby2] = cheb2ord(Wp, Ws, Rp, As);
[b_cheby2, a_cheby2] = cheby2(N_cheby2, As, Wn_cheby2, 'low');
[H_cheby2, omega_cheby2] = freqz(b_cheby2, a_cheby2, 500);
attenuation_stopband_cheby2 = -max(20 * log10(abs(H_cheby2(omega_cheby2 >= Ws * pi))));

% 4. Elliptic
[N_ellip, Wn_ellip] = ellipord(Wp, Ws, Rp, As);
[b_ellip, a_ellip] = ellip(N_ellip, Rp, As, Wn_ellip, 'low');
[H_ellip, omega_ellip] = freqz(b_ellip, a_ellip, 500);
attenuation_stopband_ellip = -max(20 * log10(abs(H_ellip(omega_ellip >= Ws * pi))));

% Comparação
filters = {
    struct('name', 'Butterworth', 'N', N_butter, 'attenuation', attenuation_stopband_butter, 'b', b_butter, 'a', a_butter),
    struct('name', 'Chebyshev I', 'N', N_cheby1, 'attenuation', attenuation_stopband_cheby1, 'b', b_cheby1, 'a', a_cheby1),
    struct('name', 'Chebyshev II', 'N', N_cheby2, 'attenuation', attenuation_stopband_cheby2, 'b', b_cheby2, 'a', a_cheby2),
    struct('name', 'Elliptic', 'N', N_ellip, 'attenuation', attenuation_stopband_ellip, 'b', b_ellip, 'a', a_ellip)
};

% Tabela de Comparação
fprintf('\nComparação entre os Filtros Projetados:\n');
fprintf('%-12s | Ordem | Atenuação (dB)\n', 'Filtro');
fprintf('------------------------------------\n');
for i = 1:length(filters)
    fprintf('%-12s | %-5d | %-14.2f\n', filters{i}.name, filters{i}.N, filters{i}.attenuation);
end

% Atrasos de Grupo
figure;
hold on;
for i = 1:length(filters)
    [H, omega] = freqz(filters{i}.b, filters{i}.a, 500);
    group_delay = -diff(unwrap(angle(H))) ./ diff(omega);
    plot(omega(2:end) / pi, group_delay, 'DisplayName', filters{i}.name, 'LineWidth', 1.5);
end
hold off;
xlabel('Frequência Normalizada (\omega / \pi)');
ylabel('Atraso de Grupo (Amostras)');
title('Atraso de Grupo Comparativo');
legend('Location', 'Best');
grid on;
% pause(10);
print("trab4/4-e)png", "-dpng");