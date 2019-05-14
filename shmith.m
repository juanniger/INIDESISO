%metodo de smith
u=datos_id.u;
y=datos_id.y;
t_muestreo=datos_id.Ts;
t=(0:t_muestreo:t_muestreo*(length(y)-1));
%Ganancia
tam=length(y);
uf=sum(u(tam-9:tam))/10;
yf=sum(y(tam-9:tam))/10;
A=yf/uf;

cont_recta=[0 0];

for cont=1:tam
    if u(cont)<0
    else
        if y(cont)<yf*0.283
            cont_recta(1,1)=cont_recta(1,1)+1;
        elseif y(cont)<yf*0.632
            cont_recta(1,2)=cont_recta(1,2)+1;
        else
            break
        end
    end
end
t28=cont_recta(1,1)*t_muestreo;
t63=(cont_recta(1,2)+cont_recta(1,1))*t_muestreo;
tao_smith=1.5*(t63-t28);
tm=t63-tao_smith;
s=tf('s');
ft_smith=A/(tao_smith*s+1)*exp(-tm*s);