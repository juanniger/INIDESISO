%---------------------Elaboro: Juan Tapia Tinoco---------------------------
%----------------Asesor: M.I. Salvador Ramirez Zavala----------------------
%----------Universidad Michoacana de San Nicolas de Hidalgo----------------
%-----------------Facultad de Ingenieria Electrica-------------------------

%Descripcion:Esta  funcion  sirve para generar una señal pulsante de salida 
%cuando usamos una tarjeta  de adquisicion  de datos que no admite datos en 
%cola de salida. Las variables de entrada son:

%s:la sesion en la que estan los canales de salida.
%salidas1:es el vector de salida en estado bajo(0).
%salidas2:es el vetor de salida en estado alto(1).
%retardos:es  el vector  de  retardos,  es decir  el tiempo  que tarda para 
%cambiar de un estado a otro. 

function retardo(s,salidas1,salidas2,retardos)                          
global stop_salida
m=length(retardos);                                                        %m sera el numero de retardos que vamos a emplear.
estado=1;                                                                  %El estado incial sera alto(1).
    
for cont=1:m
    if stop_salida~=1
        pause(retardos(cont))
        if estado==0                                                           %Si el estado es cero la salida sera salida1
            s.outputSingleScan(salidas1)
            estado=1;
        else                                                                   %En caso contrario la salida sera salida2
            s.outputSingleScan(salidas2)
            estado=0;
        end   
    else
        s.outputSingleScan(salidas1)
        return
    end
end