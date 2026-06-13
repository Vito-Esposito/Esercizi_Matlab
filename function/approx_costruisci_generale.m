function a = approx_costruisci_generale(x,y,b,m)
%
% Argomento:  Fitting - Approssimazione
%
% Approssimazione: solo costruzione
% Modello generale: funzioni base scelte dall'utente
%
% COSTRUZIONE 
% La function costruisce la funzione approssimante n punti 
% (x_i,y_i), i=1,2,...,n, ovvero determina i coefficienti a_j della somma 
%
%   p(x) = a_1 b_1(x) + a_2 b_2(x) + ... + a_m b_m(x),
%
% dove le m funzioni base b_j(x) sono assegnate, 
% imponendo che sia minima la norma due del vettore dei residui
% 
%  r = (r_1,...,r_n) con r_i = p(x_i) - y_i.
%
% Input 
%
%   x           vettore colonna che contiene i nodi  x_i
%   y           vettore colonna che contiene i valori y_i
%   b           puntatore a funzione, b(x,j) coincide con b_j(x)
%   m          intero, numero di funzioni base 
%
% Output 
%
%   a           vettore colonna che contiene i coefficienti a_j
%
% Esempio d'uso
%
% rand('seed',100)
% x = 10*rand(30,1);
% y = cos(x) + 0.2*rand(size(x));
% b = @(x,j) cos((j-1)*x);
% m = 5;
% a = approx_costruisci_generale(x,y,b,m);
%  
% % per mostrare il grafico dell'approssimante, questo deve essere valutato
% z = linspace(min(x),max(x),101)';
% w = valuta_generale(a,b,z);
% plot(x,y,'o',z,w,'-')
%
n = size(x,1);
B = zeros(n,m);
for k=1:m
B(:,k) = b(x,k);
end
a = Sgauss_pivot(B'*B,B'*y);
end