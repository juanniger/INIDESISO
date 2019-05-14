function Desocupado(handles)

%Esta funcion se encarga de limpiar la figura donde se plotea la imagen que
%dice "Ocupado"de todas las gui's.

cla(handles.Indicador_Ocupado);
axis(handles.Indicador_Ocupado,'off');

