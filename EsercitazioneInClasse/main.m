% main

n= 0;
while(n <= 15)
n= input('Inserisci un intero positivo > 15 per stabilire l''ordine della matrice: ');
end

[A, d, D, B, M]= man_vet(n);

disp('La matrice e'':')
disp(A)

disp('La diagonale principale della matrice e'':')
disp(d)

disp('Size di B:')
disp(size(B))
disp('La matrice casuale e'':')
disp(B)

disp('Massimo valore dell''ultima riga di B:')
disp(M)

disp('Determinante della matrice:')
disp(D)

