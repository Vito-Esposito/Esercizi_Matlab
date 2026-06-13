function  x = nodi_cheb(a,b,n)
% 
% Interpolazione/Approssimazione: nodi
%
% La function genera n nodi di  Gauss-Chebyshev-Lobatto
% ordinati e relativi all'intervallo [a,b]. I nodi sono dati da 
%
%   x_(k+1) = (b+a)/2 - (b-a)/2 *cos(k*pi / (n-1)) (k=0,...,n-1)
%
% Input
%
%    a,b        reali, estremi intervallo
%    n           intero, numero di nodi 
%
% Output
%
%    x            vettore colonna, contiene i nodi di Gauss-Chebyshev-Lobatto
%
%  Esempio d'uso
%
%  n = 25; a = 3; b = 5;
%  x = nodi_cheb(a,b,n);
%  plot(x,zeros(size(x)),'dr')
%  grid on
k = [n-1:-1:0]';
xcheb = cos(k*pi/(n-1));      % nodi nell'intervallo [-1,1]
x = (a+b)/2 + (b-a)/2*xcheb; %  trasformazione lineare in [a,b]
end