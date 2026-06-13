function w = interpolazione_funzioni(x,f,z)
%
% Argomento:  Fitting - Interpolazione
%
% Versione standard: costruzione + valutazione
% Modello polinomiale: le funzioni base sono b_j(x) = x^(j-1).
%
% La function costruisce il polinomio p(x), di grado al più n-1, interpolante 
% n punti (x_i,f(x_i)), i=1,2,...,n,  (punti del grafico della funzione f(x)), e lo valuta 
% nei punti di valutazione z_i,  per i=1,2,...,N, ottenendo i valori corrispondenti 
% w_i = p(z_i), per i=1,2,...,N
% 
% Input 
%
%   x           vettore colonna che contiene gli n nodi  x_i
%   f            puntatore a funzione, f(x) è la funzione da interpolare
%   z           vettore colonna che contiene gli N valori z_i
%
% Output 
%
%   w           vettore colonna che contiene gli N valori w_i = p(z_i)
%
%  Esempio d'uso
%
%  rand('seed',100)
%  x = [-3:3]';
%  f = @(x) abs(x);
%  z = linspace(min(x),max(x),101)';
%  w = interpolazione_funzioni(x,f,z);
%  plot(x,f(x),'o',z,w,'-') 
y = f(x);
w = interpolazione_pol_standard(x,y,z);
end