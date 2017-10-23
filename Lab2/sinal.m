function [u,t] = sinal( T, alfa, beta, U1, U2, n1, n2 )

	T1=T/(1+alfa);

	t1=-(1+beta)/2:(1+beta)/(n1-1):(1+beta)/2;

	pbeta1 = impulso2( t1, beta, -U1);

	for i=1:1:length(t1)
		a=t1(i);
		t1(i)=(a*(T1/(1+beta))+T1/2);
	end

	t1(length(t1))=[];
	pbeta1(length(pbeta1))=[];

	t2=-(1+beta)/2:(1+beta)/(n2-1):(1+beta)/2;

	pbeta2 = impulso2( t2, beta, U2);

	for i=1:1:length(t2)
		a=t2(i);
		t2(i)=(a*(alfa*T1/(1+beta))+(alfa*T1)/2)+T1;
	end

	u=[pbeta1,pbeta2];
	t=[t1,t2];
	
end