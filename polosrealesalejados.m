function ft=polosrealesalejados(datos_id,a,b)
% identificacion de sistema de segundo orden con E<=0.5
if a>b || a<0.5 || b<0.5
    ft=0;
    return
end

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
a=a*Y0;
b=b*Y0;
%t5 t6
cont_recta=[0 0];
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
t5=cont_recta(1,1)*t_muestreo;
t6=(cont_recta(1,2)+cont_recta(1,1))*t_muestreo;

Y5=y(cont_recta(1,1));
Y6=y(cont_recta(1,2)+cont_recta(1,1));

P2=(log(1-(Y5/Y0))-log(1-(Y6/Y0)))/(t5-t6);

P11=P2*(((1-Y5/Y0)*exp(P2*t5))/((1-Y5/Y0)*exp(P2*t5)-1));
P12=P2*(((1-Y6/Y0)*exp(P2*t6))/((1-Y6/Y0)*exp(P2*t6)-1));
P1=(P11+P12)/2;

s=tf('s');
ft=A*P1*P2/(s^2+(P1+P2)*s+P1*P2);
% for cont=2:tam-1
%     pendiente(cont)=(y(cont)-y(cont-1))/(t_muestreo);
%     %if pendiente<abs(pen_max)
%      %   pen_max=pendiente;
%       %  punto=cont;
%     %end
% end
% contY1=0;
% contY2=0;
% pp=sum(pendiente(tam-10:tam-1))/10;
% for cont=1:tam
%     if pendiente(cont)>pp
%         contY1=contY1+1;
%     else
%         break
% %         pendiente(cont)<pp
% %         contY2=contY2+1;
% %             if pendiente(cont+1)>pp;
% %                 break
% %             end
%     end
% end
% MP=(y(contY1)-Y0)/Y0;
% %Y2=y(contY1+contY2);
% contT=[0 0];
% i=1;
% for cont=1:tam
%     if u(cont)<0
%     elseif pendiente(cont)>pp&&pendiente(cont+1)<pp
%         contT(1,i)=cont;
%         i=i+1;
%         if i>2
%             break
%         end
%     end
% end
% T=(contT(1,2)-contT(1,1))*t_muestreo;
% E=sqrt(log(MP)^2/(pi^2+log(MP)^2));
% % E1=log(Y1/Y0)/(sqrt(pi^2+(log(Y1/Y0))^2));
% % E2=log(Y2/Y0)/(sqrt(4*pi^2+(log(Y2/Y0))^2));
% % E=(E1+E2)/2;
% 
% Wn=2*pi/(T*sqrt(1-E^2));

% s=tf('s');
% ft=A*Wn^2/(s^2+2*E*Wn*s+Wn^2);
