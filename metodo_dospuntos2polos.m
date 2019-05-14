function ft=metodo_dospuntos2polos(datos_id,metodo)
%metodo de smith
u=datos_id.u;
y=datos_id.y;
t_muestreo=datos_id.Ts;
 %t=(0:t_muestreo:t_muestreo*(length(y)-1));
%Ganancia
tam=length(y);
uf=sum(u(tam-9:tam))/10;
yf=sum(y(tam-9:tam))/10;
G=yf/uf;

%Tm y Tao
cont_recta=[0 0];
if strcmp(metodo,'Ho')
    a=yf*0.35;
    b=yf*0.85;
    A=-0.463;
    B=0.463;
    C=1.574;
    D=-0.574;
elseif strcmp(metodo,'Viteckova')
    a=yf*0.33;
    b=yf*0.7;
    A=-0.749;
    B=0.749;
    C=1.937;
    D=-0.937;
else
    ft=0;
    return;
end
    


for cont=1:tam
    if u(cont)<0
    else
        if y(cont)<a
            cont_recta(1,1)=cont_recta(1,1)+1;
        elseif y(cont)<b
            cont_recta(1,2)=cont_recta(1,2)+1;
        else
            break
        end
    end
end
t1=cont_recta(1,1)*t_muestreo;
t2=(cont_recta(1,2)+cont_recta(1,1))*t_muestreo;
tao=A*t1+B*t2;
tm=C*t1+D*t2;

s=tf('s');
ft=G/(tao*s+1)^2*exp(-tm*s);