function Limpiar_Senales(handles)

%Esta funcion se encarga de reestablecer a su estado inicial los graficos
%de entrada y salida asi como la tabla y los botones asociados.

cla(handles.Senal_Entrada);
cla(handles.Senal_Salida);
set(handles.Tabular_Datos,'Enable','off');
set(handles.Modificar_Datos,'Enable','off','value',0);
set(handles.Guardar_Datos_Tabla,'Enable','off');
set(handles.Graficar_Senal_Salida,'Visible','off');
set(handles.Graficar_Senal_Entrada,'Visible','off');
set(handles.Tabla1,'Data',[]);
