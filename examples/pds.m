n = [0:10]; x = (0.9).^n;
disp(x);
%função degrau
function[x, n] = impeseq(n0, n1, n2)
n = [n1:n2]; x = [(n-n0) == 0];


%soma de funções
function[y, n] = sigadd(x1, n1, x2, n2)
n = min(min(n1), min(n2)):max(max(n1), max(n2));
y1 = zeros(1, length(n)); y2 = y1;

y1((find(n>=min(n1))) & (n<=max(n1)) == 1) = x1;
y2((find(n>=min(n2))) & (n<=max(n2)) == 1) = x2;
y = y1 + y2;

%multiplicação de funções
function[y, n] = sigmult(x1, n1, x2, n2)
n = min(min(n1), min(n2)):max(max(n1), max(n2));
y1 = zeros(1, length(n)); y2 = y1;
y1((find(n>=min(n1))) & (n<=max(n1)) == 1) = x1;
y2((find(n>=min(n2))) & (n<=max(n2)) == 1) = x2;
y = y1.*y2;


%função para deslocamento
function[y, n] = sigshift(x, m, k)
n = m + k; y = x;

%função para inversão
function[y, n] = sigfold(x, n)
y = fliplr(x); n = -fliplr(n);








