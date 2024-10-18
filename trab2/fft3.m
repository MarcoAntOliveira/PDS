addpath("funcoes/")

% Implementação de SAFFT em uma imagem utilizando a função safft2

% Ler a imagem
imagem = imread('trab2/eli.jpg'); % Substitua pelo nome do arquivo de imagem

% Converter a imagem para tons de cinza, se necessário
if size(imagem, 3) == 3
    imagem_cinza = rgb2gray(imagem);
else
    imagem_cinza = imagem;
end

% Definir o tamanho do bloco para o SAFFT
bloco_tamanho = 64;  % Tamanho do bloco adaptável

% Aplicar o SAFFT usando a função safft2
safft_resultado = safft2(imagem_cinza, bloco_tamanho);

% Centralizar o espectro de cada bloco
safft_resultado_shifted = fftshift(safft_resultado);

% Calcular a magnitude da SAFFT
magnitude_safft = log(1 + abs(safft_resultado_shifted));

% Mostrar a imagem original e a SAFFT
subplot(1, 2, 1);
imshow(imagem_cinza);
title('Imagem Original em Tons de Cinza');

subplot(1, 2, 2);
imshow(magnitude_safft, []);
title('Magnitude da SAFFT da Imagem');

pause(15);