function radice = Newton(funzione,derivata,xiniz,delta_ass,kmax)
%
% Argomento:  f(x)=0
%
% Risoluzione dell'equazione f(x)=0 mediante metodo di NEWTON
%
% Input
%
%   funzione        puntatore (handle) alla function che definisce f(x)
%   derivata         puntatore (handle) alla function che definisce f'(x)
%   xiniz               reale; approssimazione iniziale della soluzione
%   delta_ass       reale non negativo; massima tolleranza sull'errore assoluto
%   kmax             intero; massimo numero di iterazioni
%
% Output
%
%   radice            approssimazione della radice
%
% Esempio d'uso
%
% funzione = @(x) x.^3 - 3;
% derivata = @(x) 3*x.^2;
% xiniz = 2; delta_ass=1e-4; kmax = 10;
% radice = Newton(funzione,derivata,xiniz,delta_ass,kmax)
%
xk = xiniz; 
k = 1;
fxk = funzione(xk);
fprimoxk = derivata(xk);
correzionek = -fxk / fprimoxk;
while abs(correzionek)>delta_ass + eps*abs(xk)&&k <= kmax
    xk = xk + correzionek;
    fxk = funzione(xk);
    fprimoxk = derivata(xk);
    correzionek = -fxk/fprimoxk;
    k = k+1;
end
radice = xk;
end
