function a = approx_costruisci_pol(x,y,m)
%
% Argomento:  Fitting - Approssimazione
%
% Approssimazione: solo costruzione
% Modello polinomiale: le funzioni base sono b_j(x) = x^(j-1),
%
% COSTRUZIONE 
% La function costruisce il polinomio di grado m-1 approssimante 
% n punti (x_i,y_i), i=1,2,...,n, ovvero determina i coefficienti a_j della somma 
%
%   p(x) = a_1 + a_2 x + .. .+ a_m x^(m-1)
%
% imponendo che sia minima la norma due del vettore dei residui
% 
%  r = (r_1,...,r_n),   con r_i = p(x_i) - y_i.
%
% Input 
%
%   x           vettore colonna che contiene i nodi  x_i
%   y           vettore colonna che contiene i valori y_i
%   m          intero, (m-1) è il grado del polinomio approssimante 
%
% Output 
%
%   a           vettore colonna che contiene i coefficienti a_j 
%
% Esempio d'uso
%
% x = 10*rand(30,1);
% y = cos(x) + 0.1*rand(size(x));
% m = 8;
% a = approx_costruisci_pol(x,y,m);
%  
% % per mostrare il grafico dell'approssimante, questo deve essere valutato
% z = linspace(min(x),max(x),101)';
% w = valuta_pol(a,z);
% plot(x,y,'o',z,w,'-')
b = @(x,j) x.^(j-1);
n = size(x,1);
B = zeros(n,m);
for k=1:m
B(:,k) = b(x,k);
end
a = Sgauss_pivot(B'*B,B'*y);
end