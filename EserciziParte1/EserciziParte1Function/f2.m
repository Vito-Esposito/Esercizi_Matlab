% Generare una function Matlab che riceve in input tre valori positivi a, b, 
% c e restituisce in output media aritmetica Ma, media armonica Mr e media
% geometrica Mg di tali valori:
% Ma= a+b+c / 3
% Mr= 3 / (1/a + 1/b + 1/c)
% Mg= 3rad(abc)

function [Ma, Mr, Mg]= f2(a, b, c)
    Ma= (a+b+c)/3;
    Mr= 3/((1/a)+(1/b)+(1/c));
    Mg = nthroot(a * b * c, 3);
end