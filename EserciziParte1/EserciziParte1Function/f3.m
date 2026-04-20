% f3
% Generare una function Matlab che riceve in input un array x = (x1, x2, . . . , xn)
% di ascisse crescenti, cioè x1 < x2 < x3 < . . . < xn,
% e restituisce in output un array d di n − 1 componenti contentente le
% distanze tra due ascisse consecutive
% d = (h1, h2, . . . , hn−1), con hi = xi+1 − xi
% Testare la function con il vettore
% v = [1, 4, 9, 16, . . . , 9604, 9801]

function [d]= f3(v)
    n= length(v);
    d= zeros(1, n-1);

    for i=1:n-1
         d(i)= v(i+1) - v(i);
    end
end