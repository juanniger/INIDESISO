function ft=oscilante05(datos_id)
% identificacion de sistema de segundo orden con E<=0.5

u=datos_id.u;
y=datos_id.y;
t_muestreo=datos_id.Ts;

%Ganancia
tam=length(y);
uf=sum(u(tam-9:tam))/10;
yf=sum(y(tam-9:tam))/10;
A=yf/uf;

% Y0
Y0=sum(y(tam-9:tam))/10;

% Y1 & Y2

%pen_max=100;
punto=0;

for cont=2:tam-1
    pendiente(cont)=(y(cont)-y(cont-1))/(t_muestreo);
    %if pendiente<abs(pen_max)
     %   pen_max=pendiente;
      %  punto=cont;
    %end
end
contY1=1;
contY2=0;
pp=sum(pendiente(tam-10:tam-1))/10;
for cont=2:tam
    if pendiente(cont)>pp
        contY1=contY1+1;
    elseif pendiente(cont)<pp
        contY2=contY2+1;
            if pendiente(cont+1)>pp;
                break
            end
    end
end
Y1=y(contY1)-Y0;
Y2=Y0-y(contY1+contY2);
contT=[0 0];
i=1;
for cont=1:tam
    if u(cont)<0
    elseif y(cont)<Y0&&y(cont+1)>Y0
        contT(1,i)=cont;
        i=i+1;
        if i>2
            break
        end
    end
end
T=(contT(1,2)-contT(1,1))*t_muestreo;
E1=log(Y1/Y0)/(sqrt(pi^2+(log(Y1/Y0))^2));
E2=log(Y2/Y0)/(sqrt(4*pi^2+(log(Y2/Y0))^2));
E=-(E1+E2)/2;

Wn=2*pi/(T*sqrt(1-E^2));

s=tf('s');
ft=A*Wn^2/(s^2+2*E*Wn*s+Wn^2);
