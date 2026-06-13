function radice = SecantiGlobale(funzione,a,b,delta_ass,res_ass,kmax)
%
% Argomento:  f(x)=0
%
% Risoluzione dell'equazione f(x)=0 mediante metodo ibrido SECANTI-BISEZIONE
%
% Input
%
%   funzione        puntatore (handle) alla function che definisce f(x)
%   a                   estremo sinistro dell'intervallo di ricerca
%   b                   estremo destro dell'intervallo di ricerca
%  delta_ass      reale non negativo; massima tolleranza sull'errore assoluto
%  res_ass         reale non negativo; massima tolleranza sul residuo 
%  kmax             intero; massimo numero di iterazioni
%
%
% Output
%
%   radice           approssimazione della soluzione
%
% Esempio d'uso
%
% funzione = @(x) x.^3 - 3;
% derivata = @(x) 3*x.^2;
% a = 0; b = 2; delta_ass=1e-4; res_ass=1e-4; kmax = 10;
% radice = SecantiGlobale(funzione,a,b,delta_ass,res_ass,kmax)
%
 fa = funzione(a); fb = funzione(b);
 if fa*fb>0
%     disp('intervallo che potrebbe non contenere radici')
   return
 end
 x = (a+b)/2; fx = funzione(x);
 px = (fx-fa)/(x-a);
 k = 1;
 while(abs(a-b) > delta_ass + eps*max(abs(a),abs(b))&(abs(fx) > res_ass)&k <= kmax)
   if appross_in_ab(x,fx,px,a,b)
     xprec = x; x = x-fx/px;
     else
     xprec = x; x = (a+b)/2;
    end 
   fxprec = fx;
   fx  = funzione(x);
   px = (fx-fxprec)/(x-xprec); 
   k = k+1;  
   if fa*fx<=0
	  b  = x; 
	  fb = fx;
     else
	   a  = x; 
	   fa = fx;
    end 
 end 
radice = x;
end

function ok = appross_in_ab(x,fx,fpx,a,b)
% determina l'appartenenza dell'approssimazione di un
% passo di Newton o selle Secanti all'intervallo [a,b].
% E’ usata da NewtonGlobale, SecantiGlobale
% input  
%  x     approssimazione corrente della radice
%  fx    valore di f  in x.
%  fpx   valore di f'(o di una sua approssimazione) in x
%  a,b   [a,b] intervallo che contiene la radice
% output
%  ok    1 se la approssimazione di Newton/Secanti 
%             x - fx/fpx appartiene a [a,b]
%        0 ALTRIMENTI
      mi = min([a b]); ma = max([a b]); a = mi; b = ma;
	ok = (a <= x-fx / fpx) && (x-fx / fpx <= b);
end