function T = trapezoidale(a,b,f,m)
%
% Argomento: Quadratura numerica
%
% La function calcola il valore della formula di quadratura 
% trapezoidale, composita su m sottointervalli
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
% T           stima dell'integrale definito di f(x) in [a,b] 
%
%  Esempio d'uso
%
%  a = 1.5*pi; b = 2*pi; 
%  f = @(x) cos(x);  m = 5;
%  T = trapezoidale(a,b,f,m)
%
h = (b-a) / m;
nodi = a:h:b; % tutti i valori dei nodi sono utilizzati
T = 0.5*f(nodi(1)); % valore di f sul primo nodo
for i = 2: m
    T = T + f(nodi(i)); % valore di f sui nodi interni 
end
T = T + 0.5*f(nodi(m+1)); % valore di f sull'ultimo nodo 
T = T*h;
end