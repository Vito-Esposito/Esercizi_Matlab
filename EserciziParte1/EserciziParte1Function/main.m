% f1
% generare una function Matlab che riceve in input un vettore e restituisce
% in output la somma delle sue componenti. 
% Testare la function con il vettore v = [1, 4, 9, 16, . . . , 9604, 9801]
v= 1:99;
v= v .^ 2;

disp('La somma delle componenti di v:')
disp(v)
disp('somma:')
disp(f1(v))

% f2
% Generare una function Matlab che riceve in input tre valori positivi a, b, 
% c e restituisce in output media aritmetica Ma, media armonica Mr e media
% geometrica Mg di tali valori:
% Ma= a+b+c / 3
% Mr= 3 / (1/a + 1/b + 1/c)
% Mg= 3rad(abc)

a= input('inserisci valore positivo a: ')
b= input('inserisci valore positivo b: ')
c= input('inserisci valore positivo c: ')

[Ma, Mr, Mg]= f2(a, b, c);

disp('Media aritmetica: ')
disp(Ma)
disp('Media armonica: ')
disp(Mr)
disp('Media geometrica: ')
disp(Mg)

% f3
% Generare una function Matlab che riceve in input un array x = (x1, x2, . . . , xn)
% di ascisse crescenti, cioè x1 < x2 < x3 < . . . < xn,
% e restituisce in output un array d di n − 1 componenti contentente le
% distanze tra due ascisse consecutive
% d = (h1, h2, . . . , hn−1), con hi = xi+1 − xi
% Testare la function con il vettore
% v = [1, 4, 9, 16, . . . , 9604, 9801]

disp('Vettore d con le distanze dei vari elementi del vettore v: ')
d= f3(v);
