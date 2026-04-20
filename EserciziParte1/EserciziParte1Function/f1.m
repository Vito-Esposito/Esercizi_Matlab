% Generare una function Matlab che riceve in input un vettore e restituisce
% in output la somma delle sue componenti. Testare la function con il vettore
% v = [1, 4, 9, 16, . . . , 9604, 9801]

function [sum]= f1(v)
    sum= 0;

    for i=1:length(v)
        sum= sum+v(i);
    end
end