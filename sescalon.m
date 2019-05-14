function u=sescalon(t,valor_inicial,valor_final,tiempo_inicio)  

tam=length(t);
u=zeros(tam,1);
for cont=1:tam
    if(t(cont)<tiempo_inicio)
        u(cont,1)=valor_inicial;
    else
        u(cont,1)=valor_final;
    end
end
end