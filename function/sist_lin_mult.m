function X = sist_lin_mult(A,B)
%
% Argomento:  algebra lineare numerica
% 
% Risoluzione di un sistema di equazioni lineari multiplo AX=B con 
%  (i) calcolo preliminare della fattorizzazione PA=LU (una sola volta)
%  (ii) risoluzione dei sistemi triangolari 
%           L y = B(ipiv,j));  
%           U X(:,j) = y
%       per ogni colonna j-esima di B
%
% Input
%
%  A               matrice quadrata n x n, non singolare
%  B               matrice rettangolare n x m, termini noti
%
% Output
%
%  X               matrice rettangolare n x m, soluzioni
%
% Esempio d'uso
%
% A=[3 2 1; 4 3 2; 5 4 2];
% rand('seed',100)
% B=randi([2,12],3,5);
% X = sist_lin_mult(A,B)
%
[L,U,ipiv] = Fatt_LU_piv(A);
m = size(B,2);
X = zeros(size(B));
for j=1:m
y = ForSub_1(L,B(ipiv,j)); % ForSub
X(:,j) = BackSub(U,y); % BackSub
end
end
