function [x, y, z, w]= interpolante(n, M)
    t= 0+M*rand(1, n);
    x= sort(t);
    y= M+(2*M-M)*rand(1, n);
    z= linspace(0, max(x), 200);
    w= spline(x, y, z);

    plot(x, y, 'r*');          % punti (x_i, y_i) con asterischi rossi
    hold on;
    plot(z, w, 'b-');          % spezzata/spline in blu
    hold off;
    title('Interpolazione con spline cubica naturale');
    xlabel('x'); 
    ylabel('y');

end