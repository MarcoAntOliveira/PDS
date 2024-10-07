addpath("funcoes/")
% 7 - a)

% Definindo os parâmetros
T_total = 1; % Duração do sinal (1 segundo)
frequencia_sinal = 20; % Frequência do sinal analógico cos(20*pi*t)

% Valores de Ts
Ts_values = [0.01, 0.05, 0.1];

% Definindo o sinal analógico
t_analogico = linspace(0, T_total, 1000); % Intervalo contínuo para x_a(t)
xa = cos(2 * pi * frequencia_sinal * t_analogico); % Sinal analógico

% Plotar os gráficos
figure;
for i = 1:length(Ts_values)
    Ts = Ts_values(i);
    n = 0:Ts:T_total; % Índices de amostragem
    x_n = cos(2 * pi * frequencia_sinal * n); % Sinal amostrado
    
    subplot(3, 1, i);
    plot(t_analogico, xa, 'b-', 'DisplayName', 'Sinal Analógico');
    hold on;
    stem(n, x_n, 'r', 'DisplayName', sprintf('Amostrado com Ts = %.2f', Ts));
    xlabel('Tempo (s)');
    ylabel('Amplitude');
    title(sprintf('Sinal amostrado com T_s = %.2f', Ts));
    legend;
    grid on;
    pause(45)
end
print("11.a.png", "-dpng");


% 7 - b)
% Reconstrução do sinal usando interpolação sinc
% T_total = 1; % Duração do sinal (1 segundo)
dt = 0.001; % Intervalo pequeno para interpolação
t_reconstruido = 0:dt:T_total; % Novo intervalo de tempo contínuo
% Ts_values = [0.01, 0.05, 0.1];

figure;
for i = 1:length(Ts_values)
    Ts = Ts_values(i);
    n = 0:Ts:T_total;
    x_n = cos(2 * pi * frequencia_sinal * n);
    
    % Reconstrução usando sinc
    xa_reconstruido = zeros(size(t_reconstruido));
    for k = 1:length(n)
        xa_reconstruido = xa_reconstruido + x_n(k) * sinc((t_reconstruido - n(k)) / Ts);
    end
    
    subplot(3, 1, i);
    plot(t_reconstruido, xa_reconstruido, 'g', 'DisplayName', 'Reconstruído (Sinc)');
    hold on;
    plot(t_analogico, xa, 'b--', 'DisplayName', 'Sinal Analógico');
    xlabel('Tempo (s)');
    ylabel('Amplitude');
    title(sprintf('Reconstrução com Interpolação Sinc (T_s = %.2f)', Ts));
    legend;
    grid on;
end
print("11.b.png", "-dpng");
pause(45)

% 7 - c)

% Reconstrução do sinal usando interpolação spline cúbica
figure;
for i = 1:length(Ts_values)
    Ts = Ts_values(i);
    n = 0:Ts:T_total;
    x_n = cos(2 * pi * frequencia_sinal * n);
    
    % Reconstrução usando spline cúbica
    xa_reconstruido_spline = interp1(n, x_n, t_reconstruido, 'spline');
    
    subplot(3, 1, i);
    plot(t_reconstruido, xa_reconstruido_spline, 'r', 'DisplayName', 'Reconstruído (Spline)');
    hold on;
    plot(t_analogico, xa, 'b--', 'DisplayName', 'Sinal Analógico');
    xlabel('Tempo (s)');
    ylabel('Amplitude');
    title(sprintf('Reconstrução com Interpolação Spline (T_s = %.2f)', Ts));
    legend;
    grid on;
    print("11.c.png", "-dpng");
end
