%---------------------Elaboro: Juan Tapia Tinoco---------------------------
%----------------Asesor: M.I. Salvador Ramirez Zavala----------------------
%----------Universidad Michoacana de San Nicolas de Hidalgo----------------
%-----------------Facultad de Ingenieria Electrica-------------------------

%Descripcion:La  presente  funcion  se encarga  de mostrar en un ventana de
%mensaje  los  datos  del  dispositivo  enviado a la funcion en la variable
%device.

function [Subsistemas_Disponibles,info]=Desplegar_Informacion(device)
    
    Subsistemas_Disponibles=[(1:5);zeros(1,5)];
    Encabezado=sprintf('%s: %s  %s (Device ID: %s)',device.Vendor.ID,device.Vendor.FullName,device.Model,device.ID);       %La varible Encabezado es una variable tipo string donde almacenan los datos de el ID del fabricante ,Nombre completo del dispositivo,Modelo del dispositivo y el ID del dispositivo.
    b=device.Subsystems;                                                                                                   %En b se almacenan los subsistemas que soporta el dispositivo.
    tam=length(b);
    sistemas=[];
    for cont=1:tam
        [aux,Tipo_Subsistema]=subsystem(b(1,cont));
        sistemas=[sistemas aux];
        Subsistemas_Disponibles(2,Tipo_Subsistema)=cont;        
    end
    info=sprintf('%s%s',Encabezado,sistemas);


 
