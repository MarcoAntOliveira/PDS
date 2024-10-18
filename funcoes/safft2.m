function safft_image = safft2(image, block_size)
  % image: Imagem de entrada
  % block_size: Tamanho do bloco 2D
  
  % Dimensões da imagem
  [rows, cols] = size(image);
  
  % Inicializando a matriz para armazenar as FFTs locais
  safft_image = zeros(rows, cols);
  
  % Processando cada bloco 2D
  for i = 1:block_size:rows
    for j = 1:block_size:cols
      % Definir os limites do bloco
      row_end = min(i + block_size - 1, rows);
      col_end = min(j + block_size - 1, cols);
      
      % Extrair o bloco
      block = image(i:row_end, j:col_end);
      
      % Aplicar a FFT 2D ao bloco
      fft_block = fft2(block);
      
      % Armazenar a FFT do bloco na posição correspondente da imagem
      safft_image(i:row_end, j:col_end) = fft_block;
    end
  end
  
  % O resultado safft_image contém as FFTs locais de cada bloco da imagem
end
