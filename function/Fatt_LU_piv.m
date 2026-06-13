function [L,U,ipiv] = Fatt_LU_piv(A)
%
% Argomento:  algebra lineare numerica
% 
% Fattorizzazione  P*A=L*U non in place, con pivoting parziale,
% a parallelismo sui dati.  P e  la matrice delle permutazioni,
% memorizzate mediante un array 1D di indici puntatori ipiv
%
% Input
%
%  A         matrice quadrata n x n, non singolare
%
% output:
%
%  L         matrice quadrata n x n, triangolare inferiore 
%  U        matrice quadrata n x n, triangolare superiore 
%   ipiv    vettore colonna che memorizza gli scambi di righe
%
% Input
%
%  A = [2 15 46; 24 36 48; 2 19 28];
% [L,U,ipiv] = Fatt_LU_piv(A)
%
n = size(A,1); ipiv = 1:n;
for k = 1:n-1
  % pivoting parziale
  [pivot,r] = max(abs(A(k:n,k)));
  r = r + k -1; % spiazzamento
  if pivot == 0
   error('matrice singolare');
  else
  % scambio righe, si scambiano anche i moltiplicatori
   A([k  r],:) = A([r  k],:);
   ipiv([k  r]) = ipiv([r  k]);
  % eliminazione
   A(k+1:n,k) = A(k+1:n,k) / A(k,k);
   A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - A(k+1:n,k)*A(k,k+1:n);
  end
end
L = eye(n,n)+tril(A,-1);
U = triu(A);
end
  