function S = Simpson(a,b,f,m)
%
% Argomento: Quadratura numerica
%
% La function calcola il valore della formula di quadratura 
% di Simpson, composita su m nodi (m deve essere dispari)
% Osservazione: il numero di sottointervalli è n = (m-1) / 2
%
% Input
%
% a             reale; estremo sinistro di integrazione
% b             reale; estremo destro di integrazione
% f              puntatore (handle) alla function che definisce la funzione integranda f(x)
% m            intero; m>=1 numero di nodi
%
% Output 
%
% S             stima dell'integrale definito di f(x) in [a,b] 
%
%  Esempio d'uso
%
%  a = 1.5*pi; b = 2*pi; 
%  f = @(x) cos(x);  m = 5;
%  S = Simpson(a,b,f,m)
%
n = (m-1)/2;
h = (b-a) / n;
nodi = a:h/2:b;
% tutti i valori dei nodi sono utilizzati
S = f(nodi(1)); % valore di f sul primo nodo
for i = 1: n
    S = S + 4*f(nodi(2*i)); % valore di f sui nodi interni 
end
for i = 1: n-1
    S = S + 2*f(nodi(2*i+1)); % valore di f sui nodi interni 
end
S = S + f(nodi(m)); % valore di f sull'ultimo nodo 
S = S*h/6;
end