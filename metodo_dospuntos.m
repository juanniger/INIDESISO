function ft=metodo_dospuntos(datos_id,metodo)
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
if strcmp(metodo,'Alfaro')
    a=yf*0.25;
    b=yf*0.75;
    A=-0.91;
    B=0.91;
    C=1.262;
    D=-0.262;
elseif strcmp(metodo,'Broida')
    a=yf*0.28;
    b=yf*0.40;
    A=-5.5;
    B=5.5;
    C=2.8;
    D=-1.8;
elseif strcmp(metodo,'Chen y Yang')
    a=yf*0.33;
    b=yf*0.67;
    A=-1.4;
    B=1.4;
    C=1.54;
    D=-0.54;
elseif strcmp(metodo,'Ho')
    a=yf*0.35;
    b=yf*0.85;
    A=-0.67;
    B=0.67;
    C=1.3;
    D=-0.29;
elseif strcmp(metodo,'Smith')
    a=yf*.283;
    b=yf*0.632;
    A=-1.5;
    B=1.5;
    C=1.5;
    D=-0.5;
elseif strcmp(metodo,'Viteckova')
    a=yf*0.33;
    b=yf*0.7;
    A=-1.245;
    B=1.245;
    C=1.498;
    D=-0.498;
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
ft=G/(tao*s+1)*exp(-tm*s);