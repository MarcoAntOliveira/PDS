function safft_signal = safft(x, window_size, overlap)
  % x: Sinal de entrada
  % window_size: Tamanho da janela (bloco)
  % overlap: Sobreposição entre janelas
  
  % Número de amostras no sinal
  N = length(x);
  
  % Definindo o deslocamento entre as janelas
  step_size = window_size - overlap;
  
  % Inicializando a matriz para armazenar as FFTs
  num_windows = ceil((N - window_size) / step_size) + 1;
  safft_signal = zeros(window_size, num_windows);
  
  % Processando cada janela
  for i = 1:num_windows
    % Definindo a posição inicial da janela
    start_idx = (i-1) * step_size + 1;
    end_idx = start_idx + window_size - 1;
    
    if end_idx > N
      % Se a janela exceder o comprimento do sinal, preencher com zeros
      windowed_signal = [x(start_idx:end); zeros(end_idx-N, 1)];
    else
      windowed_signal = x(start_idx:end_idx);
    end
    
    % Aplicar uma janela de ponderação (por exemplo, Hanning)
    windowed_signal = windowed_signal .* hanning(window_size);
    
    % Calcular a FFT da janela
    safft_signal(:, i) = fft(windowed_signal);
  end
  
  % O resultado safft_signal contém as FFTs locais de cada janela
end
