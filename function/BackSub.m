function x = BackSub(U,b)
%
% Argomento:  algebra lineare numerica
% 
% Risoluzione di un sistema triangolare superiore di equazioni lineari
% con il metodo di sostituzione all'indietro (backward substitution). 
% La matrice dei coefficienti U è  memorizzata in formato standard
%
% Input
% 
%  U               matrice quadrata n x n, triangolare superiore non singolare
%  b                vettore colonna n x 1, termini noti
%
% Output
%
%   x               vettore colonna n x 1, soluzione 
%
% Esempio d'uso
%
%  U = [2 1 -1; 0 3 1; 0 0 2] 
%  b = [9 25 14]'
%  x = BackSub(U,b)
%
n = size(U,1);
x = zeros(size(b));
x(n) = b(n) / U(n,n); 
for i=n-1:-1:1
  x(i) = (b(i) - U(i,i+1:n)*x(i+1:n)) / U(i,i);
end