u=datos_id.u;
y=datos_id.y;
T_muestreo=datos_id.Ts;
%Calculo de L
tam=length(u);
i=0;
pos=0;
for cont=1:tam     
    if u(cont)>0
        if y(cont)<=0
        i=i+1;
        end
    else
        pos=pos+1;
    end
end
L=i*t_muestreo;

%Ganancia
uf=sum(u(tam-9:tam))/10;
yf=sum(y(tam-9:tam))/10;
A=yf/uf;

%Tao

val=yf*.632;
pos2=0;
for cont=1:tam    
    pos2=pos2+1;
    if y(cont)>val       
        break;
    end
end

tao=(pos2-pos)*t_muestreo;
s = tf('s'); 
H = (A)/(tao*s+1)*exp(-L*s)
