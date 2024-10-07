addpath("funcoes/")

%6 - b)

n = 0:10; x = 10*exp((-0.1 + j*0.2*pi)*n);
y1 = evenodd_complex(x, n);



subplot(2,1,1);stem(real(y1));;title('componentes real')
xlabel('n');ylabel('real(y(n))');axis([-10, 10, 0, 1.2])


subplot(2, 1, 2); stem(imag(y1));title('componentes imaginarias')
xlabel('n');ylabel('imag(y(n))');axis([-10, 10, 0, 1.2])
pause(10);

print("1_b).png", "-dpng");

