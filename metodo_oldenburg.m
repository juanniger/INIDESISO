function ft=metodo_oldenburg(datos_id)
ys=datos_id.y;
us=datos_id.u;
tm=datos_id.Ts;%Intervalo de muestreo
t=(0:tm:(length(ys)-1)*tm);
long=length(t);
tf1=t(long);%valor final de t
i=0;
tp=-tm;
p=1;

pendi=zeros(long-1,1);
%calculo del punto de inflexion
for i=1:long-1
    pendi(i)=(ys(i+1)-ys(i))/tm;
end
i=0;
while p>=0
    tp=tp+tm;
    i=i+1;
    p1=ys(i+1)-ys(i);
    p2=ys(i+2)-ys(i+1);
    p=p2-p1;
end

ti=tp+tm;%Éste es el valor de t donde ocurre el punto de inflexión
tinf=ti;
pendiente=(p1+p2)/(2*tm);
yini=ys(1);
yfin=ys(long);
yinf=ys(i+1);


tini=(yini-yinf+pendiente*tinf)/pendiente;
tfin=(yfin-yinf+pendiente*tinf)/pendiente;
Ta=tfin-tini;
Tc=tfin-tinf;

% %pause
% tc=0:tm:tp;
% longtc=length(tc);
% yp=ys(longtc);
% pend=(ys(longtc)-ys(longtc-1))/tm;
% %Determinaremos ahora Tc
% Tc1=(ys(long)-yp+pend*ti)/pend;
% Tc=Tc1-ti;
% %Cálculo de Ta
% Ta0=(ys(1)-yp+pend*ti)/pend;
% Ta=Tc1-Ta0;
%Creación de la función T2/TA=F(T1/TA)
T1TA=0:0.1:1;
T2TA=[1 0.73 0.57 0.44 0.34 0.25 0.18 0.12 0.07 0.03 0];
f=polyfit(T1TA,T2TA,6);%Se crea un polinomio de grado 6
Tg=[];
for i=0:0.0001:1,
Tg=[Tg polyval(f,i)];
end


abc=0:0.0001:1;
% a=0;
% j=0;
% t2tag=[];
% for i=0:0.01:1,
% j=j+1;
% t2tag=[t2tag Tc/Ta-i];
% if (Tc/Ta-i)>Tg(j)
% a=1;
% end
%end
Tg2=Tc/Ta-abc;

if Tc/Ta<0.736
plot(abc,Tg2,abc,Tg);
grid;
warndlg('No hay intersección','Advertencia ')
else   
Tg1r=Tg-Tg2;
Tg1=find(abs(Tg1r)<0.0001);

T1Ta=Tg(Tg1(1));
T2Ta=abc(Tg1(1));
T1=T1Ta*Ta;
T2=T2Ta*Ta;
num=[(max(ys)-ys(1))/us(long)];
den=[T1*T2 T1+T2 1];
ft=tf(num,den);

end
