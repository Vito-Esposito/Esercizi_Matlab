function radice = Secanti(funzione,xiniz,xiniz1,delta_ass,kmax)
%
% Argomento:  f(x)=0
%
% Risoluzione dell'equazione f(x)=0 mediante metodo delle SECANTI
%
% Input
%
%   funzione        puntatore (handle) alla function che definisce f(x)
%   xiniz               reale; approssimazione iniziale della soluzione
%   xiniz1             reale; seconda approssimazione iniziale della soluzione
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
% xiniz = 2; xiniz1 = 1; delta_ass=1e-4; kmax = 10;
% radice = Secanti(funzione,xiniz,xiniz1,delta_ass,kmax)
%
xk = xiniz; xk1 = xiniz1; 
k = 1;
fxk = funzione(xk); fxk1 = funzione(xk1);
pxk = (fxk-fxk1)/(xk-xk1);
correzionek = -fxk/pxk;
while abs(correzionek)>delta_ass + eps*abs(xk)&&k <= kmax	
    xk1 = xk; fxk1 = fxk;
    xk = xk + correzionek;
    fxk = funzione(xk);
    pxk = (fxk-fxk1) / (xk-xk1);
    correzionek = -fxk / pxk;
    k = k+1;
end
radice = xk;
end