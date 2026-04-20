% function manipolazione_vet

function [A, d, D, B, M]= man_vet(n)

    % generazione matrice con elementi (i+j)^2
    A= zeros(n, n);

    for i=1:n
        for j=1:n
            A(i, j) = (i + j)^2; 
        end
    end

    % diagonale principale matrice
    d= zeros(1, n);
    k= 1;

    for i=1:n
        d(k)= A(i, i);
        k= k+1;
    end

    % matrice B ottenuta con elementi casuali tra 0 e 0.1
    B= A;

    for i=1:n
        for j=1:n
            B(i, j)= 0+(0.1-0)*rand();
    end
  
    % M il massimo dei valori presenti sull'ultima riga di B, equivalente
    % di M= max(B(n, :));
    M= B(n, 1);

    for i=2:n
        if B(n, i) > M
            M= B(n, i);
        end
    end

    D= mio_det(A, n);
end