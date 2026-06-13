function Pm = punto_medio(a,b,f,m)
%
% Argomento: Quadratura numerica
%
% La function calcola il valore della formula di quadratura 
% del punto medio, composita su m sottointervalli
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
% Pm           stima dell'integrale definito di f(x) in [a,b] 
%
%  Esempio d'uso
%
%  a = 2; b = 5; f = @(x) x.^3;  m = 100;
%  Pm = punto_medio(a,b,f,m)
%
h = (b-a) / m; 
nodi = a+h/2:h:b-h/2;  % tutti i valori dei nodi sono utilizzati
Pm = 0;
for i = 1: m
    Pm = Pm + f(nodi(i));
end
Pm = Pm*h;
end