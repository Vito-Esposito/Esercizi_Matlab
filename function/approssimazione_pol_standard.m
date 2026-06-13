function w = approssimazione_pol_standard(x,y,m,z)
%
% Argomento:  Fitting - Approssimazione
%
% Versione standard: costruzione + valutazione
% Modello polinomiale: le funzioni base sono b_j(x) = x^(j-1),
%
% La function costruisce polinomio p(x), di grado m-1, approssimante n punti 
% (x_i,y_i), i=1,2,...,n, e lo valuta nei punti di valutazione z_i, per i=1,2,...,N, 
% ottenendo i valori corrispondenti w_i = p(z_i), per i=1,2,...,N
% 
% COSTRUZIONE
% Determina i coefficienti a_j della somma 
%
%   p(x) = a_1 + a_2 x + .. .+ a_m x^(m-1)
%
% imponendo che sia minima la norma due del vettore dei residui
% 
%  r = (r_1,...,r_n),   con r_i = p(x_i) - y_i.
%
% VALUTAZIONE
% Note le funzioni base b_j(x), e i coefficienti a_j, 
% valuta il polinomio p(x) in z_i, ovvero valuta w_i = p(z_i) (i=1,2,...,N)
% 
% Input 
%
%   x           vettore colonna che contiene gli n nodi  x_i
%   y           vettore colonna che contiene gli n valori y_i
%   m          intero, (m-1) è il grado del polinomio approssimante 
%   z           vettore colonna che contiene gli N valori z_i
%
% Output 
%
%   w           vettore colonna che contiene gli N valori w_i=p(z_i)
%
%  Esempio d'uso
%
% x = 10*rand(30,1);
% y = cos(x)+0.1*rand(size(x));
% m = 8;
% z = linspace(min(x),max(x),101)';
% w = approssimazione_pol_standard(x,y,m,z);
% plot(x,y,'o',z,w,'-')
a = approx_costruisci_pol(x,y,m);   % Costruzione  
w = valuta_pol(a,z);                         % Valutazione  
end