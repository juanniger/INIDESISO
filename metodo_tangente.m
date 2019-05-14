function ft=metodo_tangente(datos_id, metodo)
u=datos_id.u;
y=datos_id.y;
t_muestreo=datos_id.Ts;
t=(0:t_muestreo:t_muestreo*(length(y)-1));
%Ganancia
tam=length(y);
uf=sum(u(tam-9:tam))/10;
yf=sum(y(tam-9:tam))/10;
A=yf/uf;

%punto de maxima pendiente
pen_max=0;
punto=0;
for cont=2:tam-1
    pendiente=(y(cont+1)-y(cont-1))/(2*t_muestreo);
    if pendiente>abs(pen_max)
        pen_max=pendiente;
        punto=cont;
    end
end
b=y(punto)-pen_max*t(punto);
p=srampa(t,pen_max,b);

cont_inicio=0;
cont_recta=[0 0 0];

for cont=1:tam
    if u(cont)<0
    cont_inicio=cont_inicio+1;
    else
        if p(cont)<0
            cont_recta(1,1)=cont_recta(1,1)+1;
        elseif p(cont)<yf*0.632
            cont_recta(1,2)=cont_recta(1,2)+1;
        elseif p(cont)<yf
            cont_recta(1,3)=cont_recta(1,3)+1;
        else
            break
        end
    end
end

tm=cont_recta(1,1)*t_muestreo;
tao_miller=cont_recta(1,2)*t_muestreo;
tao_nichols=(cont_recta(1,2)+cont_recta(1,3))*t_muestreo;

if strcmp(metodo,'nichols')
    s=tf('s');
    ft=A/(tao_nichols*s+1)*exp(-tm*s);
elseif strcmp(metodo,'miller')
    s=tf('s');
    ft=A/(tao_miller*s+1)*exp(-tm*s);
else
    ft=0;
end