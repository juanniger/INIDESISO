clear all
t=[0:0.001:100];
t_muestreo=0.001;
u=sescalon(t,0,1,0);
K=10;
T1=1;
T2=2;
ft=tf([K],[conv([T1 1],[T2 1])]);
y=lsim(ft,u,t);
plot([y,u])
tam=length(t);
yf=sum(y(tam-9:tam))/10;
 yc=-(y-yf);
yc2=log(yc);
figure
plot(t,yc2)
hold on
i=1;
for cont=1:length(yc2)
if yc2(cont)>0
yc3(i,1)=yc2(i,1);
i=i+1;
else
    break
end
end
tam=length(yc2);
tam=fix(tam/2);
p=(yc2(tam)-yc2(tam-1))/(t(tam)-t(tam-1));
b=(yc2(tam-1)*(t(tam)-t(tam-1))-t(tam-1)*(yc2(tam)-yc2(tam-1)))/(t(tam)-t(tam-1));


K2=srampa(1,p,b);
us=srampa(t,p,b);
plot(t,us,'r');
val=K2*(1-0.37);
pos2=0;
for cont=1:tam    
    pos2=pos2+1;
    if yc3(cont)<val       
        break;
    end
end
T2=t_muestreo*pos2;

e=K2*exp(-t/T2)-yc';
e=log(e)';
plot(t,e,'y')
i=1;
e2=[];
for cont=1:length(e)
if e(cont)>0
e2(i,1)=e(i,1);
i=i+1;
else
    break
end
end
tam2=length(e);
tam=tam2;
p1=(e(tam)-e(tam-1))/(t(tam)-t(tam-1));
b1=(e(tam-1)*(t(tam)-t(tam-1))-t(tam-1)*(e(tam)-e(tam-1)))/(t(tam)-t(tam-1));

tam=fix(tam2/2);
p2=(e(tam)-e(tam-1))/(t(tam)-t(tam-1));
b2=(e(tam-1)*(t(tam)-t(tam-1))-t(tam-1)*(e(tam)-e(tam-1)))/(t(tam)-t(tam-1));

tam=fix(tam2/3);
p3=(e(tam)-e(tam-1))/(t(tam)-t(tam-1));
b3=(e(tam-1)*(t(tam)-t(tam-1))-t(tam-1)*(e(tam)-e(tam-1)))/(t(tam)-t(tam-1));

tam=fix(tam2/4);
p4=(e(tam)-e(tam-1))/(t(tam)-t(tam-1));
b4=(e(tam-1)*(t(tam)-t(tam-1))-t(tam-1)*(e(tam)-e(tam-1)))/(t(tam)-t(tam-1));

p=(p1+p2+p3+p4)/4;
b=(b1+b2+b3+b4)/4;

K1=srampa(1,p,b);
us=srampa(t,p,b);
plot(t,us,'r');
val=K1*(1-0.37);
pos2=0;
for cont=1:tam    
    pos2=pos2+1;
    if e(cont)<val       
        break;
    end
end
T1=t_muestreo*pos2;