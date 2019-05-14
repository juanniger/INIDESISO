for i=1:tam
    if resta(i)>=0
        resta2(i)=resta(i);
    else
        break
    end
end

resta2=log(resta2);

tam=length(resta2);

for cont=2:tam-1
    pendiente(cont-1)=(resta2(cont+1)-resta2(cont-1))/(2*t_muestreo);
end

 M=median(pendiente);
 
 