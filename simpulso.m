function u=simpulso(t,amplitud,valor_inicial,tiempo_impulso)
tam=length(t);
u=zeros(tam,1);
for cont=1:tam
    if(t(cont)<tiempo_impulso)
        u(cont,1)=valor_inicial;
    elseif t(cont)>=tiempo_impulso&&t(cont-1)<tiempo_impulso
        u(cont,1)=valor_inicial+amplitud;
    else
         u(cont,1)=valor_inicial;   
    end
end
end