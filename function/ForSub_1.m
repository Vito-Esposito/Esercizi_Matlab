function x=ForSub_1(L,b)
%
% Argomento:  algebra lineare numerica
% 
% Risoluzione di un sistema triangolare  inferiore di equazioni lineari
% con il metodo di sostituzione in avanti (forward substitution). 
% La matrice dei coefficienti L è  memorizzata in formato standard
% La matrice dei coefficienti ha tutti 1 sulla diagonale principale
%
% Input
% 
%  L               matrice quadrata n x n, triangolare inferiore non singolare
%  b                vettore colonna n x 1, termini noti
%
% Output
%
%   x               vettore colonna n x 1, soluzione 
%
% Esempio d'uso
%
%  L=[1 0 0; 5 1 0; 4 8 1]
%  b = [3 19 49]'
%  x = ForSub_1(L,b)
%
n = size(L,1);
x = zeros(size(b));
x(1) = b(1); 
for i = 2:n
  x(i) = b(i) - L(i,1:i-1)*x(1:i-1);
end
end