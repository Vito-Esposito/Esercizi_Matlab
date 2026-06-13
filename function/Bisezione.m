function radice = Bisezione(funzione,a,b,delta_ass)
%
% Argomento:  f(x)=0
% 
% Risoluzione dell'equazione f(x)=0 mediante il metodo di BISEZIONE.
%
% Input
%
%   funzione         puntatore (handle) alla function che definisce f(x)
%   a,b                  reali, estremi dell'intervallo di ricerca
%   delta_ass       reale non negativo; massima tolleranza sull'errore assoluto
%
% Output
%
%   radice           il punto medio dell'intervallo
%                        [ak,bk] tale che f(ak)*f(bk)<=0
%                        |bk-ak|<=delta+eps*max(|ak|,|bk|)
%
%
% Esempio d'uso
%
% funzione = @(x) x.^3 - 3;
% a = 0; b=2;  delta_ass=1e-4;
% radice = Bisezione(funzione,a,b,delta_ass)
ak = a; bk = b;
fak = funzione(ak);
fbk = funzione(bk);
while abs(bk-ak)>delta_ass + eps*max(abs(ak),abs(bk))
    pmediok = (ak+bk)/2;
    fpmediok = funzione(pmediok);
    if sign(fak) ~= sign(fpmediok)
% la radice e' nell'intervallo [ak,pmediok]
        bk = pmediok;
        fbk = fpmediok;
    else
% la radice e' nell'intervallo [pmediok,bk]
        ak = pmediok;
        fak = fpmediok;
    end
%    disp([ak,bk,abs(ak-bk)])
end
radice = (ak+bk)/2;
end