% ESERCIZI PARTE 1

% genera il vettore riga v = [2, −4, 7, 9, 13];
v= [2, -4, 7, 9, 13];

% genera il vettore colonna w = [3, 6, 9, 12, 15] con la function linspace
w= linspace(3, 15, 5); % (15-3)/(n-1)= 3, 3, 6, 9 ecc. fino a 15
w= w';

% genera il vettore riga z = [5, 6, 7, . . . , 43, 44] con il comando :
z= [5:44];

% genera il vettore v_ord avente le componenti di v ordinate in modo
% crescente con opportuna funzione Matlab;
v_ord= sort(v);

% genera il vettore riga z2 eliminando da z le componenti in posizione
% 3 e 33;
z2= z;
z2([3, 33])= [];
disp('size di z:')
disp(size(z))
disp('size di z2:')
disp(size(z2))

% genera il vettore riga z3 eliminando da z tutte le componenti in
% posizione dispari;
z3= z(2:2:end);
disp(' size di 23:')
disp(size(z3))

% esegue il prodotto righe per colonne s = v · w
s= v*w;

% estrae nel vettore riga t nell'ordine le componenti 5, 11, 32, 3, 6 di z
t= z([5, 11, 32, 3, 6]);

% esegue il prodotto puntuale di (Hadamard) p tra v e t, ovvero
% pi = vi · ti, 1 = 1, . . . , 5
% usando operatore puntuale;
p= v .* t;

% esegue il prodotto puntuale precedente mediante ciclo for ;
p_for= zeros(1, length(v));

for i=1:length(v)
    p_for(i)= v(i)*t(i);
end

% calcola la combinazione lineare c = 3v + 2t + 4w^T
c= 3*v + 2*t + 4*w';

% calcola il prodotto esterno (si tratta sempre di un prodotto righe per
% colonne) E = w · v
E= w*v;

% osservato che E è una matrice quadrata 5x5, calcola il determinante di
% E con opportuna funzione Matlab
det_E= det(E);
disp('Il determinante di E, è:')
disp(det_E)

% calcola la somma sv delle componenti di v con opportuna funzione
% Matlab
sv= sum(v);

% genera il vettore v inv avente le componenti di v in ordine inverso
v_inv= v(end:-1:1);

v_inv2= zeros(1, length(v));
n= length(v);
for i=1:length(v)
    v_inv2(i)= v(n);
    n= n-1;
end

% calcola il massimo MW delle componenti in w
MW= w(1);

for i=2:length(w)
    if w(i) > MW
        MW= w(i);
    end
end

% calcola il minimo mw delle componenti in w
mw= w(1);

for i=2:length(w)
    if w(i) < mw
        mw= w(i);
    end
end

% estrae dalla matrice E, la matrice T 3 × 4 avente le prime 3 righe e
% le ultime 4 colonne di E
T= E(1:3, end-3:end);

% estrae dalla matrice E, la matrice Q 4×4 avente nell'ordine le entrate
% di E che si trovano sulle righe 2, 4, 5, 1 e sulle colonne 1, 2, 3, 4
Q= E([2, 4, 5, 1], 1:4);

% genera la matrice la matrice T3, 3×3, ottenuta eliminando la seconda
% colonna di T
T3= T(1:3, [1, 3, 4]);