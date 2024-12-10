% 9. Repita o procedimento anterior (mostrar o espectro unilateral com janelas Retangular
% e Hanning) utilizando outras combinações de comprimento de sinal (L) e
% comprimento da DFT (N). Observe que ao modificar o valor, o vetor do eixo de
% frequências deve ser modificado.
% a. L=512 e N=2048
% b. L=2048 e N=2048
% c. L=2048 e N=4096
% d. L=4096 e N=4096
% e. L=4096 e N=8192
% Carregar os dados
% load lampcomp;

% % Parâmetros
% L = 512; % Tamanho do sinal
% N = 512; % Tamanho da FFT (potência de 2)
% fs = 5000; % Taxa de amostragem em Hz

% % Verificação dos dados
% if exist('vcomp', 'var') == 0
%     error('A variável vcomp não foi encontrada. Certifique-se de carregar os dados corretamente.');
% end

% % Aplicação da Janela Retangular
% v1r = vcomp(1:L) .* ones(L, 1);

% % Cálculo da FFT
% spectrum = fft(v1r, N);

% % Magnitude e conversão para dB
% magnitude = abs(spectrum);
% magnitude_dB = 20 * log10(magnitude / max(magnitude));

% % Extração do espectro unilateral
% magnitude_dB_unilateral = magnitude_dB(1:N/2+1);
% frequencies = (0:N/2) * (fs / N); % Vetor de frequências

% % Plotagem do gráfico
% plot(frequencies, magnitude_dB_unilateral, 'b', 'LineWidth', 1.5);
% title('Espectro de Magnitude em dB (Unilateral)');
% xlabel('Frequência (Hz)');
% ylabel('Magnitude (dB)');
% grid on;
% % pause(10);

% print("9.png", "-dpng");

% Carregar os dado


% Carregar os dados
load lampcomp;

% Parâmetros
L = 512; % Tamanho do sinal
N = 512; % Tamanho da FFT
fs = 5000; % Taxa de amostragem em Hz

% Verificação dos dados
if exist('icomp', 'var') == 0
    error('A variável icomp não foi encontrada. Certifique-se de carregar os dados corretamente.');
end

% Aplicação da Janela Retangular
i1r = icomp(1:L) .* ones(L, 1); % Janela retangular (substituir por hanning(L) para janela de Hanning)

% Cálculo da FFT
spectrum = fft(i1r, N);

% Magnitude e conversão para dB
magnitude = abs(spectrum);
magnitude_dB = 20 * log10(magnitude / max(magnitude));

% Extração do espectro unilateral
magnitude_dB_unilateral = magnitude_dB(1:N/2+1);
frequencies = (0:N/2) * (fs / N); % Vetor de frequências

% Plotagem do gráfico
plot(frequencies, magnitude_dB_unilateral, 'r', 'LineWidth', 1.5);
title('Espectro de Magnitude em dB (Sinal de Corrente - Unilateral)');
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');
grid on;
% pause(10);
print("10.png", "-dpng");