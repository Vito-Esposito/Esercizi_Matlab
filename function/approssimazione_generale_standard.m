function w = approssimazione_generale_standard(x,y,b,m,z)
%
% Argomento:  Fitting - Approssimazione
%
% Versione standard: costruzione + valutazione
% Modello generale: funzioni base scelte dall'utente
%
% La function costruisce la funzione p(x), approssimante n punti (x_i,y_i), 
% i=1,2,...,n, e la valuta nei punti di valutazione z_i, per i=1,2,...,N, 
% ottenendo i valori corrispondenti w_i = p(z_i), per i=1,2,...,N
% 
% COSTRUZIONE 
% Determina i coefficienti a_j della somma 
%
%   p(x) = a_1 b_1(x) + a_2 b_2(x) + ... + a_m b_m(x)
%
% dove le m funzioni base b_j(x) sono assegnate, 
% imponendo che sia minima la norma due del vettore dei residui
% 
%  r = (r_1,...,r_n),   con r_i = p(x_i) - y_i.
%
% VALUTAZIONE  
% Note le funzioni base b_j(x), e i coefficienti a_j, 
% valuta la funzione p(x) in z_i, ovvero valuta w_i = p(z_i) (i=1,2,...,N)
% 
% Input 
%
%   x           vettore colonna che contiene gli n nodi  x_i
%   y           vettore colonna che contiene gli n valori y_i
%   b           puntatore a funzione, b(x,j) coincide con b_j(x)
%   m          intero, numero di funzioni base 
%   z           vettore colonna che contiene gli N valori z_i
%
% Output 
%
%   w           vettore colonna che contiene gli N valori w_i=p(z_i)
%
% Esempio d'uso
%
% rand('seed',100)
% x = 10*rand(30,1);
% y = cos(x)+0.2*rand(size(x));
% b = @(x,j) cos((j-1)*x);
% m = 5;
% z = linspace(min(x),max(x),101)';
% w = approssimazione_generale_standard(x,y,b,m,z);
% plot(x,y,'o',z,w,'-')
%
a = approx_costruisci_generale(x,y,b,m);   % Costruzione 
w = valuta_generale(a,b,z);                        % Valutazione 
end