addpath("funcoes/");

x = [3, 11, 7, 0, -1, 4, 2]; nx = [-3 : 3];
[y, ny] = sigshift(x, nx, 2);
w = randn(1, length(y)); nw = ny;
[y, ny] = sigadd(y, ny, w, nw);
[x, nx] = sigfold(x, nx);

[rxy,  nrxy] = conv_m(y, ny, x, nx);
subplot(1, 1, 1), subplot(2, 1, 1); stem(nrxy, rxy)
axis([-5, 10, -50, 250]); xlabel('lag variable l')
ylabel('rxy'); title('Crosscorrelation: noise sequence 1')
pause(60);