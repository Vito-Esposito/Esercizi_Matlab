function [A,b] = TriangGauss_pivot(A,b)
%
% Argomento:  algebra lineare numerica
% 
% Triangolarizzazione di Gauss in place, con tecnica del pivoting parziale,
% a parallelismo sui dati.  Determina il sistema Ux=y equivalente 
% al sistema dato  Ax=b. U è triangolare superiore ed è
% memorizzata nel triangolo superiore di A; y e  memorizzato in b.
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
for k=1:n-1
  % tecnica del pivoting parziale
  [pivot,r] = max(abs(A(k:n,k)));
  r = r+k-1; % posizione assoluta della riga che contiene il nuovo pivot
  if pivot == 0
   error('matrice singolare');
  else
  %scambio righe
   A([k  r],k:n)=A([r  k],k:n);
   b([k  r]) = b([r  k]);
  % eliminazione
   for i=k+1:n
     molt = A(i,k)/A(k,k);
     A(i,k+1:n) = A(i,k+1:n)-molt*A(k,k+1:n);
     b(i) = b(i)-molt*b(k);
   end
  end
end