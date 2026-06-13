function Rs = rettangolare_sx(a,b,f,m)
%
% Argomento: Quadratura numerica
%
% La function calcola il valore della formula di quadratura 
% rettangolare sinistra, composita su m sottointervalli
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
% Rs           stima dell'integrale definito di f(x) in [a,b] 
%
%  Esempio d'uso
%
%  a = 2; b = 5; f = @(x) x.^3;  m = 100;
%  Rs = rettangolare_sx(a,b,f,m)
%
h = (b-a) / m; 
nodi = a:h:b;  % l'ultimo valore di nodi non è di fatto utilizzato
Rs = 0;
for i = 1: m
    Rs = Rs + f(nodi(i));
end
Rs = Rs*h;
end