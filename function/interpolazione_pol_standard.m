function w = interpolazione_pol_standard(x,y,z)
%
% Argomento:  Fitting - Interpolazione
%
% Versione standard: costruzione + valutazione
% Modello polinomiale: le funzioni base sono b_j(x) = x^(j-1).
%
% La function costruisce il polinomio p(x), di grado al più n-1, interpolante 
% n punti (x_i,y_i), i=1,2,...,n, e lo valuta nei punti di valutazione z_i, 
% per i=1,2,...,N, ottenendo i valori corrispondenti w_i = p(z_i), per i=1,2,...,N
% 
% COSTRUZIONE 
% Determina i coefficienti a_j della somma 
%
%   p(x) = a_1 + a_2 x + .. .+ a_n x^(n-1)
%
% imponendo gli n vincoli p(x_i)=y_i, i=1,2,...,n,
% (condizioni di interpolazione di Lagrange).
%
% VALUTAZIONE  
% Note le funzioni base b_j(x), e i coefficienti a_j, valuta il 
% polinomio p(x) in z_i, ovvero valuta w_i = p(z_i) (i=1,2,...,N).
% 
% Input 
%
%   x           vettore colonna che contiene gli n nodi  x_i
%   y           vettore colonna che contiene gli n valori y_i
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
%  y = randi(20,size(x));
%  z = linspace(min(x),max(x),101)';
%  w = interpolazione_pol_standard(x,y,z);
%  plot(x,y,'o',z,w,'-') 
a = interp_costruisci_pol(x,y);   % Costruzione  
w = valuta_pol(a,z);                   % Valutazione  
end