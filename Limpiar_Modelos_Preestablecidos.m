function Limpiar_Modelos_Preestablecidos(handles)

%Esta funcion tiene como finalidad reestablecer a su estado inicial todos
%los elementos dentro del panel "Modelos preestablecidos".

cla(handles.Figuras_Modelos);
axis(handles.Figuras_Modelos,'off');
set(handles.Lista_Modelos,'value',1,'Enable','off');
set(handles.Cargar_Modelo,'Enable','off');
set(handles.Legend_Funcion_de_transferencia,'Enable','off');
set(handles.Num_Funcion_Transferencia,'Enable','off','string',[]);
set(handles.Den_Funcion_Transferencia,'Enable','off','string',[]);
set(handles.Linea,'Enable','off');
set(handles.Cambiar_Modelo,'Enable','off');
set(handles.Simular,'Enable','off');