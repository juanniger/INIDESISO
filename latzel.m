function ft=latzel(datos_id)

u=datos_id.u;
y=datos_id.y;
t_muestreo=datos_id.Ts;

%Ganancia
tam=length(y);
uf=sum(u(tam-9:tam))/10;
yf=sum(y(tam-9:tam))/10;
A=yf/uf;


cont_recta=[0 0 0];

for cont=1:tam
    if u(cont)<0
    elseif  y(cont)<0.1*yf
        cont_recta(1,1)=cont_recta(1,1)+1;
    elseif  y(cont)<0.5*yf
        cont_recta(1,2)=cont_recta(1,2)+1;
    elseif  y(cont)<0.9*yf
        cont_recta(1,3)=cont_recta(1,3)+1;
    end
end

t10=cont_recta(1,1)*t_muestreo;
t50=(cont_recta(1,1)+cont_recta(1,2))*t_muestreo;
t90=(cont_recta(1,1)+cont_recta(1,2)+cont_recta(1,3))*t_muestreo;

u=t10/t90;

load Tabla_laztel

aux=tabla_Latzel(1:5,1);
aux=abs(aux-u);

i=0;
au=10000;
for cont=1:5
if aux(cont)<au
au=aux(cont);
i=cont;
end
end
n=tabla_Latzel(i,2);
alfa10=tabla_Latzel(i,3);
alfa50=tabla_Latzel(i,4);
alfa90=tabla_Latzel(i,5);

T=(alfa10*t10+alfa50*t50+alfa90*t90);

s=tf('s');
ft=A/(T*s+1)^n;