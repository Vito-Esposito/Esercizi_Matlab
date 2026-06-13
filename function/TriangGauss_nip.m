function [U,y] = TriangGauss_nip(A,b)
%
% Argomento:  algebra lineare numerica
% 
% Triangolarizzazione di Gauss non in place. Determina il sistema Ux=y 
% equivalente al sistema dato  Ax=b. U è triangolare superiore.
%
% Input
%
%  A               matrice quadrata n x n, non singolare
%  b               vettore colonna n x 1, termini noti
%
% Output
%
% U                matrice quadrata n x n, triangolare superiore non singolare
% y                 vettore colonna n x 1, termini noti
%
% Esempio d'uso
%
% A = [ 8 4 16; 2 10 6;  4 20 13];
% b = [4 12 16]';
% [U,y] = TriangGauss_nip(A,b)
%
n = size(A,1);
for k = 1:n-1
  for i = k+1:n
    molt = A(i,k) / A(k,k);
    A(i,k) = 0;   % azzeramento esplicito
    for j = k+1:n
      A(i,j) = A(i,j) - molt*A(k,j);
    end
    b(i) = b(i)- molt*b(k);
  end
end
U = A; y = b;
end