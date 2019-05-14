function Limpiar_Entradas(handles)

%Esta funcion tiene como finalidad reestablecer a su estado inicial todos
%los elementos dentro del panel "Entrada".

set(handles.Cargar_Senal_Entrada,'Enable','off');
set(handles.Lista_Funciones_Entrada,'Enable','off','value',1);
set(handles.Legend_Simulacion,'Enable','off');
set(handles.Legend_Muestreo,'Enable','off');
set(handles.Cambiar_Entrada,'Enable','off');
set(handles.Ver_Entrada,'Enable','off','value',0);
set(handles.Ver_Ruido,'Enable','off','value',0);
set(handles.Generar_Ruido,'Enable','off');
set(handles.Tiempo_Simulacion,'Enable','off','String',num2str(10));
set(handles.Periodo_Muestreo,'Enable','off','String',num2str(0.01));
set(handles.Unidades_Tiempo_Simulacion,'Enable','off','value',1);
set(handles.Unidades_Periodo_Muestreo,'Enable','off','value',1);