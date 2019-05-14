function Limpiar_Filtros(handles)

%Esta funcion tiene como finalidad reestablecer a su estado inicial todos
%los elementos dentro del panel "Filtros".

set(handles.Aplicar_Filtro,'Enable','off')
set(handles.Reset,'Enable','off')
set(handles.Guardar_Datos_Filtrados,'Enable','off')
set(handles.Filtro_Pasabajas,'Enable','off','value',0)
set(handles.Filtro_Eliminador_Continua,'Enable','off','value',0)
set(handles.Filtro_Promediador,'Enable','off','value',0)
set(handles.Cambiar_Filtro,'Enable','off','value',0)
set(handles.Identificacion_Parametrica,'Enable','off')
set(handles.Identificacion_Escalon,'Enable','off')
set(handles.Reset,'Enable','off')
set(handles.Filtrar_Adquiridos,'Enable','off','value',0)