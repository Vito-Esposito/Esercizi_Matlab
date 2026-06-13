function w = valuta_generale(a,b,z)
%
% Argomento:  Fitting - Interpolazione e Approssimazione
%
% Modello generale: funzioni base scelte dall'utente
%
% VALUTAZIONE  
% La function valuta la funzione  
%
%        p(x) = a_1 b_1(x) + a_2 b_2(x) + ... + a_n b_n(x),
%
% dove le funzioni base b_j(x) e i coefficienti a_j sono assegnati,
% nei punti di valutazione z_i, per i=1,2,...,N, ottenendo i valori
% corrispondenti w_i=p(z_i), per i=1,2,...,N
%
% Input 
%
%   a           vettore colonna che contiene i coefficienti a_j 
%   b           puntatore a funzione, b(x,j) coincide con b_j(x)
%   z           vettore colonna che contiene gli N valori z_i
%
% Output 
%
%    w           vettore colonna che contiene gli N valori w_i=p(z_i)
%
%  Esempio d'uso
%
%  a = [3 -2 5 12]';  
%  z = linspace(-2*pi,2*pi,200)';
%  b = @(x,j) cos((j-1)*x);
%  w = valuta_generale(a,b,z);
%  % valuta la funzione p(x) = 3 - 2cos(x) + 5cos(2x) + 12cos(3x) in z
%  plot(z,w,'-')  % grafico
n = size(a,1);
N = size(z,1);
Bz = zeros(N,n);
for k=1:n
Bz(:,k) = b(z,k);
end
w = Bz*a;
end