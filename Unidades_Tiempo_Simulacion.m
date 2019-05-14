function tiempo_simulacion=Unidades_Tiempo_Simulacion(handles)

%Esta funcion se encarga de escalar el tiempo de simulacion a milisegundos,
%micro-segundos y nano-segundos.

val=get(handles.Unidades_Tiempo_Simulacion,'value');
switch val
    case 1
        tiempo_simulacion=str2double(get(handles.Tiempo_Simulacion,'string'));
    case 2
        tiempo_simulacion=str2double(get(handles.Tiempo_Simulacion,'string'))/1000;
    case 3
        tiempo_simulacion=str2double(get(handles.Tiempo_Simulacion,'string'))/1000^2;
    case 4
        tiempo_simulacion=str2double(get(handles.Tiempo_Simulacion,'string'))/1000^3;
end
    
