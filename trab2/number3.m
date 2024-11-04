

% Implementação de SAFFT em uma imagem utilizando a função safft2

imagem = imread('trab2/lena_std(1).tif');  % Substitua pelo nome do arquivo de imagem
[n_linhas, n_colunas, n_canais] = size(imagem);
% imshow(imagem); 

% % Verifica se a imagem é colorida (3 canais) ou em escala de cinza (1 canal)
% if n_canais == 1
%     disp('1');
%     imshow(imagem);  % Imagem em escala de cinza
% elseif n_canais == 3
%     disp('3');
%     canal = 3;  % Exibir o canal vermelho, por exemplo
%     imshow(imagem(:,:,canal));  % Exibe o canal especificado 
%     print("trab2/2.3_b)-3.png", "-dpng");
    

%     canal = 2;
%     imshow(imagem(:,:,canal));  % Exibe o canal especificado 
%     print("trab2/2.3_b)-2.png", "-dpng");
    
%     canal = 1;
%     imshow(imagem(:,:,canal));  % Exibe o canal especificado 
%     print("trab2/2.3_b)-1.png", "-dpng");
% else
%     disp('Imagem com número inesperado de canais');
% end


% % Converter a imagem para tons de cinza, se necessário
if size(imagem, 3) == 3
    imagem_cinza = rgb2gray(imagem);
else
    imagem_cinza = imagem;
end

% % Definir o tamanho do bloco para o SAFFT
bloco_tamanho = 1024;  % Tamanho do bloco adaptável

% % % Aplicar o SAFFT usando a função safft2
% safft_resultado = safft2(imagem_cinza, bloco_tamanho);

% % % Centralizar o espectro de cada bloco
% safft_resultado_shifted = fftshift(safft_resultado);

fft_resultado = fft2(imagem_cinza);
fft_resultado_shifted = fftshift(fft_resultado);

% % Calcular a magnitude e fase
% magnitude_fft = abs(fft_resultado_shifted);
% fase_fft = angle(fft_resultado_shifted);
% % Calcular a magnitude da SAFFT
magnitude_safft = log(1 + abs(fft_resultado_shifted));
angle_safft = angle(fft_resultado_shifted);

% Limitar a fase ao intervalo [-pi, pi] para visualização
fase_fft = mod(angle_safft + pi, 2 * pi) - pi;


% Calcular a FFT bidimensional e centralizar o espectro

% Mostrar a imagem original e a SAFFT
% figure;
% subplot(2, 2, 2);
% imshow(abs(fft_resultado), []);
% title('Magnitude da SAFFT da Imagem');

% subplot(3, 2, 2);
% imshow(angle(safft_resultado));
% % title('Magnitude da SAFFT da Imagem');


% subplot(2, 2, 1);
% imshow(imagem_cinza);
% title('Imagem Original em Tons de Cinza');


% subplot(2, 2, 3);
% imshow(magnitude_safft, []);
% title('Magnitude da SAFFT da Imagem');

% subplot(2, 2, 2);
% imshow(angle_safft);
% title('Fase da SAFFT da Imagem');

% subplot(2, 2, 4);
% mesh(magnitude_safft);
% title('Magnitude com mesh da SAFFT da Imagem');

% % f. Agora, aplique a FFT Inversa bidimensional considerando a fase uniforme
% % (fase linear) e mantendo a magnitude. Ou seja, você irá realizar primeiro a FFT
% % inversa usando apenas a magnitude (faça o shift inversor aqui também,
% % ifftshift). Depois faça a inversa apenas da fase (aqui faça a inversa de
% % exp(i*Fase)). Plote os resultados. O que você pode concluir com esse
% % resultado?
% Calcular a magnitude e a fase da FFT
% Calcular a magnitude e a fase da FFT
magnitude = abs(fft_resultado_shifted);
fase = angle(fft_resultado_shifted);

% Reconstruir a imagem usando apenas a magnitude (com fase uniforme)
fase_uniforme = zeros(size(fase));  % fase uniforme = 0
F_mag_only = magnitude .* exp(1i * fase_uniforme);
F_mag_only_shifted = ifftshift(F_mag_only);  % shift inverso
imagem_mag_only = real(ifft2(F_mag_only_shifted));  % FFT inversa

% Reconstruir a imagem usando apenas a fase (com magnitude uniforme)
magnitude_uniforme = ones(size(magnitude));  % magnitude uniforme = 1
F_fase_only = magnitude_uniforme .* exp(1i * fase);
F_fase_only_shifted = ifftshift(F_fase_only);  % shift inverso
imagem_fase_only = real(ifft2(F_fase_only_shifted));  % FFT inversa

% Exibir a imagem reconstruída com apenas magnitude e apenas fase
figure;
subplot(1, 2, 1);
imshow(imagem_mag_only, []);
title('Imagem Reconstruída (Apenas Magnitude)');

subplot(1, 2, 2);
imshow(imagem_fase_only, []);
title('Imagem Reconstruída (Apenas Fase)');
% pause(10)
print("trab2/2.3_f).png", "-dpng");