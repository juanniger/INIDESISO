function u=aleatoria(f_min,f_max,t_muestreo,t_adquisicion,val_min,val_max)

n=fix(t_adquisicion/t_muestreo);
b=[];
u=[];
n_Fm=fix(t_adquisicion*f_max);
A=[f_min:(f_max-f_min)/n_Fm:f_max];


for cont=1:n_Fm
    al=randi(n_Fm,1,1);
    f=A(al);
    p=1/f;
    muestras=p/t_muestreo;
    u_aux=sescalon([0:muestras],val_min,val_max,muestras/2);
    b=[b;u_aux];
    if length(b)> n
        u=b(1:n);
        u=[u;0];
        return;
    end
end
u=b(1:n);
u=[u;0];
    
    