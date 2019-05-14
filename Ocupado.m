function Ocupado(handles)

%Esta funcion se encarga de desplegar la imagen que dice "Ocupado"de todas las gui's.

nombre='imagenes/ocupado';
[x,~]=imread(nombre,'jpg');
axes(handles.Indicador_Ocupado)
image(x)
axis(handles.Indicador_Ocupado,'off');
%pause(0.1);
