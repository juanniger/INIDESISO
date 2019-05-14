 function WN=ruidoblanco(NP,P)  
b=rand(NP,1); 
fi=2*pi*rand(NP,1); 
r=sqrt(-2*P*log(1-b)); 
WN=r.*cos(fi);
