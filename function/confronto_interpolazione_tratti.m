%
% Interpolazione a tratti: confronto tra diversi modelli
%
% Questo script esegue il confronto grafico tra i seguenti modelli di interpolazione a tratti
% w1  -- interpolante lineare a tratti di grado 1 (spline lineare)
% w2  -- interpolante lineare a tratti di grado 0, al più vicino
% w3  -- interpolante lineare a tratti di grado 0, al successivo
% w4  -- interpolante lineare a tratti di grado 0, al precedente
% w5  -- spline cubica not-a-knot
% w6  -- cubica di Hermite 
% w7  -- spline clamped

clear 
close all
clc
rand('seed',1004)
a=5; b=35; n=6; N=101;
% generazione breakpoints casuali ordinati non vicini in [a,b] 
x=cumsum(1+rand(n,1));
x=a+(b-a)*(x-x(1))/(x(end)-x(1));

% generazione valori
m=5; M=26; % [m,M] -- intervallo che contiene i valori y_i
y=m+(M-m)*rand(size(x));

% generazione punti di valutazione
z=linspace(a,b,N)';

% costruzione e valutazione degli interpolanti
w1 = interp1(x,y,z);
w2 = interp1(x,y,z,'nearest');
w3 = interp1(x,y,z,'next');
w4 = interp1(x,y,z,'previous');
% w5 = interp1(x,y,z,'spline'); % spline not-a-knot
w5 = spline(x,y,z); % spline not-a-knot 
w6 = pchip(x,y,z); % cubica di hermite

pp = csape(x',[0 y' 0],'clamped'); % costruzione spline clamped
wc=ppval(pp,z);  % valutazione spline clamped


plot(x,y,'o','MarkerSize',10,'LineWidth',2)
hold on 
h = gca;
h.XTick = a:3:b;
h.YTick = m:3:M;
axis([a-3, b+3,min(y)-3, max(y)+3])
plot(z,w1,'-','LineWidth',1,'Color',[0.8,0.3,0.3]')
pause
plot(z,w2,'*','LineWidth',1,'Color',[0.3,0.8,0.3])
pause
plot(z,w3,'d','LineWidth',1,'Color',[0.3,0.3,0.8])
pause
plot(z,w4,'>','LineWidth',1,'Color',[0.8,0.8,0.8])
pause
plot(z,w5,'-','LineWidth',1,'Color',[0.6,0.2,0.9])
pause
plot(z,w6,'-','LineWidth',1,'Color',[0.9,0.1,0.3])
pause
plot(z,wc,'-','LineWidth',1,'Color',[0.1,0.1,0.5])
pause
legend('punti','spline lineare','nearest','prossimo','precedente','spline not-a-knot','hermite','spline clamped')


