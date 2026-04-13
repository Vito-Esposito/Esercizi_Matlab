function D = mio_det(A, n)

    for k = 1:n-1
        if A(k,k) == 0
            D = 0;  % pivot zero = determinante 0
            return;
        end

        for i= k+1:n
            m= A(i,k) / A(k,k);
            A(i,:)= A(i,:)-m*A(k,:);
        end
    end
    
    D= 1;
    for i= 1:n
        D= D*A(i,i);
    end
end