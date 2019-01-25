%%              3 Laboratorio de Modelacao e Simulacao

%%
%               3 Laboratorio de Modelacao e Simulacao                   
%                        2Semestre - 2016/2017                                                                                                 
% Luis Almeida, n 81232                                                  
% Pedro Vasco, n 81880                                                   
% Grupo 11 Turno 2 feira 10h      

warning off;
clear all;
close all;
clc;

%% 5.

% Definicao de constantes
L=0.5;
M=0.15;
l=0.4;
m=0.2;
k=3;
beta=0.1;
g=9.8;

% Tempos de simulacao
simtime=10;
step=0.01;

% Calculo de momento de inercia e variavel auxiliar a de modo a simplificar as expressoes
J=(1/3)*M*(L^2)+m*(l^2);
a=(M*L)/2+m*l;

% Condicoes iniciais
u=0;
teta0=pi/4;
dteta0=0;

sim('p5');

% Graficos de simulacao
figure();
plot(tsim,teta);
title('Evolucao da posicao');
xlabel('Tempo (s)');
ylabel('Posicao (\theta)');

figure();
plot(tsim,dteta);
title('Evolucao da velocidade');
xlabel('Tempo (s)');
ylabel('$$ Velocidade (\dot{\theta})$$','interpreter','latex');

figure();
plot(teta,dteta);
title('Espaco de Estados');
xlabel('Posicao (\theta)');
ylabel('$$ Velocidade (\dot{\theta})$$','interpreter','latex');

%% 
% Atraves da analise dos diferentes graficos podemos concluir que o sistema e estavel em torno do ponto de equilibrio que e a origem. 
% Se tivermos em atencao o grafico do espaco de estados e evidente a convergencia das variaveis de estados para o ponto de equilibrio.
% Isto deve-se a nao haver nenhum binario externo aplicado e ter uma
% constante diferente de zero, isto e considera-se que ha efeito de atrito. Sendo assim as unicas forcas aplicadas ao metromono sao a forca gravitica
% e a forca de restituicao da mola.

%% 6.

clear all;
close all;
clc;

% Definicao de constantes
L=0.5;
M=0.15;
l=0.4;
m=0.2;
k=3;
beta=0.1;
g=9.8;

% Tempos de simulacao
simtime=10;
step=0.01;

% Calculo de momento de inercia e variavel auxiliar a de modo a simplificar as expressoes
J=(1/3)*M*(L^2)+m*(l^2);
a=(M*L)/2+m*l;

% Definicao de matrizes do modelo em espaco de estados
A=[ 0 1 ; (1/J)*(g*a-k) -beta/J ];
B=[ 0 ; 1/J ];
C=[ 1 0 ; 0 1 ];
D=[ 0 ; 0 ];

% Condicoes iniciais
u=0;
cinit=[ pi/4 ; 0 ];

sim('p6');

% Graficos de simulacao
figure();
plot(tsim,y(:,1));
title('Evolucao da posicao');
xlabel('Tempo (s)');
ylabel('Posicao (\theta)');

figure();
plot(tsim,y(:,2));
title('Evolucao da velocidade');
xlabel('Tempo (s)');
ylabel('$$ Velocidade (\dot{\theta})$$','interpreter','latex');

figure();
plot(y(:,1),y(:,2));
title('Espaco de Estados');
xlabel('Posicao (\theta)');
ylabel('$$ Velocidade (\dot{\theta})$$','interpreter','latex');

%%
% E possivel constatar que obtemos os mesmos resultados que na alinea anterior uma vez que nestes graficos tambem e possivel observar tende para o ponto
% de equilibrio, tal como era esperado tal como era suposto. Para efeitos de simulacao convem que a matriz C seja uma matriz identidade de modo a que 
% a saida corrasponda as variaveis de estado.

%% 7.

clear all;
close all;
clc;

% Considerando beta=0

% Definicao de constantes
L=0.5;
M=0.15;
l=0.4;
m=0.2;
k=3;
beta=0;
g=9.8;

% Tempos de simulacao
simtime=5;
step=0.01;

% Calculo de momento de inercia e variavel auxiliar a de modo a simplificar as expressoes
J=(1/3)*M*(L^2)+m*(l^2);
a=(M*L)/2+m*l;

% Definicao de matrizes do modelo em espaco de estados
A=[ 0 1 ; (1/J)*(g*a-k) -beta/J ];
B=[ 0 ; 1/J ];
C=[ 1 0 ; 0 1 ];
D=[ 0 ; 0 ];

% Condicoes iniciais
u=0;
cinit=[ pi/4 ; 0 ];

sim('p6');

% Graficos de simulacao
figure();
plot(tsim,y(:,1));
title('Evolucao da posicao \beta=0');
xlabel('Tempo (s)');
ylabel('Posicao (\theta)');

figure();
plot(tsim,y(:,2));
title('Evolucao da velocidade \beta=0');
xlabel('Tempo (s)');
ylabel('$$ Velocidade (\dot{\theta})$$','interpreter','latex');

figure();
plot(y(:,1),y(:,2));
title('Espaco de Estados  \beta=0');
xlabel('Posicao (\theta)');
ylabel('$$ Velocidade (\dot{\theta})$$','interpreter','latex');

%%
% Para $\beta=0$ considerado a forca de atrito e nula, portanto o unico
% binario aplicada e a forca da mola e do peso, portanto nao vai haver nenhum
% amortecimento, o que leva o metromono a oscilar infinitvamente. Assim o
% espaco de estados nao vai tender para nenhum ponto de equilibrio.

%%
% Considerando beta=1

beta=1;

% Definicao de matrizes do modelo em espaco de estados
A=[ 0 1 ; (1/J)*(g*a-k) -beta/J ];
B=[ 0 ; 1/J ];
C=[ 1 0 ; 0 1 ];
D=[ 0 ; 0 ];

sim('p6');

% Graficos de simulacao
figure();
plot(tsim,y(:,1));
title('Evolucao da posicao \beta=1');
xlabel('Tempo (s)');
ylabel('Posicao (\theta)');

figure();
plot(tsim,y(:,2));
title('Evolucao da velocidade \beta=1');
xlabel('Tempo (s)');
ylabel('$$ Velocidade (\dot{\theta})$$','interpreter','latex');

figure();
plot(y(:,1),y(:,2));
title('Espaco de Estados \beta=1');
xlabel('Posicao (\theta)');
ylabel('$$ Velocidade (\dot{\theta})$$','interpreter','latex');

%% 
% Verifica-se que para  $\beta=1$ o atrito e bastante elevado, o que faz
% com que o metromono nao oscile e tenda imendiatamente para o ponto de
% equilibrio. Uma vez que a forca de atrito acaba por compensar muito
% depressa as outras forcas. Concluimos que se torna num sistema
% criticamente amortecido.

%%
% Diferentes condicoes inciais usando beta=1

% pos=pi/6 e v=0
cinit=[ pi/6 ; 0 ];

sim('p6');

figure();
plot(y(:,1),y(:,2));
hold on;

% pos=pi/2 e v=0
cinit=[ pi/2 ; 0 ];

sim('p6');

plot(y(:,1),y(:,2));

% Calculo do campo vetorial
[x1,x2] = meshgrid(-1.6:0.2:1.6,-3:0.5:3);
uu = x2;
v = (1/J)*(g*a-k)*x1-beta/J*x2;

% Tracado do campo vetorial
quiver(x1,x2,uu,v);

% pos=0 e v=2
cinit=[ 0 ; 2 ];

sim('p6');

plot(y(:,1),y(:,2));

% pos=-pi/6 e v=0
cinit=[ -pi/6 ; 0 ];

sim('p6');

plot(y(:,1),y(:,2));

% pos=-pi/2 e v=0
cinit=[ -pi/2 ; 0 ];

sim('p6');

plot(y(:,1),y(:,2));

hold off;

title('Espaco de Estados');
xlabel('Posicao (\theta)');
ylabel('$$ Velocidade (\dot{\theta})$$','interpreter','latex');
legend('\pi/6 e 0','\pi/2 e 0', '0 e 2','-\pi/6 e 0','-\pi/2 e 0');

% Calculo dos valores proprios
[vetor_proprio valor_proprio]=eig(A);
fprintf('Os valores proprios sao: %d e %d', valor_proprio(1,1), valor_proprio(2,2));

%%
% Uma vez que os valores proprios sao reais negativos, o plano de estados vai
% apresentar um no estavel. O espaco de estados depende dos vetores
% proprios uma vez que estes dependem das condicoes iniciais.

%%
% Diferentes condicoes inciais usando beta=0

beta=0;

% Definicao de matrizes do modelo em espaco de estados
A=[ 0 1 ; (1/J)*(g*a-k) -beta/J ];
B=[ 0 ; 1/J ];
C=[ 1 0 ; 0 1 ];
D=[ 0 ; 0 ];

% pos=pi/6 e v=0
cinit=[ pi/6 ; 0 ];

sim('p6');

figure();
plot(y(:,1),y(:,2));
hold on;

% pos=pi/2 e v=0
cinit=[ pi/2 ; 0 ];

sim('p6');

plot(y(:,1),y(:,2));

% pos=0 e v=2
cinit=[ 0 ; 2 ];

sim('p6');

plot(y(:,1),y(:,2));

% pos=-pi/6 e v=0
cinit=[ -pi/6 ; 0 ];

sim('p6');

plot(y(:,1),y(:,2));

% pos=-pi/2 e v=0
cinit=[ -pi/2 ; 0 ];

sim('p6');

plot(y(:,1),y(:,2));

% Calculo do campo vetorial
[x1,x2] = meshgrid(-2:0.2:2,-12:0.5:12);
uu = x2;
v = (1/J)*(g*a-k)*x1-beta/J*x2;

% Tracdo do campo vetorial
quiver(x1,x2,uu,v);
hold off;

title('Espaco de Estados');
xlabel('Posicao (\theta)');
ylabel('$$ Velocidade (\dot{\theta})$$','interpreter','latex');
legend('\pi/6 e 0','\pi/2 e 0', '0 e 2','-\pi/6 e 0','-\pi/2 e 0');

% Calculo dos valores proprios
[vetor_proprio valor_proprio]=eig(A);
fprintf('Os valores proprios sao: %d e %d', valor_proprio(1,1), valor_proprio(2,2));

%%
% Uma vez que os valores proprios da matriz são iguais a zero. Os valores próprios iram estar
% situados na origem do plano complexo logo vamos ter um centro. O plano de estados serao
% circunferencias em torno da origem. 
% Isto pode-se explicar atraves da conservacao da energia, uma vez que o atrito é nulo, assim o metromono nunca vai tender para uma 
% posicao de equilibrio.
%%
% Ainda consegue-se concluir que dependendo das condicoes iniciais do sistema 
% adquire uma energia diferente, deste modo a amplitude de oscilacao vai ser maior quanto maior for a energia do metromono.

%%
% Diferentes condicoes inciais usando beta=0.1

beta=0.1;

% Definicao de matrizes do modelo em espaco de estados
A=[ 0 1 ; (1/J)*(g*a-k) -beta/J ];
B=[ 0 ; 1/J ];
C=[ 1 0 ; 0 1 ];
D=[ 0 ; 0 ];

% pos=pi/6 e v=0
cinit=[ pi/6 ; 0 ];

sim('p6');

figure();
plot(y(:,1),y(:,2));
hold on;

% pos=pi/2 e v=0
cinit=[ pi/2 ; 0 ];

sim('p6');

plot(y(:,1),y(:,2));

% pos=0 e v=2
cinit=[ 0 ; 2 ];

sim('p6');

plot(y(:,1),y(:,2));

% pos=-pi/6 e v=0
cinit=[ -pi/6 ; 0 ];

sim('p6');

plot(y(:,1),y(:,2));

% pos=-pi/2 e v=0
cinit=[ -pi/2 ; 0 ];

sim('p6');

plot(y(:,1),y(:,2));

% Calculo do campo vetorial
[x1,x2] = meshgrid(-1.6:0.2:1.6,-9:0.5:9);
uu = x2;
v = (1/J)*(g*a-k)*x1-beta/J*x2;

% Tracado do campo vetorial
quiver(x1,x2,uu,v);
hold off;

% Calculo dos valores proprios
[vetor_proprio valor_proprio]=eig(A);
fprintf('Os valores proprios sao: %d e %d', valor_proprio(1,1), valor_proprio(2,2));

title('Espaco de Estados');
xlabel('Posicao (\theta)');
ylabel('$$ Velocidade (\dot{\theta})$$','interpreter','latex');
legend('\pi/6 e 0','\pi/2 e 0', '0 e 2','-\pi/6 e 0','-\pi/2 e 0');

%%
% Verificamos que os valores proprios da matriz A vao estar no plano
% complexo esquerdo garantindo a estabilidade do sistema. Sabemos ainda que
% o plano de estados vai apresentar um foco estavel.
% Notamos ainda que o atrito nao e tanto sentido uma vez que demora algum tempo a 
% tender para o ponto de equilibrio e nao fica a oscilar "eternamente".
%%
% Optamos por nao colocar como condicoes inciais posicao e velocidade nulas, pois como este
% e o ponto de equilibrio do sistema nao iriamos observar qualquer evolucao em
% espaco de estados.

%% 8.
% De forma a obter dois conjuntos de condicoes inicais a que conduzem a
% trajectorias rectilineas no plano de fase, decidimos calcular os valores
% proprios associado a matriz A uma vez que a direccao definida pelos vectores proprios permanece
% invariante na transformacao da matriz .

clear all;
close all;
clc;

beta=1;

% Definicao de constantes
L=0.5;
M=0.15;
l=0.4;
m=0.2;
k=3;
g=9.8;
u=0;

% Tempos de simulacao
simtime=5;
step=0.01;

% Calculo de momento de inercia e variavel auxiliar a de modo a simplificar as expressoes
J=(1/3)*M*(L^2)+m*(l^2);
a=(M*L)/2+m*l;

A=[ 0 1 ; (1/J)*(g*a-k) -beta/J ];
B=[ 0 ; 1/J ];
C=[ 1 0 ; 0 1 ];
D=[ 0 ; 0 ];

% Calculo de valores e vetores proprios
[vetor_proprio valor_proprio]=eig(A);

% Concicao inicial igual ao vetor proprio
cinit=(vetor_proprio(:,1));

sim('p6');

% Grafico espaco de estados
figure();
plot(y(:,1),y(:,2));
hold on;
title('Espaco de Estados');
xlabel('Posicao (\theta)');
ylabel('$$ Velocidade (\dot{\theta})$$','interpreter','latex');

% Concicao inicial igual ao vetor proprio
cinit=(vetor_proprio(:,2));

sim('p6');

% Grafico espaco de estados
figure();
plot(y(:,1),y(:,2));
title('Espaco de Estados');
xlabel('Posicao (\theta)');
ylabel('$$ Velocidade (\dot{\theta})$$','interpreter','latex');

%%
% O beta neste caso tem que ser igual a 1 para que o sistema seja criticamente amortecido de modo a nao oscilar.

%% 9.
% De forma a adimensionar o valor da massa e os valores da sua posicao, decidiu-se 
% fazer calcular os BPM para um variado numero de massas e da sua posicao na barra.
% Assim para determinar a massa e as suas posicoes a que corresponde as duas frequecencias dadas pelos docente, basta fazer um "varimento" 
% na matriz dos BPM a procura dos valores que satisfazem as frequecencias pedidas.


close all;
clear;
clc;

beta=0.001;

% Definicao de constantes
L=0.25;
M=0.1;
k=0.35;
g=9.8;
u=0;

BPM=[50 150];
wni=(BPM./120).*(2*pi);

% Grelha de pontos
mi=[0.01:0.001:0.21];
li=[0.05:0.001:0.25];

% Construcao da superfice com BPM em funcao da massa (m) e comprimento (l)
for i=1:1:length(mi)
	for j=1:1:length(li)
		J=(1/3)*M*(L^3)+mi(i)*(li(j)^2);
		wn(i,j)=sqrt((1/J)*(k-g*((M*L)/2+mi(i)*li(j))));
        bpm(i,j)=wn(i,j)*120/(2*pi);
		if(g*((M*L)/2+mi(i)*li(j))>k)	
			bpm(i,j)=NaN;
		end	
	end
end

figure();
surf(mi,li,bpm);
bar=colorbar();
bar.Label.String = 'BPM';
view(-180, 90);
xlabel('Comprimento (l)');
ylabel('Massa (m)');
zlabel('Batimentos por minuto (BPM)');
title('BPM em funcao de m e l');

%%

key=0;
lmin=0;
lmax=0;

% Procura do valor ideal para a massa
for i=1:1:length(mi)
    for j=1:1:length(li)
        
       	if(key==1)
           break;
       	end   
      
       	if(bpm(i,j)>=BPM(1) && bpm(i,j)<=BPM(1)+2)
           lmax=li(j);
       	end;  
       
        if(bpm(i,j)>=BPM(2)&&bpm(i,j)<=BPM(2)+2)
           lmin=li(j);
       	end; 
        
        if(lmax~=0 && lmin~=0)
            key==key+1;
            m=mi(i);
        end 

    end        
end

lvec=[lmax lmin];

% Simulacao para os valores maximos e minimo de comprimento
for i=1:2
	l=lvec(i);

	% Tempos de simulacao
	simtime=10;
	step=0.0001;

	% Calculo de momento de inercia e variavel auxiliar a de modo a simplificar as expressoes
	J=(1/3)*M*(L^3)+m*(l^2);
	a=(M*L)/2+m*l;

	A=[ 0 1 ; (1/J)*(g*a-k) -beta/J ]
	B=[ 0 ; 1/J ];
	C=[ 1 0 ; 0 1 ];
	D=[ 0 ; 0 ];

	% Calculo dos valores e vetores proprios
	[vetor_proprio valor_proprio]=eig(A);

	cinit=[pi/4; 0];

	sim('p6');

	figure();
	a=plot(tsim, y(:,1));
	hold on;
	title('Evolucao da posicao');
	xlabel('Tempo (s)');
	ylabel('Posicao (\theta)');

	posi(i,:)=y(:,1);

	coly=y(:,1).';

	[picos indice]=findpeaks(coly);
	freq(i)=1/(tsim(indice(2))-tsim(indice(1)));
	legend(sprintf('BPM calculado:%.4f\n BPM desejado :%.4f',freq(i)*120, wni(i)*120/(2*pi)));
	
	% Calculo das envolventes
	qsi=beta/(J*2*wni(i));
	w=y(1,1)*exp(-qsi*tsim*wni(i));
	
	plot(tsim,w,'r');
	plot(tsim,-w,'r');
	hold off;

	figure();
	plot(y(:,1),y(:,2));
	title('Espaco de Estados');
	xlabel('Posicao (\theta)');
	ylabel('$$ Velocidade (\dot{\theta})$$','interpreter','latex');
end

hold off;

%% 
% Como se pode ver nao ha grande diferenca entre as frequencias obtidas 
% atraves da simulacao e as pedidas

%% 10.
% Uma vez que o modelo linearizado e um modelo simplificado, apenas da um valor aproximado de onde as posicoes da massa estaram,
% assim simulando agora o modelo real do metromono conseguimos ajustar melhor as posicoes. Para tal efeito e aproveitando que se sabe
% que para uma posicao da massa mais afastada temos uma velocidade menor e vice versa, decidiu-se variar o comprimento da posicao da massa
% até se obter uma frequencia muito proxima da obtida.

% Definicao de constantes
L=0.25;
M=0.1;
m=0.2;
k=0.35;
beta=0.001;
g=9.8;
u=0;
freq=[0 0];

% Ciclo que determina os comprimentos máximos e minimos
while(abs(freq(1)-wni(1)/(2*pi))>0.01 ||abs(freq(2)-wni(2)/(2*pi))>0.01)
    for i=1:2
        l=lvec(i);

        % Tempos de simulacao
        simtime=15;
        step=0.0001;

        J=(1/3)*M*(L^3)+m*(l^2);
        a=(M*L)/2+m*l;

        % Condicoes iniciais
        teta0=pi/4;
        dteta0=0;

        sim('p102');
 
        coly=teta.';
        [picos indice]=findpeaks(coly);
        freq(i)=1/(tsim(indice(2))-tsim(indice(1)));     
    end

    if( abs(freq(1)-(wni(1)/(2*pi)))>0.01 || abs(freq(2)-(wni(2)/(2*pi)))>0.01)
        
        if (freq(1)<(wni(1)/(2*pi)))
            lvec(1)=lvec(1)-0.001;
        end
        if (freq(1)>(wni(1)/(2*pi)))
            lvec(1)=lvec(1)+0.001;
        end
        if (freq(2)<(wni(2)/(2*pi)))
            lvec(2)=lvec(2)-0.001;
        end
        if (freq(2)>(wni(2)/(2*pi)))
            lvec(2)=lvec(2)+0.001;
        end   
    end    
end

fprintf('Os novos valores para a posicao (l) da massa sao: %d e %d', lvec(1), lvec(2));

% Tracado dos graficos usando os novos comprimentos
for i=1:2
		
	l=lvec(i);

	J=(1/3)*M*(L^3)+m*(l^2);
    a=(M*L)/2+m*l;

	sim('p102');

	coly=teta.';
	[picos indice]=findpeaks(coly);
	freq(i)=1/(tsim(indice(2))-tsim(indice(1)));
        
    figure();
	plot(tsim, teta);
	hold on;
	title('Evolucao da posicao');
	xlabel('Tempo (s)');
	ylabel('Posicao (\theta)');
	legend(sprintf('BPM calculado:%.4f\n BPM desejado :%.4f',freq(i)*120, (wni(i)*120/(2*pi))));
	
	hold off;

	figure();
	plot(teta,dteta);
	title('Espaco de Estados');
	xlabel('Posicao (\theta)');
	ylabel('$$ Velocidade (\dot{\theta})$$','interpreter','latex');
end

%%
% Verificamos que apos o dimensionamento do novo valor de massa m, conseguimos obter valores de BPM proximos dos
% desejados

%% 11.

clear all;
close all; 
clc;

% Definicao de constantes
l=0.1;
m=0.2;
beta=0.002;
L=0.25;
M=0.1;
k=0.35;
g=9.8;

% Tempos de simulacao
simtime=40;
step=0.01;

% Calculo de momento de inercia e variavel auxiliar a de modo a simplificar as expressoes
J=(1/3)*M*(L^2)+m*(l^2);
a=(M*L)/2+m*l;

% Condicoes iniciais
u=0;
teta0=pi/4;
dteta0=0;

sim('p11s');

tetau=teta;
dtetau=dteta;
atetau=ateta;

u=0.5;

sim('p11s');

% Graficos de simulacao
figure();
plot(tsim,teta);
hold on;
plot(tsim,tetau);
hold off;
title('Evolucao da posicao');
xlabel('Tempo (s)');
ylabel('Posicao (\theta)');
legend(sprintf('Com binario aplicado'),sprintf('Sem binario aplicado'));

figure();
plot(tsim,dteta);
hold on;
plot(tsim,dtetau);
hold off;
title('Evolucao da velocidade');
xlabel('Tempo (s)');
ylabel('$$ Velocidade (\dot{\theta})$$','interpreter','latex');
legend(sprintf('Com binario aplicado'),sprintf('Sem binario aplicado'));

figure();
plot(tsim,ateta);
hold on;
plot(tsim,atetau);
hold off;
title('Evolucao da aceleracao');
xlabel('Tempo (s)');
ylabel('$$ Aceleracao (\ddot{\theta})$$','interpreter','latex');
legend(sprintf('Com binario aplicado'),sprintf('Sem binario aplicado'));

figure();
plot(tsim,bina);
title('Binario externo aplicado');
xlabel('Tempo (s)');
ylabel('Binario');

%%
% Neste caso, alteramos o modelo de simulink para que numa vizinhanca da posicao zero seja aplicado um certo binario
% constante ao sistema enquanto ele se encontra nessa vizinhanca. Ao fazer isto e possivel contrariar o efeito de 
% atrito e a consequente convergencia para zero da velocidade e posicao. Verifica se tambem que esta alteracao provoca
% um aumento na frequencia das oscilacoes do sistema. Esta diferenca de frequencias de oscilacao prende-se com facto de
% no caso em que nao ha binario aplicado, a energia do sistema vai diminuindo ao longo do tempo e consequentemente a
% sua frequencia tambem diminui. Com binario aplicado, a energia nao se perde logo a frequencia inicial mantem-se ao longo
% do tempo.

%% 12.

close all;
clc;
clear;

% Definicao de constantes
beta=0.001;
m=0.2100;

L=0.25;
M=0.1;
k=0.35;
g=9.8;

lvec=[ 0.1010 0.0670];
BPM=[50 150];
wni=(BPM./120).*(2*pi);

% Tracado dos dois diagramas de Bode
for i=1:2
   l=lvec(i);
   J=(1/3)*M*(L^3)+m*(l^2);
   H=tf([1/J],[1 beta/J (wni(i))^2]);
   bode(H);
   hold on;
   grid on;
end 

legend(sprintf('lmax (50 BPM)=%.3f', lvec(1)),sprintf('lmin (150 BPM)=%.3f', lvec(2)));
hold off;

%%
% A partir do grafico conseguimos ver que para uma posicao da massa mais
% afastada se obtem uma frequencia de corte e largura de banda menor e
% vice-versa, o que ja seria de esperar.
% O ganho aumenta a medida que a distancia a origem tambem aumenta uma vez
% que o grau de dificuldade de alterar o estado de movimento do metromono
% diminui.
%%
% Assim sendo para uma massa mais afastada e mais facil faze-lo girar ou
% mudar de direcao. Uma vez que a forca da mola vai ser oposta a forca que o
% peso faz, sendo a forca resultante destes dois muito pequena, 
% assim quando se aplica um binario pequeno nota-se logo o seu efeito.
% Ainda se conclui que quando se aumenta a posicao da massa, a velocidade
% do metromono desce, uma vez que a componente do peso sera superior
% levando a massa a atingir amplitudes do angulo maiores e portanto a forca
% disponivel para contrariar a forca do peso e menor o que provoca um
% decrescimo na velociadade do metromono.
%%
% Os diagramas apresentados, assemelham-se aos diagramas de um filtro passa-baixo
% com dois polos duplos na mesma frequencia 

%% 13.

clear all;
close all;
clc;

% Definicao de constantes
L=0.25;
M=0.1;
l=0.1010;
m=0.21;
k=0.35;
beta=0.01;
g=9.8;

% Tempos de simulacao
simtime=10;
step=0.01;

% Calculo de momento de inercia e variavel auxiliar a de modo a simplificar as expressoes
J=(1/3)*M*(L^2)+m*(l^2);
a=(M*L)/2+m*l;

% Definicao de matrizes do modelo em espaco de estados
A=[ 0 1 ; (1/J)*(g*a-k) -beta/J ];
B=[ 0 ; 1/J ];
C=[ 1 0 ; 0 1 ];
D=[ 0 ; 0 ];

% Condicoes iniciais
u=0.1;
phase=0;
cinit=[ pi/4 ; 0 ];

%v_wn=1:1:13000;
v_wn=1.34:0.00001:1.36;

% Construcao de vetor com maximo de amplitude em funcao da frequencia
for i=1:1:length(v_wn)

	wn=v_wn(i);

	sim('p13');

	maximos(i)=max(y(:,1));

end

% Procura da frequencia que origina maior amplitude
[max_amp, p_max_amp]=max(maximos);

wn_desejado=v_wn(p_max_amp);
wn=wn_desejado;

% Calculo da nova massa
m=(((k-J*wn^2)/g)-M*L/2)/l;

fprintf('A nova massa e: %d', m);

% Simulacao do sistema
J=(1/3)*M*(L^2)+m*(l^2);
a=(M*L)/2+m*l;
simtime=30;

sim('p13');

figure();
plot(tsim,y(:,1));
title('Evolucao da posicao');
xlabel('Tempo (s)');
ylabel('Posicao (\theta)');

figure();
plot(tsim,y(:,2));
title('Evolucao da velocidade');
xlabel('Tempo (s)');
ylabel('$$ Velocidade (\dot{\theta})$$','interpreter','latex');

%%
% A aplicacao de um binario constante numa vizinhanca do posicao zero, nao e benefico para o sistema
% pois aplica ao sistema um binario repentino consideravelmente maior que o valor de binario ao qual
% ja esta sujeito o sistema. Isto provocara desgaste mecanico no metronomo.
%%
% Para determinar o valor da massa m comecamos por fazer um varrimento entre as frequencias 0.1 e 100k 
% (nao apresentado no codigo) para verficar em que zona tinhamos os maximos de oscilacao (correspondente a frequencia de ressonancia).
% Feito isto, diminuimos e especificamos o intervalo em torno da frequencia de ressonancia (feito no codigo) para determinar
% com exatidao o valor da frequencia de ressonancia. Por fim, usando a formula da frequencia calculada na pergunta 2, obtivemos a
% expressao para calcular a massa m. Verificamos que a massa m calculada usando este metodo se encontra proxima da calculada na 
% alinea anterior.
