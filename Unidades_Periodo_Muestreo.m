function tiempo_muestreo=Unidades_Periodo_Muestreo(handles)

%Esta funcion se encarga de escalar el perido de muestreo a milisegundos,
%micro-segundos y nano-segundos.

val=get(handles.Unidades_Periodo_Muestreo,'value');
switch val
    case 1
        tiempo_muestreo=str2double(get(handles.Periodo_Muestreo,'string'));
    case 2
        tiempo_muestreo=str2double(get(handles.Periodo_Muestreo,'string'))/1000;
    case 3
        tiempo_muestreo=str2double(get(handles.Periodo_Muestreo,'string'))/1000^2;
    case 4
        tiempo_muestreo=str2double(get(handles.Periodo_Muestreo,'string'))/1000^3;
end