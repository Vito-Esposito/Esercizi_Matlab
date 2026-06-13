function a = interp_costruisci_pol(x,y)
%
% Argomento:  Fitting - Interpolazione
%
% Interpolazione: solo costruzione
% Modello polinomiale: le funzioni base sono b_j(x) = x^(j-1).
%
% COSTRUZIONE 
% La function costruisce il polinomio interpolante di Lagrange 
% n punti (x_i,y_i), i=1,2,...,n. Determina i coefficienti a_j della somma 
%
%   p(x) = a_1 + a_2 x + .. .+ a_n x^(n-1)
%
% imponendo gli n vincoli p(x_i) = y_i, i=1,2,...,n,
% (condizioni di interpolazione di Lagrange).
%
% Input 
%
%   x           vettore colonna che contiene i nodi  x_i
%   y           vettore colonna che contiene i valori y_i
%
% Output 
%
%   a           vettore colonna che contiene i coefficienti a_j 
%
%  Esempio d'uso
%
%  rand('seed',100)
%  x = [-3:3]';
%  y = randi(20,size(x));
%  a = interp_costruisci_pol(x,y);
%  
b = @(x,j) x.^(j-1);
n = size(x,1);
B = zeros(n,n);
for k=1:n
B(:,k) = b(x,k);
end
a = Sgauss_pivot(B,y);
end