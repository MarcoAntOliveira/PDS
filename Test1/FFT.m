%addpath("funcoes/")
Nmax = 2048; fft_time = zeros(1, Nmax);
for n = 1:1:Nmax;
    x = rand(1, n);
    t = clock;fft(x);fft_time(n) = etime(clock, t);
end

n = [1:1:Nmax]
plot(n, fft_time, '.');
xlabel('N');ylabel('Time in Sec.')
title('FFT execution times')
pause(45)