function [A,b] = TriangGauss(A,b)
%
% Argomento:  algebra lineare numerica
% 
% Triangolarizzazione di Gauss in place. Determina il sistema Ux=y 
% equivalente al sistema dato  Ax=b. U è triangolare superiore.
%
% Input
%
%  A               matrice quadrata n x n, non singolare
%  b               vettore colonna n x 1, termini noti
%
% Output
%
%  A                matrice quadrata n x n, il triangolo superiore di A contiene 
%                    la matrice U, il triangolo inferiore sotto la diagonale principale
%                    contiene i moltiplicatori 
%  b                vettore colonna n x 1, termini noti, b contiene y
%
% Esempio d'uso
%
% A = [8 4 16; 2 10 6;  4 20 13];
% b = [4 12 16]';
% [A,b] = TriangGauss(A,b) 
%
n = size(A,1);
for k = 1:n-1
  for i = k+1:n
    A(i,k) = A(i,k) / A(k,k);
     for j = k+1:n
      A(i,j) = A(i,j) - A(i,k)*A(k,j);
    end
    b(i) = b(i) - A(i,k)*b(k);
  end
end
end





