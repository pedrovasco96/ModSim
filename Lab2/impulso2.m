function pbeta = impulso2( t, beta, U)

	tamanhovetor=length(t);

	for i=1:1:tamanhovetor
		if(t(i)<=-(beta+1)/2)
			pbeta(i)=0;
		end
        if(-(beta+1)/2<t(i) && t(i)<=-1/2)
			pbeta(i)=U*((2/(beta)^2)*(t(i)+1/2)^2+(2/beta)*(t(i)+1/2)+1/2);
		end
        if(-1/2<t(i) && t(i)<=(beta-1)/2)
			pbeta(i)=U*(-(2/(beta)^2)*(t(i)+1/2)^2+(2/beta)*(t(i)+1/2)+1/2);
		end
        if((beta-1)/2<t(i) && t(i)<=(1-beta)/2)
			pbeta(i)=U;
		end
        if((1-beta)/2<t(i) && t(i)<=1/2)
			pbeta(i)=U*(1/2-(2/(beta)^2)*(t(i)-1/2)^2-(2/beta)*(t(i)-1/2));
		end
        if(1/2<t(i) && t(i)<=(beta+1)/2)
			pbeta(i)=U*(1/2+(2/(beta)^2)*(t(i)-1/2)^2-(2/beta)*(t(i)-1/2));
		end
		if (t(i)>(beta+1)/2)
			pbeta(i)=0;
		end
	end
end