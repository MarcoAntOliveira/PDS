% Projete um filtro digital passa-baixa FIR com as
% seguintes especificações:
% 𝜔 𝑝 = 0.2𝜋,
% 𝑅 𝑝 = 0.25𝑑𝐵
% 𝜔 𝑠 = 0.3𝜋,
% 𝐴 𝑠 = 50𝑑𝐵
% Escolha uma função de janela (na Tabela da Aula
% Teórica 10 – Filtros FIR) apropriada para as
% especificações acima. Determine a resposta ao impulso
% e forneça um gráfico da resposta em frequência do filtro
% projetado.

wp = 0.2*pi;
ws = 0.3*pi;
tr_width = ws - wp; % Calculando o Delta omega
M = ceil(6.6*pi/tr_width) + 1
M = 67
n=[0:1:M-1];
wc = (ws+wp)/2, % Ideal LPF cutoff frequency
hd = ideal_lp(wc,M);
w_ham = (hamming(M))';
h = hd .* w_ham;
[db,mag,pha,grd,w] = freqz_m(h,[1]);
delta_w = 2*pi/1000;
Rp = -(min(db(1:1:wp/delta_w+1))) % Actual Passband Ripple
As = -round(max(db(ws/delta_w+1:1:501))) % Min Stopband attenuation
subplot(2,2,1); stem(n,hd); title('Resposta ao Impulso Ideal')
axis([0 M-1 -0.1 0.3]); xlabel('n'); ylabel('hd(n)')
subplot(2,2,2); stem(n,w_ham);title('Janela Hamming')
axis([0 M-1 0 1.1]); xlabel('n'); ylabel('w(n)')
subplot(2,2,3); stem(n,h);title('Resposta ao Impulso Atual')
axis([0 M-1 -0.1 0.3]); xlabel('n'); ylabel('h(n)')
subplot(2,2,4); plot(w/pi,db);title('Resposta em Magnitude em dB');
grid axis([0 1 -100 10]); xlabel('frequencia (\pi)'); ylabel('Decibeis');