addpath("funcoes/")

% Implementação de FFT em uma imagem


% Ler a imagem
imagem = imread('trab2/eli.jpg'); % Substitua pelo nome do arquivo de imagem

% Converter a imagem para tons de cinza, se necessário
if size(imagem, 3) == 3
    imagem_cinza = rgb2gray(imagem);
else
    imagem_cinza = imagem;
end
n = 2^nextpow2(length(imagem_cinza));  % Próxima potência de 2
% Aplicar a FFT à imagem
F = fft2(imagem_cinza); % FFT 2D
F_recursive = fft_recursive(n);
F_shifted = fftshift(F); % Centralizar o espectro

% Calcular a magnitude da FFT
magnitude = log(1 + abs(F_shifted));
magnitude_fft_recursive = log(1 + abs(F_recursive));

% Mostrar a imagem original e a FFT
subplot(2, 2, 1);
imshow(imagem_cinza);
title('Imagem Original em Tons de Cinza');

subplot(2, 2, 2);
imshow(magnitude, []);
title('Magnitude da FFT da Imagem');

subplot(2, 2, 3);
imshow(magnitude_fft_recursive, []);
title('Magnitude da FFT recursiva da Imagem');

pause(15);
