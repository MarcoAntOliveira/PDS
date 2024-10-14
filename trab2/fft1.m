% Implementação de FFT em uma imagem

% Ler a imagem
imagem = imread('eli.jpg'); % Substitua pelo nome do arquivo de imagem

% Converter a imagem para tons de cinza, se necessário
if size(imagem, 3) == 3
    imagem_cinza = rgb2gray(imagem);
else
    imagem_cinza = imagem;
end

% Aplicar a FFT à imagem
F = fft2(imagem_cinza); % FFT 2D
F_shifted = fftshift(F); % Centralizar o espectro

% Calcular a magnitude da FFT
magnitude = log(1 + abs(F_shifted));

% Mostrar a imagem original e a FFT
subplot(1, 2, 1);
imshow(imagem_cinza);
title('Imagem Original em Tons de Cinza');

subplot(1, 2, 2);
imshow(magnitude, []);
title('Magnitude da FFT da Imagem');
pause(15);