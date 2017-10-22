%%
%               1�Laborat�rio de Modelacao e Simulacao                   
%                        2�Semestre - 2016/2017                                                                                                 
% Lu�s Almeida, n�81232                                                  
% Pedro Vasco, n�81880                                                   
% Grupo 11 Turno 2�feira 10h                                             

clear;
close all;
clc;
%% 1 - Simula��o do movimento livre de uma viatura

% Defini��o de constantes
beta=[5 10 10];
m=[30 5 150];
tauu=(-beta./m);

%%
% Gr�fico da velocidade

% Posi�ao inicial
y=5;

hold on;
grid on;

for i=1:3
	tau=tauu(i);

	v0=3;
	sim('diagramablocos');
	plot(t, v);

	v0=-3;
	sim('diagramablocos');
	plot(t, v);

end

title('Gr�fico de Velocidade');
xlabel('Tempo');
ylabel('Velocidade');
legend(sprintf('Tau=%d e Vo=3',tauu(1)),sprintf('Tau=%d e Vo=-3',tauu(1)),sprintf('Tau=%d e Vo=3',tauu(2)),sprintf('Tau=%d e Vo=-3',tauu(2)),sprintf('Tau=%d e Vo=3',tauu(3)),sprintf('Tau=%d e Vo=-3',tauu(3)));

hold off;

%%
% Como seria de esperar, dado que n�o � aplicada nenhuma for�a exterior, a for�a de atrito faz com que o carro pare ou seja, que a velocidade tenda para zero � medida que o tempo aumenta. 
% Quanto maior o $\tau$ maior a atenua��o da velocidade resultante da exponencial decrescente logo mais depressa a velocidade se aproxima de zero. Isto advem da constante de tempo ser 
% porporcional a constante de atrito, assim � l�gico que com o aumento da constante de atrito o carrinho tenda a parar mais rapidamente.

%%
% Grafico da posi��o

figure();
hold on;
grid on;

for i=1:3
	tau=tauu(i);	
	
	v0=3;
	sim('diagramablocos');
	plot(t, p);

	v0=-3;
	sim('diagramablocos');
	plot(t, p);
end

title('Gr�fico de Posi��o');
xlabel('Tempo');
ylabel('Posicao');
legend(sprintf('Tau=%d e Vo=3',tauu(1)),sprintf('Tau=%d e Vo=-3',tauu(1)),sprintf('Tau=%d e Vo=3',tauu(2)),sprintf('Tau=%d e Vo=-3',tauu(2)),sprintf('Tau=%d e Vo=3',tauu(3)),sprintf('Tau=%d e Vo=-3',tauu(3)));

%%
% Tal como acontece no caso da velocidade, quanto maior o $\tau$ menor a varia��o da posi��o dado que a velocidade tamb�m tende mais depressa para zero

%% 2.2 - Modelo Predador-Presa
clear;
close all;

% Tempo de simula��o simtime e valores das constantes alfa1 e alfa2
simtime=10;
step=0.1;
alfa1=1;
alfa2=1;

% Defini��o de valores iniciais de N1 e N2
vN1_0=[0.5 10];
vN2_0=[0.5 10];

%%
% Gr�ficos para $\delta_1$ e $\delta_2$ positivos

% Defini��o dos deltas
delta1=1;
delta2=1;

% Simula��o para as diferentes combina��es de valores iniciais
for i=1:2
	N1_0=vN1_0(i);
	for j=1:2
		N2_0=vN2_0(j);
 
		sim('predadorpresas');
		figure();
		plotyy(t,N1,t,N2);
        
		grid on;
		xlabel('Tempo');
		ylabel('N�mero de esp�cies');
		title('Evolu��o Predador Presa');
		legend(sprintf('N1_0=%d',vN1_0(i)),sprintf('N2_0=%d',vN2_0(j)));
	end
end

%%
% Tal como previsto teoricamente, com os dois deltas positivos as presas v�o se extinguir enquanto que os predadores v�o aumentar indefinidamente. Enquanto
% o numero de predadores � menor que $\delta_1$ as presas cresecem mas dado que os predadores crescem sempre as presas acabam por se extinguir.

%%
% Gr�ficos para $\delta_1$ positivo e $\delta_2$ negativo

% Defini��o dos deltas
delta1=1;
delta2=-1;

simtime=50;
% Simula��o para as diferentes combina��es de valores iniciais
for i=1:2
	N1_0=vN1_0(i);
	for j=1:2
		N2_0=vN2_0(j);
 
		sim('predadorpresas2');
		figure();
		plotyy(t,N1,t,N2);
        
		grid on;
		xlabel('Tempo');
		ylabel('N�mero de esp�cies');
		title('Evolu��o Predador Presa');
		legend(sprintf('N1_0=%d',vN1_0(i)),sprintf('N2_0=%d',vN2_0(j)));
	end
end

%%
% Quando o numero de predadores diminui para um valor menor que $\delta_1$, o numero de presas come�a a aumentar. O mesmo acontece para o caso contr�rio.
% Verifica-se ent�o o regime oscilat�rio previsto espelhado nos gr�ficos de simula��o.

%%
% Gr�ficos para $\delta_1$ negativo e $\delta_2$ positivo

% Defini��o dos deltas
delta1=-1;
delta2=1;

simtime=10;

% Simula��o para as diferentes combina��es de valores iniciais
for i=1:2
	N1_0=vN1_0(i);
	for j=1:2
		N2_0=vN2_0(j);
 
		sim('predadorpresas');
		figure();
		plotyy(t,N1,t,N2);
        
		grid on;
		xlabel('Tempo');
		ylabel('N�mero de esp�cies');
		title('Evolu��o Predador Presa');
		legend(sprintf('N1_0=%d',vN1_0(i)),sprintf('N2_0=%d',vN2_0(j)));
	end
end

%%
% Neste caso, como o numero de presas diminui sempre e o numero de predadres aumenta sempre independentemente dos valores de $\delta$, as  presas extinguem-se
% e os predadores aumentam indefinidamente

%%
% Gr�ficos para $\delta_1$ e $\delta_2$ negativos

% Defini��o dos deltas
delta1=-1;
delta2=-1;

% Simula��o para as diferentes combina��es de valores iniciais
for i=1:2
	N1_0=vN1_0(i);
	for j=1:2
		N2_0=vN2_0(j);
 
		sim('predadorpresas');
		figure();
		plotyy(t,N1,t,N2);
        
		grid on;
		xlabel('Tempo');
		ylabel('N�mero de esp�cies');
		title('Evolu��o Predador Presa');
		legend(sprintf('N1_0=%d',vN1_0(i)),sprintf('N2_0=%d',vN2_0(j)));
	end
end

%%
% Neste caso o n�mero de presas diminui sempre at� que se extinguem. Relativamente aos predadores, quando a popula��o de presas passa a ser pequena
% o numero de predadores come�a a diminuir. Como as presas se extinguem, os predadores acabam por se extinguir tamb�m.

%% 2.3 - Modelo Predador-Presa
clear;
close all;

% Defini��o dos alfas e tempo de simula��o
simtime=10;
step=0.1;
alfa1=1;
alfa2=1;

% Valores iniciais das esp�cies
vN1_0=[0.5 5];
vN2_0=[0.5 5];

%%
% Regime oscilat�rio
delta1=1;
delta2=-1;
for i=1:2
	N1_0=vN1_0(i);
	for j=1:2
		N2_0=vN2_0(j);
 
		sim('predadorpresas2');
		figure();
		plot(N1,N2);
		grid on;
		xlabel('N1');
		ylabel('N2');
		title('Regime Oscilat�rio');
	end
end

%%
% Tal como previsto teoricamente, verificamos aqui o regime oscilat�rio

%%
%Regime n�o oscilat�rio
delta1=1;
delta2=1;
for i=1:2
	N1_0=vN1_0(i);
	for j=1:2
		N2_0=vN2_0(j);
 
		sim('predadorpresas2');
		figure();
		plot(N1,N2);
		axis ([0 6 0 15]);
		grid on;  
		xlabel('N1');
		ylabel('N2');
		title('Regime N�o Oscilat�rio');
	end
end

%%
% Tal como visto nos gr�ficos temporais, verificamos aqui a extin��o de presas e aumento indefinido de predadores

%%
% Ponto de Equil�brio

% Defini��o de valores iniciais
N1_0=0.5;
N2_0=0.5;
alfa1=1;
alfa2=1;

delta1=0.5;
delta2=-0.5;
 
sim('predadorpresas');
figure();
plot(N1,N2,'X');
xlabel('N1');
ylabel('N2');
title('Ponto de equilibrio: Espa�o de fase');

sim('predadorpresas');
figure();
plot(t,N1,t,N2);
        
axis ([0 10 0 1]);
grid on;
xlabel('Tempo');
ylabel('N�mero de esp�cies');
legend(sprintf('N1_0=%d e N2_0=%d',N1_0,N2_0));
title('Ponto de equilibrio');

%%
% Teoricamente o sistema estaria em equil�brio se $N2_0=\frac{\delta_1}{\alpha_1}$ e $N1_0=-\frac{\delta_2}{\alpha_2}$ logo dado os valores de $\delta$ e $\alpha$
% que consideramos $N2_0=0.5$ e $N1_0=0.5$. Pela simula��o vemos que o n�mero de esp�cies n�o varia no tempo logo o sistema est� em equil�brio.

%%Condicoes iniciais em que conduzem a evolucoes identicas do sistema,
%a menos de um deslocamento temporal

simtime=100;
N1_0=0.5;
N2_0=5;

sim('predadorpresas');
figure();
plot(t,N1,t,N2);
axis ([0 100 0 6]);        
grid on;
xlabel('Tempo');
ylabel('Numero de especies');
legend(sprintf('N1_0=%d e N2_0=%d',N1_0,N2_0));
			
N1_0=3;
N2_0=2;

sim('predadorpresas');
figure();
plot(t,N1,t,N2);
axis ([0 100 0 6]);        
grid on;
xlabel('Tempo');
ylabel('Numero de especies');
legend(sprintf('N1_0=%d e N2_0=%d',N1_0,N2_0));

%% 2.4 - Modelo Predador-Presa

clear;
close all;

load('presas.mat');
step=0.1;
delta1=3.1;
delta2=-1.5;
alfa1=1.4;
N1_0=4;

% Parametros determinados por tentativa erro de modo a que a simula��o se aproxime dos valores reais
N2_0=1.6;
alfa2=0.7;

sim('predadorpresas',tr)
figure();
plot(tr,yr,t,N1);
grid on;
xlabel('Tempo');
ylabel('N1');
title('Compara��o dos valores reais com simula��o');

%%
% Alinea b)

%%
% Esta estrat�gia n�o ir� produzir uma solu��o que corresponde fielmente ao valor de erro mais adequado. Supondo que existe um pico experimental,
% com valor substancialmente maior que o simulado, a fun��o ir� ter em conta apenas este valor ignorando quaisqueres outros valores de erro mais pequenos.
% Dado isto, n�o iremos ter no��o se o modelo de simula��o est� adequado pois dado s� olharmos para o m�ximo n�o sabemos qual a erro de simula��o no resto da fun��o.

step=0.1;

load('presas.mat');
simtime=tr;
delta1=3.1;
delta2=-1.5;
alfa1=1.4;
N1_0=4;

N2_0=1.6;
alfa2=0.7;

sim('predadorpresas',tr);

valfa2=[0.6:0.02:0.8];
vN2_0=[1.4:0.02:1.8];


i=0;
j=0;

for alfa2= 0.6:0.02:0.8
	j=j+1;
	for N2_0= 1.4:0.02:1.8
		i=i+1;
		
		V=[alfa2, N2_0];
		erro(j,i)=max_dif(V);	
	end
	i=0;
	h=waitbar(j/length(vN2_0));
end
delete(h);

figure();
mesh(vN2_0,valfa2,erro);
xlabel('N2_0');
ylabel('\alpha_2');
zlabel('erro');
title('Superf�cie de erro');
figure();
surf(vN2_0,valfa2,erro);
xlabel('N2_0');
ylabel('\alpha_2');
zlabel('erro');
title('Superf�cie de erro');

%%
% Dado que o que visualizamos � uma superf�cie podemos estimar a regi�o de valores em que se situa o m�nimo (zona mais escura). Em seguida, o mais adequado ser�
% ir diminuindo os valores m�ximos e minimos de alfa2 e N2_0 de modo a chegarmos a regi�es cada vez mais pequenos e com menor erro. No entanto, por mais
% que se diminua os intervalos m�nimos e m�ximos iremos sempre ter uma regi�o (cada vez melhore representativa do m�nimo) mas nunca um ponto exato.

valfa22=[0.7:0.01:0.75];
vN2_00=[1.6:0.01:1.7];


i=0;
j=0;

for alfa22= 0.7:0.01:0.75
	j=j+1;
	for N2_00= 1.6:0.01:1.7
		i=i+1;
		
		V2=[alfa22, N2_00];
		erro2(j,i)=max_dif(V2);	
	end
	i=0;
	h=waitbar(j/length(vN2_00));
end
delete(h);

figure();
mesh(vN2_00,valfa22,erro2);
xlabel('N2_0');
ylabel('\alpha_2');
zlabel('erro');
title('Superf�cie de erro');
figure();
surf(vN2_00,valfa22,erro2);
xlabel('N2_0');
ylabel('\alpha_2');
zlabel('erro');
title('Superf�cie de erro');

%%
% Dimiuindo ainda mais os intervalos considerado para as constantes

valfa23=[0.7045:0.0001:0.7048];
vN2_000=[1.6138:0.0001:1.6151];

i=0;
j=0;

for alfa23= 0.7045:0.0001:0.7048
	j=j+1;
	for N2_000= 1.6138:0.0001:1.6151
		i=i+1;
		
		V3=[alfa23, N2_000];
		erro3(j,i)=max_dif(V3);	
	end
	i=0;
	h=waitbar(j/length(vN2_000));
end
delete(h);

figure();
mesh(vN2_000,valfa23,erro3);
xlabel('N2_0');
ylabel('\alpha_2');
zlabel('erro');
title('Superf�cie de erro');
figure();
surf(vN2_000,valfa23,erro3);
xlabel('N2_0');
ylabel('\alpha_2');
zlabel('erro');
title('Superf�cie de erro');

% O valor minimo determinado usando este m�todo: alfa=0.7047 e n2_0=1.614

%%
% al�nea c)

%%
% Valores iniciais: alfa2=0.6 e N2_0=1.4
xo=[0.6 ,1.4];
fun = @max_dif;
[x,erro]=fminsearch(fun, xo);
fprintf('O erro � %d, para alfa2 = %d e N2_0=%d',erro, x(1), x(2));

%%
% Valores iniciais: alfa2=4.7 e N2_0=10
xo=[4.7 ,10];
fun = @max_dif;
[x,erro]=fminsearch(fun, xo);
fprintf('O erro � %d, para alfa2 = %d e N2_0=%d',erro, x(1), x(2));

%%
% Valores iniciais: alfa2=0.1 e N2_0=1.4
xo=[0.1 ,1.4];
fun = @max_dif;
[x,erro]=fminsearch(fun, xo);
fprintf('O erro � %d, para alfa2 = %d e N2_0=%d',erro, x(1), x(2));

%%
% Valores iniciais: alfa2=0.6 e N2_0=5.8
xo=[0.6 ,5.8];
fun = @max_dif;
[x,erro]=fminsearch(fun, xo);
fprintf('O erro � %d, para alfa2 = %d e N2_0=%d',erro, x(1), x(2));

%%
% Verificamos que os resultados produzidos por fminsearch est�o proximos dos valores determinados atrav�s da procura exaustiva da alinea anterior.
% Como � visivel na ultima evoca��o que fazemos � fun��o fminsearch, verificamos que esta n�o converge para o m�nimo para qualquer valor de alfa e n2.
% Como os valores inicias est�o muito distantes dos que produzem solu��o m�nima, o m�todo n�o converge.

%%
% alinea d)

load('presas.mat');
step=0.1;
delta1=3.1;
delta2=-1.5;
alfa1=1.4;
N1_0=4;

N2_0=x(2);
alfa2=x(1);

sim('predadorpresas',tr)
figure();
plot(tr,yr,'o');
hold on;
plot(t,N1,'-');
grid on;
xlabel('Tempo');
ylabel('N1');
title('Compara��o do real com simulado');

% Verificamos que os valores minimos determinados pela fun��o fminsearch conduzem a uma boa aproxima��o da realidade

%% 3.1 - Sistema Ca�tico

clear;
close all;
simtime=10;
m=1;
teta1_0=0.2;
teta2_0=0.2;
l=0.5;
g=9.8;
p1_0=0;
p2_0=0;
sim('pendulo');

% Representa��o dos angulos em fun��o do tempo
figure();
hold on;
grid on;
plot(t, teta1);
plot(t, teta2);
xlabel('Tempo');
ylabel('\theta');
hold off;

% Representa��o dos angulos no plano (teta1,teta2)
figure();
plot(teta1, teta2);
grid on;
xlabel('\theta_1');
ylabel('\theta_2');
title('Curvas de Lisajous');

%% 3.2 - Sistema Ca�tico

x=l*(sin(teta2)+sin(teta1));
y=-l*(cos(teta2)+cos(teta1));

% Sistema n�o ca�tico
figure();
plot(x,y);
xlabel('x');
ylabel('y');
title('Sistema n�o ca�tico');

% Representa��o dos angulos no plano (teta1,teta2)
figure();
plot(teta1, teta2);
grid on;
xlabel('\theta_1');
ylabel('\theta_2');
title('Sistema n�o ca�tico');

%%
% Sistema ca�tico (quando se aumenta os angulos iniciais)
teta1_0=5;
teta2_0=5;
sim('pendulo');

x=l*(sin(teta2)+sin(teta1));
y=-l*(cos(teta2)+cos(teta1));
 
figure();
plot(x,y);
xlabel('x');
ylabel('y');
title('Sistema ca�tico');

% Representa��o dos angulos no plano (teta1,teta2)
figure();
plot(teta1, teta2);
grid on;
xlabel('\theta_1');
ylabel('\theta_2');
title('Sistema ca�tico');

%%
% Novo aumento dos angulos inciais
teta1_0=10;
teta2_0=10;
sim('pendulo');

x=l*(sin(teta2)+sin(teta1));
y=-l*(cos(teta2)+cos(teta1));
 
figure();
plot(x,y);
xlabel('x');
ylabel('y');
title('Sistema ainda mais ca�tico');

% Representa��o dos angulos no plano (teta1,teta2)
figure();
plot(teta1, teta2);
grid on;
xlabel('\theta_1');
ylabel('\theta_2');
title('Sistema ainda mais ca�tico');

%% 3.4 - Sistema Ca�tico

clear;
close all;

% Defini��o de vari�veis
m=1;
l=0.5;
g=9.8;
dteta1=0;
dteta2=-30*pi/180;
simtime=250;

% Matriz de pontos (x,y)
x=-1:(0.15):1;
y=-1:(0.15):1;

tamanhovetor=length(x);

% Ciclo for que percorre a matriz de (x,y) de modo a calcular os tempos de loop do pendulo
for i=1:1:tamanhovetor
	for j=1:1:tamanhovetor
		if (((x(i)^2)+(y(j)^2))>(2*l)^2 )
		tempo(tamanhovetor-j+1,i)=NaN;
		continue;
		else
		 A=(x(i)^2)+y(j)^2;
		y1=(y(j)*A-sqrt((y(j)^2)*A^2-A*(A^2-(l^2)*4*x(i)^2)))/(2*A);
		x1=sqrt((l^2)-(y1)^2);
		if x<0
		x1=-x1;
		end
		teta1_0=atan2(x1,y1);
		teta2_0=atan2(x(i)-x1,y(j)-y1);
		p1_0=(1/6)*m*l*l*(8*dteta1+3*dteta2*cos(teta1_0-teta2_0));
		p2_0=(1/6)*m*l*l*(2*dteta2+3*dteta1*cos(teta1_0-teta2_0)); 
		
		
		
		
		sim('pendulo');
		indice=find((teta2<-pi) | (teta2>pi)|(teta1<-pi) | (teta1>pi),1);
		 if indice~=0;
		 	tempo(tamanhovetor-j+1,i)=t(indice);
		 else
			tempo(tamanhovetor-j+1,i)=NaN;
		 end
		
		end
	
	end
	

end

% Gr�fico de cores para representar o tempo decorrido at� loop. Cores mais escuras correspondem a tempos menores
figure();
pcolor(x, y, log(tempo));
colorbar;
title('Tempo at� loop');
xlabel('x');
ylabel('y');

%%
% Intervalo de 0 a 30 segundos
x=-0.7;
y=-0.1;

A=(x^2)+y^2;
y1=(y*A-sqrt((y^2)*A^2-A*(A^2-(l^2)*4*x^2)))/(2*A);
x1=sqrt((l^2)-(y1)^2);
			
if x<0
	x1=-x1;
end
			
teta1_0=atan2(x1,y1);
teta2_0=atan2(x-x1,y-y1);
p1_0=(1/6)*m*l*l*(8*dteta1+3*dteta2*cos(teta1_0-teta2_0));
p2_0=(1/6)*m*l*l*(2*dteta2+3*dteta1*cos(teta1_0-teta2_0));

sim('pendulo');
		
figure();		
plot(t,teta2);
hold on;
grid on;
k=find((teta2<-pi)|(teta2>pi),1);
scatter(t(k), teta2(k), 'x');
xlim([0 30]);
xlabel('Tempo (s)');
ylabel('\theta');
title('Intervalo [0,30]s');
legend(sprintf('Instante de looping=%d',t(k)));
hold off;

%%
% Intervalo de 30 a 100 segundos

x=-0.55;
y=0.65;

A=(x^2)+y^2;
y1=(y*A-sqrt((y^2)*A^2-A*(A^2-(l^2)*4*x^2)))/(2*A);
x1=sqrt((l^2)-(y1)^2);
			
if x<0
	x1=-x1;
end
			
teta1_0=atan2(x1,y1);
teta2_0=atan2(x-x1,y-y1);
p1_0=(1/6)*m*l*l*(8*dteta1+3*dteta2*cos(teta1_0-teta2_0));
p2_0=(1/6)*m*l*l*(2*dteta2+3*dteta1*cos(teta1_0-teta2_0));
		
sim('pendulo');
		
figure();		
plot(t,teta2);
hold on;
grid on;
k=find((teta2<-pi)|(teta2>pi),1);
scatter(t(k), teta2(k), 'x');
xlim([30 100]);
xlabel('Tempo (s)');
ylabel('\theta');
title('Intervalo [30,100]s');
legend(sprintf('Instante de looping=%d',t(k)));
hold off;

%%
% Intervalo de 100 a 250 segundos

x=0.8;
y=-0.55;

A=(x^2)+y^2;
y1=(y*A-sqrt((y^2)*A^2-A*(A^2-(l^2)*4*x^2)))/(2*A);
x1=sqrt((l^2)-(y1)^2);
			
if x<0
	x1=-x1;
end
			
teta1_0=atan2(x1,y1);
teta2_0=atan2(x-x1,y-y1);
p1_0=(1/6)*m*l*l*(8*dteta1+3*dteta2*cos(teta1_0-teta2_0));
p2_0=(1/6)*m*l*l*(2*dteta2+3*dteta1*cos(teta1_0-teta2_0));
		
sim('pendulo');
		
figure();
hold on;		
plot(t,teta2);
grid on;
k=find((teta2<-pi)|(teta2>pi),1);
scatter(t(k), teta2(k), 'x');
xlim([100 250]);
xlabel('Tempo (s)');
ylabel('\theta');
title('Intervalo [100,250]s');
legend(sprintf('Instante de looping=%d',t(k)));
hold off;

%%
% Verificamos que o $\theta_1$ n�o d� nenhum loop. Isto acontece porque, dado que a sua velocidade angular � nula, a velocidade que apresenta resulta apenas da
% transforma��o da energia potencial em cin�tica. Concluimos ent�o que a sua energia potencial m�xima n�o permite imprimir-lhe uma velocidade
% suficiente para que ele realize o loop. Atrav�s da an�lise do gr�fico de cores, vemos os loops demoram mais tempo quando o valor de y � mais pequeno. 
% Isto acontece porque nesta zona do plano a energia potencial � menor.
