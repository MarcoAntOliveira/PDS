addpath("funcoes/")
%1)
% w = [0:1:500]*pi/500;
% X = exp(j*w) ./(exp(j*w) - 0.5*ones(1, 501));

% 2)
% n = -1:3; x = 1:5; k =0 : 500; w = (pi/500)*k;
% X = x * (exp(-j*pi/500)).^ (n'* k); 

% 3)
% n = 0:10; x = (0.9*exp(j*pi/3)).^n;
% k = -200:200; w = (pi/100)*k;
% X = x*(exp(-j*pi/100)).^(n'*k); 

%3)

% n = -5:5; x = (-0.9).^n;
% k = -200:200;w = (pi/100)*k; X = x*(exp(-j*pi/100)).^(n'*k);





% magX = abs(X);angX = angle(X);realX = real(X);imagX = imag(X);

% subplot(2,2,1);plot(w/pi, magX); grid;
% xlabel("frequency in pi units"); title("Magnitude part");ylabel("Magnitude");

% subplot(2,2,2); plot(w/pi, angX); grid;
% xlabel("frequency in pi units"); title("Angle part");ylabel("Radians");

% subplot(2,2,3); plot(w/pi, realX); grid;
% xlabel("frequency in pi units"); title("Real part");ylabel("Real");

% subplot(2,2,4); plot(w/pi, imagX); grid;
% xlabel("frequency in pi units"); title("Imaginary part");ylabel("Imaginary");
% pause(45);

% magX = abs(X);angX = angle(X);

% subplot(2,1,1);plot(w/pi, magX); grid; axis([-2, 2, 0, 15]);
% xlabel("frequency  units of pi"); title("Magnitude part");ylabel("|x|");

% subplot(2,1,2); plot(w/pi, angX); grid;axis([-2, 2, -1, 1]);
% xlabel("frequency in pi units"); title("Angle part");ylabel("Radians/pi");pause(45);


% 4)

% x = rand(1, 11); n = 0:10;
% k = 0:500; w = (pi/500)*k;
% X = x*(exp(-j*pi/500)).^(n'*k); %DTFT of x  

% %signal shifted by two samples

% y = x; m = n + 2;
% Y = y*(exp(-j*pi/500)).^(m'*k); %DTFT of y

% Y_check = (exp(-j*2).^w).*X;
% error = max(abs(Y- Y_check))


%5) -> dando diferente do slides

% n = 0:100; x = cos(pi*n/2);
% k = -100:100; w = (pi/100)*k
% X = x*(exp(-j*pi/500)).^(n'*k); %DTFT of x  

% y = exp(j*pi*n/4).*x;
% Y = y*(exp(-j*pi/500)).^(n'*k); %DTFT of y

% magY = abs(Y);angY = angle(Y);realY = real(Y);imagY = imag(Y);

% subplot(2,2,1);plot(w/pi, magY); grid;
% xlabel("frequency in pi units"); title("Magnitude part");ylabel("Magnitude");

% subplot(2,2,2); plot(w/pi, angY); grid;
% xlabel("frequency in pi units"); title("Angle part");ylabel("Radians");

% subplot(2,2,3); plot(w/pi, realY); grid;
% xlabel("frequency in pi units"); title("Real part");ylabel("Real");

% subplot(2,2,4); plot(w/pi, imagY); grid;
% xlabel("frequency in pi units"); title("Imaginary part");ylabel("Imaginary");
% pause(45);


% 6)
% n = -5:10;
% x = rand(1, length(n)); % Sequência original
% k = -100:100;
% w = (pi/100)*k;

% % DTFT de x
% X = x*(exp(-1j*pi/500)).^(n'*k);  

% % Sequência invertida no tempo
% y = fliplr(x); 
% m = fliplr(n);

% % DTFT de y
% Y = y*(exp(-1j*pi/500)).^(m'*k); 

% % Verificação: O espectro de y deve ser a inversão do espectro de x com conjugação
% Y_check = conj(fliplr(X)); 

% % Cálculo do erro
% error = max(abs(Y - Y_check)); 

% disp(error) % Deve resultar em zero ou um valor muito pequeno

% 8)
n = -5:10; x = sin(pi*n/2);
k = -100:100; w = (pi/100)*k;
X = x*(exp(-1j*pi/500)).^(n'*k);  

[xe, xo, m] = evenodd(x, n);
Xe = xe*(exp(-1j*pi/500)).^(m'*k); Xo = xo*(exp(-1j*pi/500)).^(m'*k); 
%verification
XR = real(X);
error1 = max(abs(Xe-XR))
XI = imag(X);
error2 = max(abs(Xo - j*XI))
subplot(2,2,1);plot(w/pi, XR); grid;axis([-1, 1, -2, 2]);
xlabel("frequency in pi units"); title("Magnitude part");ylabel("Magnitude");

subplot(2,2,2); plot(w/pi, XI); grid;axis([-1, 1, -10, 10]);
xlabel("frequency in pi units"); title("Angle part");ylabel("Radians");

subplot(2,2,3); plot(w/pi, real(Xe)); grid;axis([-1, 1, -2, 2]);
xlabel("frequency in pi units"); title("Real part");ylabel("Real");

subplot(2,2,4); plot(w/pi, imag(Xo)); grid;axis([-1, 1, -10, 10]);
xlabel("frequency in pi units"); title("Imaginary part");ylabel("Imaginary");
pause(45);