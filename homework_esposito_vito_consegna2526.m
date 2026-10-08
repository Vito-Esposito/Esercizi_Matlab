clear all   % elimina variabili dalla memoria
close all   % chiude finestre grafici aperte
clc         % pulisce il command windwos
rand('seed', 14679)     % otterrò sempre gli stessi numeri randomizzati 
                        % grazie a questo seed

% ESPOSITO -- VITO
% 0124003432

%% PARTE 1 - VETTORI E MATRICI
% 1) 
m= 32;     % quindi intervallo di interi [125+32, 224+32]= [157, 256]
v= randi([125+m, 224+m], 1, 25);

% 2)
for i= length(v):-1:1     % i = 25, 24, 23, ..., 1  non rischio slittamento 
                          % degli elementi partendo dalla fine
    if (mod(v(i), 5) == 2)     % mod(dividendo, divisore)= resto
        v(i)= [];    % elimino elemento
    end
end

% 3)
l= length(v);
w= (m+1)+((m^2+8)-(m+1))*rand(1, l);       % x= a+(b-a)*rand(1, size)

% 4)
C= zeros(3, l);      % inizializzo matrice 3xl con tutti zero
C(1, 1:l)= v;
C(2, :)= w;
for i= 1 : l
    C(3, i)= 3*v(i) + 5*w(l+1-i);       % oppure versione vettoriale 
                                        % C(3, :)= 3*v + 5*w(end:-1:1)
end                                   

% 5)
C_new= C(1:3, [15, 10, 4]);  % C è una matrice 3x18, C_new una matrice 3x3
                             % uso come indici di colonna di C per 
                             % l'estrazione in C_new: 15, 10, 4

E= C_new * C_new';           % E prodotto righe per colonne tra C_new e 
                             % la sua trasposta, cioè C_new con le
                             % righe scambiate con le colonne

% 6)
rango_E= rank(E);           % quante colonne/ righe sono linear. indipend.
                            % quante sono le colonne diverse e che 
                            % non si possono ottenere una dall'altra

det_E = det(E);             % indica se la matrice è invertibile (det>0) 
                            % o singolare (det=0) (non invertibile)
if det_E < 1e-16
    disp('La matrice E è singolare.');
else
    disp('La matrice E non è singolare.');
end
% uso < 1e-16 invece di == 0 perché per errori di precisione
% il determinante può risultare molto piccolo ma non esattamente zero,
% quindi considero "zero" tutti i valori entro la tolleranza 1e-16

% 7)
S= mean(C_new(2, :));     % S media degli elementi della riga 2 di C_new 
F= C_new;

ind= find(F < S);      % scorre F(i, j) e restituisce un vettore degli
                       % indici degli elementi < S
F(ind)= 2*S;

%% PARTE 2 - FUNZIONI, GRAFICI, RISOLUZIONE DI EQUAZIONI NON LINEARI 
% 8)
c= 7.2;      % c numero reale fissato im [5, 10], m= 32
fun_mia= @(x) sin((1./(1+m*x.^2)) - c/(c+1));    % handle function
                                                 % fun_mia funzione 

% 9)
N= 101;     % 101 componenti linear. distribuiti nel vettore riga R
a= -2;      
b= 2;       % intervallo I= [-2, 2]
h= (b - a) / (N - 1);   % h passo di incremento, ovvero la distanza
                        % costante tra un valore e il successivo
                        % dentro un vettore in modo lineare
R= a:h:b;               % R= linspace(-2, 2, 101) usa automatic. h passo
                        % linspace == linear space == spazio lineare di
                        % punti

% 10)
T= fun_mia(R);     % valuto la mia funzione in R, R dominio di 101 punti
                   % tra -2 e 2, con T codominio

figure          % apre una nuova finestra grafica
plot(R, T)          % disegna curva/grafico usando i valori 
                                    % delle ascisse R e i valori delle
                                    % ordinate T
hold on               % mantieni il grafico pure se aggiungo altri elementi
grid on               % attiva griglia
xline(0);             % disegna l'asse verticale dove x= 0
yline(0);             % disegna l'asse orizzontale dove y= 0
xlabel('x')           % asse che rappresenta i valori di x
ylabel('f(x)')        % asse che rappresenta i valori di f(x)
title('Grafico della funzione fun\_mia')       % do titolo al grafico

% 11)
delta_ass = 1e-6;   
radici= [];     % creo vettore che conterrà le radici 0x0

for i= 1 : N-1
    if T(i)*T(i+1) < 0    % se avviene cambio di segno, ho trovato
                          % l'intervallo che contiene la radice
                          % p.e. avviene con T(49) e T(50)
        r= Bisezione(fun_mia, R(i), R(i+1), delta_ass); % trovo radice
                     % R(i) mi da il valore x in posizione i del vettore R
        radici(end+1)= r;
    end
end

disp('Radici trovate:') 
disp(radici)
plot(radici, 0, 'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'r');
% x= radici, y= 0 per ogni radice, 'ro' marker rotondo o di colore rosso r
% MarkerSize grandezza del marker, size 4, MArkerFaceColore riempie il
% cerchio di r rosso

% 12)
options= optimset('TolX', 1e-15);
z_1= fzero(fun_mia, 0.05, options);  % trovo zero positivo tramite funzione  
% matlab fzero, intorno al punto iniziale x= 0.05 con tol= 1e-15
plot(z_1, 0, 'ro', 'MarkerSize', 5, 'MarkerFaceColor', 'green')
text(z_1, 0.02, 'Radice trovata con fzero', 'Color', 'green');
hold off          % d'ora in poi, se faccio un nuovo plot
                  % cancella tutto e ricomincia

% 13) 
xiniz= 0.05;      % cambiato da 0, perchè così non divide per 0 
                  % nella correzione di Newton
xiniz1= 1;
tol= 1e-9;
a= 0;
b= 1;
kmax= 50;

fun1_mia = @(x) -(2*m*x) ./ (1+m*x.^2).^2 .* cos(1./(1+m*x.^2) - c/(c+1));
% fun1_mia derivata di fun_mia

% zero positivo
xb= Bisezione(fun_mia, a, b, tol);       % function matlab Bisezione
xn= Newton(fun_mia, fun1_mia, xiniz, tol, kmax); % function matlab Newton
xs= Secanti(fun_mia, xiniz, xiniz1, tol, kmax);  % function matlab Secanti

x_exact= 1 / sqrt(m*c);    % soluzione teorica

errb= abs(xb - x_exact);
errn= abs(xn - x_exact);
errs= abs(xs - x_exact);
% errori assoluti dei tre metodi

hold off

%% Parte 3 - Risoluzione di sistemi lineari
% 14)
n= 32;      % intero fissato a piacere nell'intervallo [30, 40]
A= 10+(20-10)*rand(n, n);   
% A matrice dei coefficienti, quadrata, di ordine n
% con entrate casuali reali nell'intervallo [10, 20]
x_e= randi([1, 3], n, 1);
% x_e vettore colonna, vettore delle soluzioni esatte, 
% casuale, con n componenti intere casuali nell'intervallo [1, 3]
b_14= A*x_e;        % b_14 rinominato così perchè già esistente b
% b_14 vettore dei termini noti, ottenuto dal prodotto matriciale A*x_e
% ogni componente bi è il prodotto scalare della riga i-esima di A
% per il vettore x_e

% 15)
x_mia= GaussBS(A, b_14); % soluzione ottenuta da Gauss+BackSub, senza pivoting
x_mia_piv= Sgauss_pivot(A, b_14); % soluzione ottenuta da Gauss+BackSub, con pivoting
x_matlab= A\b_14; % soluzione ottenuta mediante l'operatore \

err_mia     = norm(x_mia - x_e);     
err_mia_piv = norm(x_mia_piv - x_e);
err_matlab  = norm(x_matlab - x_e);
% norm calcola la distanza tra i due vettori, restituisce un singolo 
% scalare che misura quanto x_mia si discosta da x_e

% 16)
% per errore puntuale si intende l'errore componente per componente, 
% quindi un vettore di 32 elementi che mostra l'errore di ogni componente 
% di x_mia, ecc. rispetto ai componenti di x_e 
figure
hold on
grid on
plot(1:n, abs(x_mia - x_e), 'r')
plot(1:n, abs(x_mia_piv - x_e), 'b')
plot(1:n, abs(x_matlab - x_e), 'g')
% plot di: asse x 1:32, asse y errore assoluto tra x_mia(i) e x_e(i),
% colore dell'andamento
legend('Gauss senza pivoting', 'Gauss con pivoting', 'Matlab')
% legenda che associa ogni metodo al suo colore con cui rappresentato
% l'andamento, colore associato ad ogni nome in base all'ordine con cui
% sono stati fatti i plot
hold off

% 17)
[T, ~]= TriangGauss_pivot(A, b_14); % T == matrice triangolare superiore di A
T= triu(T); % estrae il triangolo superiore della matrice T e azzera 
% tutti gli altri elementi sotto la diagonale

for i= 1:n
    r_p= T(i, i:n);
    T_ord(i, i:n)= sort(r_p,"ascend");
end
% i:n prende la riga che parte dalla diagonale principale, non toccando gli
% zeri che si trovano al di sotto di quest'ultima

%% Parte 4 - Interpolazione polinomiale di Lagrange
% 18)
f_18= @(x) sin(m*x) ./ (x .* (1 + 10*cos(x).^4));
% f_18 funzione da interpolare, m= 32
a_18= 1/(1+m^2); 
b_18= 12/m; 
% a_18/b_18 chiamati così perchè variabili già esistenti in precedenza
% [a_18, b_18]
z= linspace(a_18, b_18, 100);
% z sarà il dominio, le 100 x equispaziate in [a_18, b_18] di f

figure
grid on
hold on
plot(z, f_18(z))
xline(0)
yline(0)
xlabel('x')
ylabel('f_18(x)')
title('Funzione f valutata su z')
% valuto la funzione f nei 100 punti di z

    for n= [5, 8, 13]
    xi= linspace(a_18, b_18, n);
    % equispazio n nodi di interpolazione in [a, b]

    p= interpolazione_funzioni(xi', f_18, z');
    % interpola con un polinomio di grado al più n-1 una funzione nei nodi
    % xi, per i= 1, ..., n e lo valuta in z
    % trasformo xi e z in vettori colonna, richiesti come argomento
    
    figure
    hold on
    grid on
    plot(z, f_18(z))
    plot(xi, f_18(xi), 'ro', 'MarkerSize', 5, 'MarkerFaceColor', 'r')
    plot(z, p, 'g')
    xline(0)
    yline(0)
    xlabel('x')
    ylabel('f(x)')
    title('Interpolazione Lagrange n= ', n)
    legend('f(x)', 'nodi', 'interpolante')
    hold off
    end

% 19)
err_inf= zeros(1, 3);
err_puntuale_13= [];
i= 1;

for n= [5, 8, 13]
    xi= linspace(a_18, b_18, n);
    p= interpolazione_funzioni(xi', f_18, z');

    err_puntuale= abs(f_18(z') - p);
    % f_18(z') perchè p è un vettore colonna
    % errore puntuale, errore in ogni punto di z

    err_inf(i)= max(err_puntuale);
    % errore in norma infinito, il massimo dell'errore assoluto su z

    if n == 13
        err_puntuale_13= err_puntuale;
    end
    i= i+1;
end

e5= err_inf(1); % errore in norma infinita dell'interpolazione con 5 nodi
e8= err_inf(2); % errore in norma infinita dell'interpolazione con 8 nodi
e13= err_inf(3); % errore in norma infinita dell'interpolazione con 13 nodi

figure
plot(z, err_puntuale_13, 'r')
hold on
grid on
xline(0)
xlabel('x')
ylabel('f(x)-p(x)')
title('Andamento dell''errore assoluto di interpolazione di nodi= 13')
hold off

% Per n= 13 nodi, polinomio di grado 12, l'errore raggiunge i suoi picchi
% massimi in prossimità dei bordi, subisce forti oscillazioni vicino agli
% estremi dell'intervallo, e sarebbe preferibile utilizzare nodi non
% equispaziati, nodi di Chebyshev, dove sono più concentrati agli estremi e
% quindi con più informazioni

% 20)
% f_18 funzione da interpolare, m= 32, z le 100 x equispaziate in 
% [a_18, b_18] di f

    for n= [5, 8, 13]
    xi_cheb= nodi_cheb(a_18, b_18, n);
    % n nodi di Chebyshev in [a_18, b_18], vettore colonna 

    p_cheb= interpolazione_funzioni(xi_cheb, f_18, z');
    
    figure
    hold on
    grid on
    plot(z, f_18(z))
    plot(xi_cheb, f_18(xi_cheb), 'ro', 'MarkerSize', 5, 'MarkerFaceColor', 'r')
    plot(z, p_cheb, 'g')
    xline(0)
    yline(0)
    xlabel('x')
    ylabel('f(x)')
    title('Interpolazione Chebyshev n= ', n)
    legend('f(x)', 'nodi Chebyshev', 'interpolante')
    hold off
    end

err_inf_cheb= zeros(1, 3);
err_puntuale_13_cheb= [];
i= 1;

for n= [5, 8, 13]
    xi_cheb= nodi_cheb(a_18, b_18, n);
    p_cheb= interpolazione_funzioni(xi_cheb, f_18, z');

    err_puntuale_cheb= abs(f_18(z') - p_cheb);
    err_inf_cheb(i)= max(err_puntuale_cheb);

    if n == 13
        err_puntuale_13_cheb= err_puntuale_cheb;
    end
    i= i+1;
end

e5_cheb= err_inf_cheb(1); 
e8_cheb= err_inf_cheb(2); 
e13_cheb= err_inf_cheb(3); 

figure
plot(z, err_puntuale_13_cheb, 'r')
hold on
grid on
xline(0)
xlabel('x')
ylabel('f(x)-p(x)')
title('Andamento dell''errore assoluto di interpolazione Chebyshev n= 13')
hold off

% errore distribuito uniformemente su tutto l'intervallo, minor errore con
% oscillazioni regolari

%% Parte 5 - Interpolazione a tratti, curve parametriche
% 21)
n_21= 26;
ti= linspace(0, 2*pi, n_21);
% 20 punti Ti equispaziati in [0, 2pi]
x_21= (4 + cos(11*ti)) .* cos(ti);
y_21= (4 + cos(11*ti)) .* sin(ti);
% punti di interpolazione Pi= (Xi, Yi)
% Questi 20 punti sono i campioni della curva, una rappresentazione 
% discreta di una curva continua. 
% Con più punti la rappresentazione è 
% più fedele, con meno punti è più approssimata.

% 22)
px= spline(ti, x_21);
py= spline(ti, y_21);
% costruisce solo, nessuna valutazione in punti

% 23)
ti_fitta= linspace(0, 2*pi, 500);   % griglia fitta

px = ppval(px, ti_fitta);
py = ppval(py, ti_fitta);
% con ppval, valuto la spline costruita nei punti decisi

figure
hold on
grid on
plot(px, py, 'b')
plot(x_21, y_21, 'ro', 'MarkerSize', 4, 'MarkerFaceColor', 'r')
xline(0)
yline(0)
xlabel('x')
ylabel('y')
title('Curva interpolata')
legend('spline periodica', 'punti interpolazione')
hold off

%% Parte 6 - Approssimazione ai minimi quadrati
% Se ho troppi nodi, non riesco a trovare un polinomio che meglio li 
% interpola, perchè il grado sarebbe enorme, quindi cerco una curva che li 
% approssima nel modo migliore, senza passarci esattamente, voglio 
% approssimarli con una retta p(x)= a1 + a2x per tutti i punti, allora 
% faccio da i=1 a m nodi, (yi - p(xi)), quindi (yi - a1 - a2xi), cioè lo 
% scarto tra il valore reali yi e il valore della retta p(xi) una volta 
% ottenute tutte le equazioni dello scarto, le scrivo in forma matriciale, 
% matrice dei coefficienti di a1 e a2 (A) * vettore colonna (a) incognite 
% a1 e a2 = vettore colonna (y), poi calcolo (A' * A)= k, poi A'*y= l, 
% poi k*a= l e mi trovo a1 e a2 che risolvono l'equazione che approssima 
% al meglio tutti i punti p(x)= a1 + a2x

% 24)
M= 90;
nodi= -3+(4-(-3))*rand(1, M);   
nodi= sort(nodi);
% M nodi > 85 reali casuali nell'intervallo [-3, 4] in modo crescente
% nell'array

% 25)
mu= 20;
% distribuzione gaussiana = curva a campana, come sono distribuiti valori
% delle ordinate yi casuali intorno a un valore centrale, 20
% media mu è il valore centrale attorno a cui si concentrano i dati
ds= 4;
% deviazione standard misura quanto sono dispersi i valori intorno alla
% media, quindi qui avremo una concentrazione maggiore nei valori 
% [20-4, 20+4]
valori= mu + ds * randn(1, M);
valori= sort(valori);
% così simulo dati reali rumorosi con distribuzione gaussiana

% 26)
z_26= linspace(-3, 4, 300);
% griglia fitta di 300 punti che contiene nodi
p_26= approssimazione_pol_standard(nodi', valori', 2, z_26');
% la function contiene sia la costruzione dei coefficienti a1 e a2 della 
% retta, sia la sua valutazione lungo la griglia fitta di 300 punti
% restituendo il vettore con i valori della retta su z_26
% n.b. 2 in input indica i coefficienti che vogliamo per il polinomio di
% m-1 grado
% la function internamente fa:
% prende `nodi` e `valori` -> costruisce la matrice A e il vettore y
% risolve (A'*A)*a = (A'*y) -> trova a1 e a2
% valuta p(x)= a1+a2x nei 300 punti di z_26 -> restituisce p_26

% 27)
figure
hold on
grid on
plot(nodi, valori, 'ro', 'MarkerSize', 4)
plot(z_26, p_26, 'b')

for d= 2:5
    p_27= approssimazione_pol_standard(nodi', valori', d+1, z_26');
    plot(z_26, p_27)
end

xline(0)
yline(0)
xlabel('x')
ylabel('y')
title('Approssimazione ai minimi quadrati')
legend('dati', 'grado 1', 'grado 2', 'grado 3', 'grado 4', 'grado 5')
hold off

% 28)
for d= 1:5
    p_28= approssimazione_pol_standard(nodi', valori', d+1, nodi');
    
    residuo= norm(valori' - p_28);
    fprintf('Residuo del polinomio di grado %d è: %.6f\n', d, residuo)
end
% minore è il residuo, minore è l'errore tra valori reali e ottenuti

%% Parte 7 - Quadratura ed errore di discretizzazione
% 29)
f_29 = @(x) (6*exp(0.5*x) + log(x+5) + 10*sin(2*x) + 10) ./ (3*x.^4 + 4*x.^2 + 2);
a_29= -2;
b_29= 6;

figure
hold on
ezplot(f_29, [-2, 6])
xline(0)
yline(0)
xlabel('x')
ylabel('f(x)')
hold off

% 30)
I= integral(f_29, a_29, b_29, 'AbsTol', 1e-8, 'RelTol', 1e-8)
% 'AbsTol', 1e-8, tolleranza assoluta, l'errore assoluto deve essere < 1e-8
% 'RelTol', 1e-8, tolleranza relativa, l'errore relativo deve essere < 1e-8

% 31)
T20= trapezoidale(a_29, b_29, f_29, 20);
T40= trapezoidale(a_29, b_29, f_29, 40);
T80= trapezoidale(a_29, b_29, f_29, 80);
S20= Simpson(a_29, b_29, f_29, 21);
S40= Simpson(a_29, b_29, f_29, 41);
S80= Simpson(a_29, b_29, f_29, 81);

% Simpson chiede numero di sottointervalli dispari

% Le formule di quadratura approssimano l'integrale di f in [a,b]
% dividendo l'intervallo in M sottointervalli di larghezza h= (b-a)/M
% e approssimando f su ogni sottointervallo con una curva semplice
% Trapezoidale: approssima f con una retta su ogni sottointervallo, per poi
% calcolare l'area dei trapezi sotto la curva, e sommarle tutte
% Cavalieri-Simpson: approssima f con una parabola su ogni coppia
% di sottointervalli, più precisa della trapezoidale, per poi
% calcolare l'area sottostante, e sommarle tutte
% con M maggiore, i sottointervalli sono più piccoli e l'approssimazione
% è più accurata

err_T80= abs(I - T80);
err_S80= abs(I - S80);

stima_T80 = abs(T80 - T40) / 3;
stima_S80 = abs(S80 - S40) / 15;

fprintf('Errore reale T80   = %.2e\n', err_T80)
fprintf('Stima errore T80   = %.2e\n', stima_T80)
fprintf('Errore reale S80   = %.2e\n', err_S80)
fprintf('Stima errore S80   = %.2e\n', stima_S80)
% Simpson è circa 1000 volte più preciso della Trapezoidale

%% Parte 8 - Costruzione di una formula di quadratura
% 32)
g= 6;       % 6 nodi distinti
x_nodi = [2, 4, 7, 10, 11, 16];

% 33)
% considerata la formula di quadratura:
% Q(f)= w1*f(x1) + w2*f(x2) + ... + wg*f(xg) per i g nodi, 6 nodi
% devo trovare quanto pesa ogni nodo, quindi quanto vale ogni peso wi
% che rendono la formula esatta per i polinomi al più di grando g-1= 5,
% quindi risolvere B'*w= I 
% B è la matrice gxg, la riga j contiene x_nodi^(j-1)
% w il vettore colonna dei pesi incogniti
% I vettore colonna degli integrali dei monomi x^j-1 in [2, 16]
% risolvo il sistema per trovare w
a_33= 2;
b_33= 16;
B_33= zeros(g, g);
I_33=zeros(g, 1);

for j= 1:g
    B_33(j, :)= x_nodi.^(j-1);
    grado= j-1;
    monomio= @(x) x.^grado;
    I_33(j)= integral(monomio, a_33, b_33);
end

w_33= B_33 \ I_33;

% 34)
f_34= @(x) cos(x);
I_34= sum(w_33' .* f_34(x_nodi));
% integrale approssimato con la mia formula costruita

I_e= sin(16) - sin(2);
% integrale di riferimento

errore= abs(I_e - I_34);
