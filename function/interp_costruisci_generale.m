function a = interp_costruisci_generale(x,y,b)
%
% Argomento:  Fitting - Interpolazione
%
% Interpolazione: solo costruzione
% Modello generale: funzioni base scelte dall'utente
%
% COSTRUZIONE 
% La function costruisce la funzione interpolante di Lagrange n punti 
% (x_i,y_i), i=1,2,...,n. Determina i coefficienti a_j della somma 
%
%    p(x) = a_1 b_1(x) + a_2 b_2(x) + ... + a_n b_n(x),
%
% dove le funzioni base b_j(x) sono assegnate, imponendo gli 
% n vincoli p(x_i) = y_i  (condizioni di interpolazione di Lagrange). 
%
% Input 
%
%   x           vettore colonna che contiene i nodi  x_i
%   y           vettore colonna che contiene i valori y_i
%   b           puntatore a funzione, b(x,j) coincide con b_j(x)
%
% Output 
%
%   a           vettore colonna che contiene i coefficienti a_j 
%
%  Esempio d'uso
%
%  rand('seed',100)
%  x = [0:7]';
%  y = randi(20,size(x));
%  b = @(x,j) cos((j-1)*x);
%  a = interp_costruisci_generale(x,y,b);
n = size(x,1);
B = zeros(n,n);
for k=1:n
B(:,k) = b(x,k);
end
a = Sgauss_pivot(B,y);
end


