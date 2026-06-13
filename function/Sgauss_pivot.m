function x = Sgauss_pivot(A,b)
%
% Argomento:  algebra lineare numerica
% 
% Risoluzione di un sistema di equazioni lineari con il 
% Metodo di Eliminazione di Gauss (con tecnica del pivoting) 
% e il metodo di sostituzione all'indietro .
%
% Input
%
%  A               matrice quadrata n x n, non singolare
%  b               vettore colonna n x 1, termini noti
%
% Output
%
%  x                vettore colonna n x 1, soluzioni
%
% Esempio d'uso
%
% A = [8 4 16; 2 10 6;  4 20 13];
% b = [4 12 16]';
% x = Sgauss_pivot(A,b) 
%
[A,b] = TriangGauss_pivot(A,b);
 x = BackSub(A,b);