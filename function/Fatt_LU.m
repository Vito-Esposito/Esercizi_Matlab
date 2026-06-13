function A = Fatt_LU(A)
%
% Argomento:  algebra lineare numerica
% 
% Fattorizzazione A=LU in place, senza pivoting parziale,
% a parallelismo sui dati.
%
% Input
%
%  A         matrice quadrata n x n, non singolare
%
% Output
%
%  A         matrice quadrata n x n, il triangolo superiore di A contiene la matrice U         
%             il triangolo inferiore di A, esclusa la diagonale principale, contiene la matrice L        
%
% Esempio d'uso
%
% A = [8 4 16; 2 10 6;  4 20 13];
% A = Fatt_LU(A)
n = size(A,1);
for k=1:n-1
%  calcolo moltiplicatori passo k
   A(k+1:n,k) = A(k+1:n,k) / A(k,k);
%  aggiornamento porzione attiva 
   A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - A(k+1:n,k)*A(k,k+1:n);
end