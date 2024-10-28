addpath("funcoes/")
pkg load communications
pkg load image
% g. Em um novo script (exemplo: Q3.3), faça novamente o procedimento para
% obter a magnitude e a fase da imagem em escala de cinzas. Porém, agora você
% deverá gerar um ruído branco (use a função wgn) com uma potência de 90
% dBW. O sinal ruído branco deve ter as mesmas dimensões da imagem.
% Implementação de SAFFT em uma imagem utilizando a função safft2


% h. Aplique o ruído branco e realize a inversa da FFT bidimensional e não esqueça
% de incluir a fase nesse processo (Magnitude.*exp(i*Fase))+ ruído.

imagem = imread('trab2/lena_std(1).tif');  % Substitua pelo nome do arquivo de imagem
[n_linhas, n_colunas, n_canais] = size(imagem);

% Verifica se a imagem é colorida (3 canais) ou em escala de cinza (1 canal)
if n_canais == 1
    imshow(imagem);  % Imagem em escala de cinza
elseif n_canais == 3
    n = 3;  % Canal azul, por exemplo
    imshow(imagem(:,:,n));  % Exibe o canal especificado
else
    disp('Imagem com número inesperado de canais');
end


% Converter a imagem para tons de cinza, se necessário
if size(imagem, 3) == 3
    imagem_cinza = rgb2gray(imagem);
else
    imagem_cinza = imagem;
end

% Definir o tamanho do bloco para o SAFFT
bloco_tamanho = 1024;  % Tamanho do bloco adaptável

% Aplicar o SAFFT usando a função safft2
safft_resultado = safft2(imagem_cinza, bloco_tamanho);

% Centralizar o espectro de cada bloco
safft_resultado_shifted = fftshift(safft_resultado);

% Calcular a magnitude da SAFFT
magnitude_safft = log(1 + abs(safft_resultado_shifted));
angle_safft = angle(safft_resultado_shifted);
% Gerar ruído branco com potência de 90 dBW
ruido_branco = wgn(n_linhas, n_colunas, 90, 'linear');

% Adicionar o ruído à magnitude da SAFFT
imagem_ruido_branco = magnitude_safft.* exp(1i * angle_safft) + ruido_branco;
imagem_ruido_branco_shifted = ifftshift(imagem_ruido_branco);  % Shift inverso
imagem_rec_ruido_branco = real(ifft2(imagem_ruido_branco_shifted));  % FFT inversa

figure;
subplot(3, 2, 1);
imshow(imagem_cinza);
title('Imagem Original em Tons de Cinza');

subplot(3, 2, 2);
imshow(imagem_rec_ruido_branco, []);
title('Imagem com Ruído Branco Gaussiano');




% i. Repita o processo, agora adicionando o ruído tipo “salt & pepper” com uma
% densidade de 0.2 diretamente a imagem em escala de cinzas.;
% Adicionar ruído "salt & pepper" com densidade 0.2
imagem_salt_pepper = imnoise(imagem_cinza, 'salt & pepper', 0.2);


subplot(3, 2, 3);
imshow(imagem_salt_pepper);
title('Imagem com Ruído Salt & Pepper');

% j. Crie outra imagem incluindo outro ruído, agora o ruído tipo “speckle”
% diretamente a imagem em escala de cinzas. Você pode usar a função;
% Adicionar ruído "speckle"
imagem_speckle = imnoise(imagem_cinza, 'speckle');



subplot(3, 2, 4);
imshow(imagem_speckle);
title('Imagem com Ruído Speckle');
pause(10);