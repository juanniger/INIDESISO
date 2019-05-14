function Limpiar_Pretatamiento_Datos(handles)

%Esta funcion tiene como finalidad reestablecer a su estado inicial todos
%los elementos dentro del panel "Pretatamiento de datos".


cla(handles.Senal_Entrada_Identificar);
cla(handles.Senal_Salida_Identificar);
cla(handles.Senal_Entrada_Validar);
cla(handles.Senal_Salida_Validar);
set(handles.Datos_Identificacion,'Enable','off','String',num2str(50));
set(handles.Legend_Porcentage_datos_identificacion,'Enable','off');
set(handles.Dividir_Datos_Identificacion,'Enable','off');
set(handles.Con_cola_salida,'Enable','off','value',0)
set(handles.Sin_cola_salida,'Enable','off','value',0)
set(handles.Adquirir_Datos_Validacion,'Enable','off')
