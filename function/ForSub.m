function x = ForSub(L,b)
%
% Argomento:  algebra lineare numerica
% 
% Risoluzione di un sistema triangolare  inferiore di equazioni lineari
% con il metodo di sostituzione in avanti (forward substitution). 
% La matrice dei coefficienti L è  memorizzata in formato standard
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
%  L = [2 0 0; 1 3 0; -1 1 2] 
%  b = [14 25 9]'
%  x = ForSub(L,b)
%
n = size(L,1);
x = zeros(size(b));
x(1) = b(1) / L(1,1); 
for i = 2:n
  x(i) = (b(i) - L(i,1:i-1)*x(1:i-1)) / L(i,i);
end
end