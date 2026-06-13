function Rd = rettangolare_dx(a,b,f,m)
%
% Argomento: Quadratura numerica
%
% La function calcola il valore della formula di quadratura 
% rettangolare destra, composita su m sottointervalli
%
% Input
%
% a             reale; estremo sinistro di integrazione
% b             reale; estremo destro di integrazione
% f              puntatore (handle) alla function che definisce la funzione integranda f(x)
% m            intero; m>=1 numero di sottointervalli
%
% Output 
%
% Rd           stima dell'integrale definito di f(x) in [a,b] 
%
%  Esempio d'uso
%
%  a = 2; b = 5; f = @(x) x.^3;  m = 100;
%  Rd = rettangolare_dx(a,b,f,m)
%
h = (b-a) / m; 
nodi = a:h:b;  % il primo valore di nodi non è di fatto utilizzato
Rd = 0;
for i = 2: m+1
    Rd = Rd + f(nodi(i));
end
Rd = Rd*h;
end