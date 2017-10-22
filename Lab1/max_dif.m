function erroo = max_dif( V )

	step=0.1;
	simtime=20;

	load('presas.mat');
	delta1=3.1;
	delta2=-1.5;
	alfa1=1.4;
	N1_0=4;

	alfa2=V(1);
	N2_0=V(2);

	sim('predadorpresas',tr,simset('SrcWorkspace','current'));
    
	erroo=max(abs(yr-N1));

end

