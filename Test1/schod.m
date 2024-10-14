% Constantes físicas
hbar = 1.0;    % Constante de Planck reduzida
m = 1.0;       % Massa da partícula

% Parâmetros da malha
Nx = 512;      % Número de pontos no espaço
Lx = 10.0;     % Tamanho da região espacial
dx = Lx / Nx;  % Resolução espacial
x = linspace(-Lx/2, Lx/2, Nx);  % Vetor de posição

dt = 0.01;     % Passo de tempo
Nt = 100;      % Número de passos de tempo

% Vetor de número de onda (para FFT)
k = (2*pi/Lx) * [0:(Nx/2-1) -Nx/2:-1];

% Função de onda inicial (um pacote de ondas gaussiano)
x0 = 0;    % Posição inicial
sigma = 0.5;  % Largura do pacote de ondas
k0 = 5.0;  % Número de onda inicial

psi = exp(-(x - x0).^2 / (2*sigma^2)) .* exp(1i * k0 * x);
psi = psi / norm(psi);  % Normalizar a função de onda

% Loop temporal para evolução
for t = 1:Nt
    % FFT para o domínio da frequência (k)
    psi_k = fftshift(fft(psi));
    
    % Resolver no domínio de k (evolução temporal no espaço de Fourier)
    psi_k = psi_k .* exp(-1i * (hbar * k.^2 / (2*m)) * dt);
    
    % Voltar ao espaço de posição
    psi = ifft(ifftshift(psi_k));
    
    % (Opcional) plotar a densidade de probabilidade |psi|^2
    if mod(t, 10) == 0
        plot(x, abs(psi).^2);
        title(['t = ', num2str(t*dt)]);
        xlabel('x');
        ylabel('|\psi(x,t)|^2');
        drawnow;
    end
    pause(15)
end