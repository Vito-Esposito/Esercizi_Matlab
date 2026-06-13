function w = interpolazione_generale_standard(x,y,b,z)
%
% Argomento:  Fitting - Interpolazione
%
% Versione standard: costruzione + valutazione
% Modello generale: funzioni base scelte dall'utente
%
% La function costruisce la funzione p(x) interpolante n punti (x_i,y_i), 
% i=1,2,...,n, e la valuta nei punti di valutazione z_i, per i=1,2,...,N, 
% ottenendo i valori corrispondenti w_i = p(z_i), per i=1,2,...,N.
% 
% COSTRUZIONE 
% Determina i coefficienti a_j della somma 
%
%  p(x) = a_1 b_1(x) + a_2 b_2(x) + ... + a_n b_n(x)
%
% imponendo gli n vincoli p(x_i) = y_i, 
% (condizioni di interpolazione di Lagrange),
% dove le funzioni base b_j(x) sono assegnate.
%
% VALUTAZIONE  
% Note le funzioni base b_j(x), e i coefficienti a_j, valuta 
% la funzione p(x) in z_i, ovvero valuta w_i = p(z_i) (i=1,2,...,N)
% 
% Input 
%
%   x           vettore colonna che contiene gli n nodi  x_i
%   y           vettore colonna che contiene gli n valori y_i
%   b           puntatore a funzione, b(x,j) coincide con b_j(x)
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
%  b = @(x,j) exp(0.1*(j-1)*x);
%  w = interpolazione_generale_standard(x,y,b,z);
%  plot(x,y,'o',z,w,'-') 
a = interp_costruisci_generale(x,y,b);   % Costruzione 
w = valuta_generale(a,b,z);       % Valutazione 
end