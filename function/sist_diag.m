function x = sist_diag(D,b)
%
% Argomento:  algebra lineare numerica
% 
% Risoluzione di un sistema diagonale di equazioni lineari
% La matrice dei coefficienti D e  una matrice diagonale
%
% Input
%
%  D               matrice quadrata n x n, diagonale non singolare
%  b                vettore colonna n x 1, termini noti
%
% Output
%
%   x               vettore colonna n x 1, soluzione 
%
% Esempio d'uso
%
%  D = diag([3 5 7]) 
%  b = [9 25 14]'
%  x = sist_diag(D,b)
%
n=size(D,1);
x=zeros(size(b));
if prod(diag(D))==0
   error('matrice singolare');
 else
for i=1:n
  x(i)=b(i)/D(i,i);
end
end