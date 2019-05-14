%---------------------Elaboro: Juan Tapia Tinoco---------------------------
%----------------Asesor: M.I. Salvador Ramirez Zavala----------------------
%----------Universidad Michoacana de San Nicolas de Hidalgo----------------
%-----------------Facultad de Ingenieria Electrica-------------------------

%Descripcion:Esta funcion tiene por objetivo  generar un vector de retardos
%aleatorios. Con la restriccion de que la suma de los retardos no sea mayor
%al  tiempo de   adquisicion. El retardo  maximo  es una  cuarta  parte del
%tiempo de duracion  y el  retardo  minimo  es  de  0.1s. En caso de que el
%tiempo de  adquisicion sea  menor a  10*(0.1s)=1s  para que  el  minimo y
%maximo retardo sean iguales entonces el vector de  retardo solo  contendra
%un cero.

function vector_retardo=funcion_retardo_aleatorio(t_duracion)

    vector_retardo=0;
    ganancia=rand(1,1);
    retardo_max=t_duracion/10;
    rango_retardo=retardo_max-0.1;
    cont=1;
    if retardo_max<0.1
        vector_retardo=0;
    else
        vector_retardo(cont)=ganancia*rango_retardo+0.1;
        while sum(vector_retardo)<t_duracion
            cont=cont+1;
            ganancia=rand(1,1);
            vector_retardo(cont)=ganancia*rango_retardo+0.1;
        end
    end


