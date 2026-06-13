function w = valuta_pol(a,z)
%
% Argomento:  Fitting - Interpolazione e Approssimazione
%
% Modello polinomiale: le funzioni base sono b_j(x) = x^(j-1).
%
% VALUTAZIONE  
% La function valuta il polinomio 
%
%      p(x) = a_1 + a_2 x + .. .+ a_n x^(n-1),
%
% di cui sono assegnati i coefficienti a_j, nei punti di valutazione z_i, 
% per i=1,2,...,N, ottenendo i valori corrispondenti w_i = p(z_i), per i=1,2,...,N
%
% Input 
%
%   a           vettore colonna che contiene i coefficienti a_j 
%   z           vettore colonna che contiene gli N valori z_i
%
% Output 
%
%    w           vettore colonna che contiene gli N valori w_i=p(z_i)
%
%  Esempio d'uso
%
%  a = [1 2 0 3]';  
%  z = linspace(-2,2,200)';
%  w = valuta_pol(a,z); 
%  % valuta il polinomio p(x) = 1 + 2x + 3x^4 in z
%   plot(z,w,'-')  % grafico
b = @(x,j) x.^(j-1);
n = size(a,1);
N = size(z,1);
Bz = zeros(N,n);
for k=1:n
Bz(:,k) = b(z,k);
end
w = Bz*a;
end
