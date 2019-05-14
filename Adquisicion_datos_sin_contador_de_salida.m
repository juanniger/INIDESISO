%---------------------Elaboro: Juan Tapia Tinoco---------------------------
%----------------Asesor: M.I. Salvador Ramirez Zavala----------------------
%----------Universidad Michoacana de San Nicolas de Hidalgo----------------
%-----------------Facultad de Ingenieria Electrica-------------------------

%Descripcion: El presente script junto con su archivo del tipo figura(.fig)
%corresponden a una  gui(grafic user interface) que tiene como finalidad el
%facilitar al usuario la  adquisicion de datos. Con esta interfaz se vuelve
%transparente  el uso  de comandos  para los  usuarios,  por lo que incluso
%usuarios  que no  estan muy  familiarizados  con  el  uso de matlab  en la
%adquisicion  de  datos  pueden realizar esta tarea sin tener que dedicarle
%mucho tiempo.

%Al  crear  cada  una de las funciones se trato de crear un esquema general
%para que esta interfaz pudiese  ser utilizada para el desarrollo de nuevas 
%aplicaciones,  sin  embargo  debido  al tiempo  no se logro plenamente  el 
%cumplimiento de  este objetivo. Por otro lado  sí constituye una base para
%futuros trabajos.

%Esta  interfaz  tiene  la  peculiaridad  de  estar  diseñada para utilizar
%tarjetas  de  adqusicion de  la marca NI(National Instruments) no permiten
%poner en  la cola de  salida señales analogicas, por lo que las señales de
%salida deben ser simples pulsos ya sean digitales o analogicos.

%La funcionalidad de cada una de las funciones del presente script asi como
%el proposito de cada una  de las variables se  introducen en el cuerpo del
%programa  en forma de  comentarios  para  facilitar  el  entendimiento del
%programa.

function varargout = Adquisicion_datos_sin_contador_de_salida(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Adquisicion_datos_sin_contador_de_salida_OpeningFcn, ...
                   'gui_OutputFcn',  @Adquisicion_datos_sin_contador_de_salida_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
%Esta  funcion se ejecuta al inicializarse la interfaz, aqui se inician los
%valores y los estados de los elementos de la interfaz.--------------------
function Adquisicion_datos_sin_contador_de_salida_OpeningFcn(hObject, eventdata, handles, varargin)
    global info     estado_validacion P_muestreo                                                               %Se declara global la variable "info" que contendra la informacion de las tarjetas NI conectadas a la computadora.
    Ocupado(handles);                                                               %Esta funcion despliega una imagen en la interfaz la cual contiene la palabra "ocupado", con el fin de informar al usuario que esta bajo ejecucion alguna funcion.
    daq.reset;                                                                      %Este comando borra todos los objetos del toolbox "data adqusition" del workspace de MATLAB. 
    info=daq.getDevices;                                                            %El comando devuelve dentro de la variable info la lista de dispositivos disponibles en el sistema y sus caracterisicas.
    Dispositivos={info.Model};                                                      %En la variable dispositivos se guarda una lista de los modelos de los dispositivos disponibles en el sistema.
    Dispositivos=[{'Dispositivos'},Dispositivos];                                   %Agregamos la palabra "Dispositivos" a la lista para que sea desplegada en la lista de dispositivos.
    set(handles.Abortar,'Enable','off')   
    set(handles.Lista_Dispositivos,'string',Dispositivos,'Enable','on','value',1);
    set(handles.Legend_Periodo_MinimoyMaximo_Muestreo,'string','')    
    set(handles.Informacion_Dispositivos,'Enable','off');
    set(handles.Lista_Dispositivos,'value',1);
    set(handles.Lista_Canales_Salida,'value',1,'Enable','off');
    set(handles.Lista_Canales_Entrada,'value',1,'Enable','off');
    set(handles.Lista_Sesiones,'value',1,'Enable','off');
    set(handles.Legend_Anadir_canal_de_salida,'Enable','off');
    set(handles.Informacion_Dispositivos,'Enable','off');
    set(handles.Iniciar_Sesion,'Enable','off');
    set(handles.Anadir_Canal_Salida,'Enable','off');
    set(handles.Ok_Canales_Salida,'Enable','off');
    set(handles.Salida_Digital,'value',0,'Enable','off');
    set(handles.Salida_Analogica,'value',0,'Enable','off');
    set(handles.Entrada_Analogica,'value',0,'Enable','off');
    set(handles.Tabla_Canales_Analogicos,'Data',[]);
    set(handles.Tabla_Canales_Digitales,'Data',[]);
    set(handles.Indice_Borrar_Canal,'Enable','off');
    set(handles.Borrar_Canal,'Enable','off');
    set(handles.Ok_Borrar_Canal,'Enable','off');
    set(handles.Ok_Canal_Entrada,'Enable','off');
    set(handles.Generar_Senales_Salida,'Enable','off');
    set(handles.Anadir_Canal_Entrada,'Enable','off');
    set(handles.Cancelar_Canal_salida,'Enable','off');
    set(handles.Cancelar_Canal_Entrada,'Enable','off');
    set(handles.Cancelar_Borrar_Canal,'Enable','off');
    set(handles.Legend_Borrar_canal,'Enable','off');
    set(handles.Legend_Index,'Enable','off');
    set(handles.Legend_Generar_senales_salida,'Enable','off');
    set(handles.Adquirir_Datos,'Enable','off');
    set(handles.Tabla_Canales_Analogicos,'Data',[]);
    set(handles.Tabla_Datos,'Data',[]);
    set(handles.Tabla_Canales_Digitales,'Data',[]);
    set(handles.Tabla_Canales_Salida,'Data',[]);
    set(handles.Legend_Anadir_canal_de_entrada,'Enable','off');
    if estado_validacion==1
        set(handles.Periodo_Muestreo,'string',num2str(P_muestreo),'Enable','inactive');
        set(handles.Unidades_Periodo_Muestreo,'Enable','inactive')
    end
    Desocupado(handles);
   
    handles.output = hObject;
    guidata(hObject, handles);

function varargout = Adquisicion_datos_sin_contador_de_salida_OutputFcn(~, ~, handles) 
    varargout{1} = handles.output;

%--------------------------------CreateFcn---------------------------------
%--------------------------------------------------------------------------
function Lista_Dispositivos_CreateFcn(hObject, ~, ~)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
function Lista_Canales_Salida_CreateFcn(hObject, ~, ~)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
function Lista_Canales_Salida_Callback(hObject, eventdata, handles)
function Tiempo_Simulacion_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    function edit3_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
function Unidades_Tiempo_Simulacion_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
function Unidades_Tiempo_Simulacion_Callback(hObject, eventdata, handles)
function Unidades_Periodo_Muestreo_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
function Unidades_Periodo_Muestreo_Callback(hObject, eventdata, handles)
function Indice_Borrar_Canal_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Ok_Borrar_Canal_CreateFcn(hObject, eventdata, handles)
function Tiempo_Simulacion_Callback(hObject, eventdata, handles)
function Indice_Borrar_Canal_Callback(hObject, eventdata, handles)
function Periodo_Muestreo_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Periodo_Muestreo_Callback(hObject, eventdata, handles)
function pushbutton15_Callback(hObject, eventdata, handles)  
function Lista_Sesiones_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Lista_Sesiones_Callback(hObject, eventdata, handles)
function Lista_Canales_Entrada_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Lista_Canales_Entrada_Callback(hObject, eventdata, handles)
function Generar_Senales_Salida_CreateFcn(hObject, eventdata, handles)
function Tabla_Canales_Analogicos_DeleteFcn(hObject, eventdata, handles)

%-------------------------------Menus--------------------------------------
%--------------------------------------------------------------------------
function menu_axes1_Callback(hObject, eventdata, handles)
    function menu_limites_Callback(hObject, eventdata, handles)
        function menu_limitesx_Callback(hObject, eventdata, handles)                                                               %Esta funcion se emplea para definir manualmente los limites de x en la figura de señales adquiridas.
            global x_1 x_2
            h=limite_;
            uiwait(h);
            set(handles.Senales_Adquiridas,'Xlim',[x_1 x_2]);
        function menu_limitesy_Callback(hObject, eventdata, handles)                                                                %Esta funcion se emplea para definir manualmente los limites de y en la figura de señales adquiridas.
            global y_1 y_2
            h=limite_y;
            uiwait(h);
            set(handles.Senales_Adquiridas,'Ylim',[y_1 y_2]);

%--------------------------Funciones iniciales-----------------------------
%--------------------------------------------------------------------------
function Buscar_Dispositivos_Callback(hObject, ~, handles)
    global info                                                                                                                     %Se declara la variable info como global.                                                                                                               %Esta funcion despliega una imagen en la interfaz la cual contiene la palabra "ocupado", con el fin de informar al usuario que esta bajo ejecucion alguna funcion.
    daq.reset;                                                                                                                      %Este comando borra todos los objetos del toolbox "data adqusition" del workspace de MATLAB. 
    Ocupado(handles);
    info=daq.getDevices;                                                                                                            %El comando devuelve dentro de la variable info la lista de dispositivos disponibles en el sistema y sus caracterisicas.                                        
    Dispositivos={info.Model};                                                                                                      %En la variable dispositivos se guarda una lista de los modelos de los dispositivos disponibles en el sistema.
    Dispositivos=[{'Dispositivos'},Dispositivos];                                                                                   %Agregamos la palabra "Dispositivos" a la lista para que sea desplegada en la lista de dispositivos.
    set(handles.Lista_Dispositivos,'string',Dispositivos,'Enable','on','value',1);
    set(handles.Informacion_Dispositivos,'Enable','off');
    Desocupado(handles);
    
    function Lista_Dispositivos_Callback(hObject, ~, handles)
    if get(hObject,'value')>1
        set(handles.Informacion_Dispositivos,'Enable','on');
        set(handles.Iniciar_Sesion,'Enable','on');
    else
        set(handles.Informacion_Dispositivos,'Enable','off');
        set(handles.Iniciar_Sesion,'Enable','off');
    end

    function Informacion_Dispositivos_Callback(hObject, ~, handles)
    global info                                                                                                                     %Declaramos la variable info como global, esto nos permite utilizar la informacion de los dispositivos disponibles en el sistema, procedente de alguna de las dos funciones anteriores.
    indice=get(handles.Lista_Dispositivos,'value');                                                                                 %En la variable indice se guarda la posicion de la lista de dispositivos del dispositivo que se haya elegido. 
    if indice>1                                                                                                                     %Si el indice es mayor a la posiscion 1 ('Dispositivos') entonces se llama a la funcion Desplegar_Informacion para mostrar en una ventana la informacion del dispositivo.
    [~,Informacion_tarjeta]=Desplegar_Informacion(info(1,indice-1));                                                                %La funcion desplegar informacion nos regresa dos variables, la primera indica los subsistemas que tiene la tarajeta de adquisicion elegida y la otra es la informacion de estos subsistemas.           
    msgbox(Informacion_tarjeta)                                                                                                     %msgbox despliga un mensaje con la informacion de la tarjeta.
    end

    function Iniciar_Sesion_Callback(hObject, eventdata, handles)
    global info s q subsistemas_disponibles

    indice=get(handles.Lista_Dispositivos,'value');                                                                                 %En la variable indice se guarda la posicion de la lista de dispositivos del dispositivo que se haya elegido. 
    if indice>1                                                                                                                     %Si el indice es mayor a la posiscion 1 ('Dispositivos') entonces se llama a la funcion Desplegar_Informacion para tomar la variable que nos indica los subsistemas disponibles en el dispositivo.
    [subsistemas_disponibles,~]=Desplegar_Informacion(info(1,indice-1));           
    if subsistemas_disponibles(2,1)==0                                                                                              %Si la matriz subsistemas_disponibles en la posicion(2,1)contiene un valor diferente a cero entonces el dispositivo cuenta con subsitema de entrada analogica.
        h=errordlg('La tarjeta no cuenta con canales analogicos de entrada');                                                       %En caso de que no tenga subsistema de entrada analogica se despliega este mensaje de error si se aborta la ejecucion de la funcion.
        uiwait(h);   
        return
    elseif subsistemas_disponibles(2,2)==0 && subsistemas_disponibles(2,3)==0                                                                                         %Si la matriz subsistemas_disponibles en la posicion(2,2)contiene un valor diferente a cero entonces el dispositivo cuenta con subsitema de salida analogica.
        h=warndlg('La tarjeta no cuenta con canales de salida');                                                                   %Este mensaje de error se ejecuta si el dispositivo que se pretende utilizar no tiene subsistema de salida analogica, luego se aborta la ejecucion de la funcion.
        uiwait(h);   
        set(handles.Legend_Anadir_canal_de_salida,'Enable','off');
        set(handles.Anadir_Canal_Salida,'Enable','off');  
        set(handles.Legend_Anadir_canal_de_entrada,'Enable','on');
        set(handles.Anadir_Canal_Entrada,'Enable','on');
    else 
        set(handles.Legend_Anadir_canal_de_salida,'Enable','on');
        set(handles.Anadir_Canal_Salida,'Enable','on');
        set(handles.Legend_Anadir_canal_de_entrada,'Enable','on');
        set(handles.Anadir_Canal_Entrada,'Enable','on');
    end
    end

    Index_analogico_entrada=subsistemas_disponibles(2,1);                                                                           %Index_analogico_entrada nos indica en que posicion de los subistemas se encuentra el subsistema de entrada analogica. 

    s=daq.createSession('ni');                                                                                                      %La sesion s se emplea para la adquirir las señales a medir mediante las canales analogicos de entrada.
    q=daq.createSession('ni');                                                                                                      %La sesion q se emplea para generar las señales analogicas de salida.
    set(handles.Lista_Dispositivos,'Enable','off');
    set(handles.Buscar_Dispositivos,'Enable','off');
    set(handles.Informacion_Dispositivos,'Enable','off');
    set(handles.Iniciar_Sesion,'Enable','off');
    val=get(handles.Lista_Dispositivos,'value');                                                                                    %val es la variable donde se guarda el indice de la lista del dispositivo elegido.
    if val>1
    info=(info(1,val-1));                                                                                                           %info es la informacion del dispositivo elegido.
    end
    configuraciones=get(info.Subsystems(1,Index_analogico_entrada),'TerminalConfigsAvailable');
    if ischar(configuraciones)
        configuraciones={configuraciones};
    end
    rangos=get(info.Subsystems(1,Index_analogico_entrada),'RangesAvailable');
    rango_char=cell(1,length(rangos));
    for cont=1:length(rangos)
        rango_char{cont}=sprintf('%g to %g %s',rangos(cont).Min,rangos(cont).Max,rangos(cont).Units);
    end
    set(handles.Tabla_Canales_Analogicos,'ColumnFormat',{[]    []    []    []    []    configuraciones    rango_char})

    t_muestreo_max=max(info.Subsystems(1,Index_analogico_entrada).RateLimit);                                                       %t_muestreo_max es el maximo de escaneos por segundo soportado por el dispositivo.
    t_muestreo_min=min(info.Subsystems(1,Index_analogico_entrada).RateLimit);                                                       %t_muestreo_max es el minimo de escaneos por segundo soportado por el dispositivo.

    t_muestreo_max=1/t_muestreo_max;                                                                                                %El inverso del t_muestreo es el periodo de muestreo.        
    t_muestreo_min=1/t_muestreo_min;
    tex=sprintf('El menor tiempo de muestreo es: %i \n El maximo tiempo de muestreo es: %i s',t_muestreo_max,t_muestreo_min);
    set(handles.Legend_Periodo_MinimoyMaximo_Muestreo,'string',tex);

%----------Funciones dentro del panel de añadir canal de salida------------
%--------------------------------------------------------------------------
function Anadir_Canal_Salida_Callback(hObject, ~, handles)                                                                          %Esta funcion habilita los botones de accion del panel añadir canal de salida.
    global subsistemas_disponibles
    if subsistemas_disponibles(2,2)~=0
        set(handles.Salida_Analogica,'Enable','on','value',0);
    else
        set(handles.Salida_Analogica,'Enable','off','value',0);
    end
    if subsistemas_disponibles(2,3)~=0
         set(handles.Salida_Digital,'Enable','on','value',0);
    else
        set(handles.Salida_Digital,'Enable','off','value',0);
    end
   
    set(handles.Lista_Canales_Salida,'Enable','on','value',1);
    set(handles.Cancelar_Canal_salida,'Enable','on')

function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)                                                                   %Dentro del panel añadir canal de salida se tienen 2 opciones digital y analogica, esta funcion tiene como finalidad activarse cuando el usuario elige una u otra opcion y desplegar los canales disponibles ya sean digitales o analogicos en el menu desplegable.
    global info subsistemas_disponibles
    index_analogico=subsistemas_disponibles(2,2);
    index_digital=subsistemas_disponibles(2,3);
    b=get(handles.Salida_Digital,'value');
    c=get(handles.Salida_Analogica,'value');
    if b==1
        a=info.Subsystems(1,index_digital).ChannelNames;
        set(handles.Lista_Canales_Salida,'string',a,'value',1);
    elseif c==1
        a=info.Subsystems(1,index_analogico).ChannelNames;
        set(handles.Lista_Canales_Salida,'string',a,'value',1);
    end
    set(handles.Ok_Canales_Salida,'Enable','on');    
    
function Ok_Canales_Salida_Callback(hObject, ~, handles)                                                                            %Para finalizar el agregardo un canal de salida a la sesion se presiona el boton ok.
    global info s;
    val=get(handles.Lista_Canales_Salida,'value');  
    nombre=get(handles.Lista_Canales_Salida,'string');
    nombre=nombre(val);                                                                                                             %Mediante las funciones anteriores tomamos el nombre del canal que queremos agregar.
    
    [~,num]=size(s.Channels);                                                                                                       %Verificamos que el canal no ha sido añadido previamente a la sesion.
    for cont=1:num
        if strcmp(s.Channels(1,cont).ID,nombre)
            warndlg('El canal ya existe');
            return
        end
    end
   
    if get(handles.Salida_Digital,'value')==1                                                                                       %Si el canal de salida es digital se toman las siguientes caracteristicas.
       h=s.addDigitalChannel(info.ID,nombre,'OutputOnly');
       a=get(handles.Tabla_Canales_Digitales,'Data');
       [m,~]=size(a);
       b{1,1}='s';                                                                                                                  %Posicion 1:sesion a la que se agrego el canal.
       b{1,2}=num+1;                                                                                                                %Posicion 2:index del canal, ya que num es el numero de canales en sesion antes de añadir el nuevo canal, el canal nuevo sera el entero sucesivo a num.
       b{1,3}='dio';                                                                                                                %Posicion 3:tipo de subsistema dio(digital input-output).
       b{1,4}=info.ID;                                                                                                              %Posicion 4:ID del dispositivo.
       b{1,5}=h.ID;                                                                                                                 %Posicion 5:ID del canal.
       b{1,6}=h.MeasurementType;                                                                                                    %Posicion 6:configuracion del canal.
       if m>0                                                                                                                       %Si hay canales en sesion entonces la informacion del canal se añade a la de los demas en sesion.
            a=[a;b];
       else
            a=b;                                                                                                                    %Si no hay canales entonces en la tabla solo se despliega la informacion de este canal.
       end
       set(handles.Tabla_Canales_Digitales,'Data',a);
    elseif get(handles.Salida_Analogica,'value')==1                                                                                 %Si el canal de salida es analogico se toman las siguientes caracteristicas.
       h=s.addAnalogOutputChannel(info.ID,nombre,'voltage');
       a=get(handles.Tabla_Canales_Analogicos,'Data');
       [m,~]=size(a);
       b{1,1}='s';                                                                                                                  %Posicion 1:sesion a la que se agrego el canal. 
       b{1,2}=num+1;                                                                                                                %Posicion 2:index del canal, ya que num es el numero de canales en sesion antes de añadir el nuevo canal, el canal nuevo sera el entero sucesivo a num.        
       b{1,3}='ao';                                                                                                                 %Posicion 3:tipo de subsitema ao(analog output).
       b{1,4}=info.ID;                                                                                                              %Posicion 4:ID del dispositivo.
       b{1,5}=h.ID;                                                                                                                 %Posicion 5:ID del canal.
       b{1,6}=h.TerminalConfig;                                                                                                     %Posicion 6:configuracion del canal.
       b{1,7}='';
       b{1,8}=sprintf('%g to %g %s',h.Range.Min,h.Range.Max,h.Range.Units);                                                         %Posicion 7:Rango de voltaje de salida.        
       if m>0
            a=[a;b];                                                                                                                %Si hay canales en sesion entonces la informacion del canal se añade a la de los demas en sesion.
       else
            a=b;                                                                                                                    %Se no hay canales entonces en la tabal solo se despliega la informacion de este canal.
       end
       set(handles.Tabla_Canales_Analogicos,'Data',a);
    end
    set(handles.Lista_Canales_Salida,'Enable','off','string','Salidas','Value',1);
    set(handles.Salida_Digital,'Enable','off','Value',0);
    set(handles.Salida_Analogica,'Enable','off','Value',0);
    set(handles.Ok_Canales_Salida,'Enable','off')
    set(handles.Cancelar_Canal_salida,'Enable','off')
    set(handles.Borrar_Canal,'Enable','on');
    set(handles.Generar_Senales_Salida,'Enable','on');
    set(handles.Legend_Generar_senales_salida,'Enable','on');    
    set(handles.Legend_Borrar_canal,'Enable','on'); 
    
    function Cancelar_Canal_salida_Callback(hObject, eventdata, handles)                                                            %Esta funcion sirve para cancelar el proceso de añadir canal analogico de salida.
    set(handles.Salida_Digital,'Enable','off','Value',0)
    set(handles.Salida_Analogica,'Enable','off','Value',0)
    set(handles.Lista_Canales_Salida,'Enable','off','string','Salidas')
    set(handles.Ok_Canales_Salida,'Enable','off')
    set(handles.Cancelar_Canal_salida,'Enable','off')
    
%---------Funciones dentro del panel de añadir canal de entrada------------
%--------------------------------------------------------------------------
function Anadir_Canal_Entrada_Callback(hObject, eventdata, handles)                                                                 %Esta funcion habilita los botones de accion en el panel de añadir canal de entrada.
    set(handles.Entrada_Analogica,'Enable','on');
    set(handles.Lista_Canales_Entrada,'Enable','on','value',1);
    set(handles.Cancelar_Canal_Entrada,'Enable','on')

function uipanel9_SelectionChangeFcn(hObject, eventdata, handles)                                                                   %Esta funcion despliega los canales de entrada disponibles en la lista desplegable, cuando se selecciona el radiobutton en caso contrario solo aparece la palabra "Entradas" 
    global info
    val=get(handles.Entrada_Analogica,'value');
    if val==1
        a=info.Subsystems(1,1).ChannelNames;
        set(handles.Lista_Canales_Entrada,'string',a);
        set(handles.Ok_Canal_Entrada,'Enable','on');
    else
        set(handles.Lista_Canales_Entrada,'string','Entradas');
        set(handles.Ok_Canal_Entrada,'Enable','off');
    end
    
function Ok_Canal_Entrada_Callback(hObject, eventdata, handles)                                                                     %Para finalizar el agregado de un canal se presiona el boton ok.
    global info q;
    val=get(handles.Lista_Canales_Entrada,'value');
    nombre=get(handles.Lista_Canales_Entrada,'string');
    nombre=nombre(val);                                                                                                             %Las lineas anteriores son para extraer el nombre del canal que se desea añadir.
    [~,num]=size(q.Channels);                                                                                                       %num es el numero de canales en la sesion q.
      
    for cont=1:num                                                                                                                  %Se verifica que el canal no haya sido añadido previamente a la sesion.                                                                                           
        if strcmp(q.Channels(1,cont).ID,nombre)
            warndlg('El canal ya existe');
            return
        end
    end
    h=q.addAnalogInputChannel(info.ID,nombre,'voltage');                                                                            %Ya que solo podemos añadir canales de entrada analogicos a la sesion se extrae la siguiente informacion.
    a=get(handles.Tabla_Canales_Analogicos,'Data');
    [m,~]=size(a);
    b{1,1}='q';                                                                                                                     %Posicion 1:sesion a la cual se añadio el canal.
    b{1,2}=num+1;                                                                                                                   %Posicion 2:index del canal.
    b{1,3}='ai';                                                                                                                    %Posicion 3:subsistema ai(analog input).
    b{1,4}=info.ID;                                                                                                                 %Posicion 4:ID del dispositivo.
    b{1,5}=h.ID;                                                                                                                    %Posicion 5:ID del canal.
    b{1,6}=h.TerminalConfig;                                                                                                        %Posicion 6:Configuracion del canal.
    b{1,7}=sprintf('%g to %g %s',h.Range.Min,h.Range.Max,h.Range.Units);                                                            %Posicion 7:Rango de voltaje de entrada. 
    b{1,8}='';
    if m>0                                                                                                                          %Si ya hay canales en sesion la informacion de este canal se añade a la de los canales en sesion.
        a=[a;b];
    else                                                                                                                            %Si no hay otro canal en sesion entonces solo se despliega la informacion de este canal.
        a=b;            
    end
    set(handles.Tabla_Canales_Analogicos,'Data',a);
    set(handles.Lista_Canales_Entrada,'string','Entradas','Value',1,'Enable','off');
    set(handles.Entrada_Analogica,'Enable','off','Value',0);
    set(handles.Ok_Canal_Entrada,'Enable','off');
    set(handles.Cancelar_Canal_Entrada,'Enable','off');
    set(handles.Borrar_Canal,'Enable','on');
    set(handles.Adquirir_Datos,'Enable','on');
    set(handles.Legend_Borrar_canal,'Enable','on'); 
    
function Cancelar_Canal_Entrada_Callback(hObject, eventdata, handles)                                                               %Si se desea cancelar el proceso de añadir el canal se presiona el boton cancelar y se deshabilitan los botones de accion dentro del panel de añadir canal de entrada analogico.
    set(handles.Lista_Canales_Entrada,'string','Entradas','Enable','off')
    set(handles.Entrada_Analogica,'value',0,'Enable','off')
    set(handles.Cancelar_Canal_Entrada,'Enable','off')
    set(handles.Ok_Canal_Entrada,'Enable','off')   
    
%--------------Funciones dentro del panel de borrar canal------------------
%--------------------------------------------------------------------------    
function Borrar_Canal_Callback(hObject, eventdata, handles)                                                                         %Esta funcion habilita los botones de accion dentro del panel de borrar canal.
    set(handles.Indice_Borrar_Canal,'Enable','on');
    set(handles.Legend_Index,'Enable','on');
    set(handles.Ok_Borrar_Canal,'Enable','on');
    set(handles.Cancelar_Borrar_Canal,'Enable','on');
    set(handles.Lista_Sesiones,'Enable','on');
    
function Ok_Borrar_Canal_Callback(hObject, eventdata, handles)                                                                      %Cuando se ha elegido el index del canal que se desea borrar y la sesion a la cual fue añadido el canal la accion se finaliza al presionar el boton ok.
    global s q
    data=get(handles.Tabla_Canales_Analogicos,'Data');
    data1=get(handles.Tabla_Canales_Digitales,'Data');
    index=str2double(get(handles.Indice_Borrar_Canal,'string'));                                                                    %index es el indice del canal a borrar.
    val=get(handles.Lista_Sesiones,'value');
    nombre=get(handles.Lista_Sesiones,'string');
    nombre=nombre(val);                                                                                                             %nombre contiene la sesion a la que pertenece el canal a borrar.

    if strcmp(nombre,'s')                                                                                                           %Si la sesion elegida es s
        [~,num_s]=size(s.Channels);
        if index<=num_s                                                                                                             %Se comprueba que el index se menor al numero de canales en esa sesion.
            s.removeChannel(index);                                                                                                 %Se borra el canal.
            if num_s==1                                                                                                             %Si el numero de canales en la sesion s era 1 antes de borrar el canal entonces ahora no hay canles en sesion por lo que se deshabilita el panel de generar señales de salida. 
                set(handles.Generar_Senales_Salida,'Enable','off')
                set(handles.Tabla_Canales_Salida,'Data',[])
                set(handles.Legend_Generar_senales_salida,'Enable','off')
            else                                                                                                                    %En caso de que por lo menos haya un canal en sesion se generan las señales de salida para los canales que aun quedan en sesion.
                Generar_Senales_Salida_Callback(hObject, eventdata, handles); 
            end
        else
             h=errordlg('El canal que se desea eliminar no existe');
             uiwait(h);
             return
        end
    elseif strcmp(nombre,'q')                                                                                                       %Si la sesion elegida es la sesion q. 
        [~,num_q]=size(q.Channels);                                                                                                 %num_q es el numero de canales en la sesion q.
        if index<=num_q                                                                                                             %Se comprueba que el index del canal que se desea borrar sea menor al numero de canales en la sesion.
            q.removeChannel(index);                                                                                                 %Se borra el canal de la sesion.
        else
            h=errordlg('El canal que se desea eliminar no existe');
            uiwait(h)
            return
        end
    else                                                                                                                            %En caso de que no se haya elegido ninguna sesion se manda el siguiente mensaje de error.    
        h=errordlg('No has elegido una sesion valida');
        uiwait(h);
    end


    Ordenar_Callback(hObject, eventdata, handles);                                                                                  %La funcion ordenar refresca las tablas de los canales en sesion analogicos/digitales
    set(handles.Indice_Borrar_Canal,'Enable','off','string','');
    set(handles.Legend_Index,'Enable','off');
    set(handles.Ok_Borrar_Canal,'Enable','off'); 
    [~,num]=size(s.Channels);
    [~,num1]=size(q.Channels);
    
  if num==0 && num1==0                                                                                                              %Si ya no hay ningun canal en sesion se deshabilitan los botones de accion en el panel borra canal.
     set(handles.Indice_Borrar_Canal,'Enable','off','string','');
     set(handles.Legend_Borrar_canal,'Enable','off');
     set(handles.Legend_Index,'Enable','off');
     set(handles.Borrar_Canal,'Enable','off');
     set(handles.Ok_Borrar_Canal,'Enable','off');
     set(handles.Adquirir_Datos,'Enable','off');
     set(handles.Generar_Senales_Salida,'Enable','off');
     set(handles.Cancelar_Borrar_Canal,'Enable','off');
     set(handles.Lista_Sesiones,'value',1,'Enable','off')
  end
   set(handles.Cancelar_Borrar_Canal,'Enable','off');
   set(handles.Lista_Sesiones,'value',1,'Enable','off')
  
   if num1==0                                                                                                                       %Si no hay canales de entrada analogica se deshabilita el boton de adquirir datos.
       set(handles.Adquirir_Datos,'Enable','off')
   end
   
   function Cancelar_Borrar_Canal_Callback(hObject, eventdata, handles)                                                             %Esta funcion se ejecuta cuando se requiere abortar la ejecucion del borrado de un canal.
    set(handles.Lista_Sesiones,'Value',1,'Enable','off')
    set(handles.Ok_Borrar_Canal,'Enable','off')
    set(handles.Cancelar_Borrar_Canal,'Enable','off')
    set(handles.Legend_Index,'Enable','off')
    set(handles.Indice_Borrar_Canal,'Enable','off','string','')
   
%------Funciones de modificacion de configuracion de canal analogico-------
%--------------------------------------------------------------------------
function Tabla_Canales_Analogicos_CellSelectionCallback(hObject, eventdata, handles)                                                %Esta funcion guarda en la variable analog una copia de la informacion de los canales analogicos en sesion cada que se selecciona una celda de la tabla.
    global analog
    analog=get(handles.Tabla_Canales_Analogicos,'Data');
    
function Tabla_Canales_Analogicos_CellEditCallback(hObject, eventdata, handles)                                                     %Esta funcion se activa cuando se edita una celda de la tabla. Para la tabal de señales analogicas solo la columna de configuracion esta habilitada. Compara los datos de la tabla ya modificada con la copia adquirida en la funcion anterior (analog) para identificar el canal que se desea modificar. 
    global s q analog info subsistemas_disponibles

    a=get(handles.Tabla_Canales_Analogicos,'Data');                                                                                 %a contiene  la informacion modificada de la tabla de canales analogicos.
    [m,~]=size(a);
    canales=a(1:m,3);                                                                                                               %canales es un vector con los canales en sesion.
    conf1=a(1:m,6);                                                                                                                 %conf1 contiene la configuracion de los canales antes de modificarse.
    conf2=analog(1:m,6);                                                                                                            %conf2 contiene la configuracion de los canales ya modificados.
    index=a(1:m,2);                                                                                                                 %index es el indice de los canales en su sesion correspondiente.
    rango_entrada1=a(1:m,7);
    rango_entrada2=analog(1:m,7);
    for cont=1:m                                                                                                                    %Verificamos para todos los canales en sesion.
        if strcmp(canales(cont),'ai')                                                                                               %Si el canal es del tipo ai entonces esta en la sesion q.
            if strcmp(conf1(cont),conf2(cont))~=1
                Conf_disponibles=q.Channels(1,index{cont}).Device.Subsystems(1,1).TerminalConfigsAvailable;                         %Conf_disponibles tiene las configuraciones disponibles para el tipo de canala ai.
                [~,tam]=size(Conf_disponibles);
                for cont1=1:tam                                                                                                     %Comparamos las configuraciones disponibles con la configuracion deseada.
                    if strcmp(conf1(cont),Conf_disponibles(cont1))
                        set(q.Channels(1,index{cont}),'TerminalConfig',conf1{cont}); 
                        set(handles.Tabla_Canales_Analogicos,'Data',a);
                        return
                    end
                end
                    h=warndlg('La configuracion no esta disponible');                                                               %Si el codigo llega a esta seccion entonces no se encontro coincidencia entre las configuraciones disponibles y la configuracion deseada y se manda el mensaje de error.            
                    uiwait(h);
                    set(handles.Tabla_Canales_Analogicos,'Data',analog);
                    return
            end
        elseif strcmp(canales(cont),'ao')                                                                                           %Si el canal es del tipo ao entonces esta en la sesion s.                                                                                                                            %
            if strcmp(conf1(cont),conf2(cont))~=1
                Conf_disponibles={s.Channels(1,index{cont}).Device.Subsystems(1,2).TerminalConfigsAvailable};                       %Conf_disponibles tiene las configuraciones disponibles para el tipo de canala ao.
                tam=length(Conf_disponibles);
                for cont1=1:tam
                    if strcmp(conf1(cont),Conf_disponibles(cont1))                                                                  %Comparamos las configuraciones disponibles con la configuracion deseada.
                        set(s.Channels(1,index{cont}),'TerminalConfig',conf1{cont});
                        set(handles.Tabla_Canales_Analogicos,'Data',a);
                        return
                    else                                                                                                            %Si el codigo llega a esta seccion entonces no se encontro coincidencia entre las configuraciones disponibles y la configuracion deseada y se manda el mensaje de error.            
                        h=warndlg('La configuracion no esta disponible');
                        uiwait(h);
                        set(handles.Tabla_Canales_Analogicos,'Data',analog);
                        return
                    end
                end
            end
            
        end
    end
    Index_analogico_entrada=subsistemas_disponibles(2,1);                                                                                  %val es la variable donde se guarda el indice de la lista del dispositivo elegido.                                                                                                          %info es la informacion del dispositivo elegido.
    rangos=get(info.Subsystems(1,Index_analogico_entrada),'RangesAvailable');
    rango_char=cell(1,length(rangos));
    for cont=1:length(rangos)
        rango_char{cont}=sprintf('%g to %g %s',rangos(cont).Min,rangos(cont).Max,rangos(cont).Units);
    end
    
    for cont=1:m                                                                                                                    %Verificamos para todos los canales en sesion.
        if strcmp(canales(cont),'ai')
            if strcmp(rango_entrada1(cont),rango_entrada2(cont))~=1
                [~,tam]=size(rangos);
                for cont1=1:tam                                                                                                     %Comparamos las configuraciones disponibles con la configuracion deseada.
                    if strcmp(rango_entrada1(cont),rango_char(cont1))
                        set(q.Channels(1,index{cont}),'Range',rangos(cont1)); 
                        set(handles.Tabla_Canales_Analogicos,'Data',a);
                        return
                    end
                end
            end
        elseif strcmp(canales(cont),'ao')
            if strcmp(rango_entrada1(cont),rango_entrada2(cont))~=1
                a{cont,7}='';
                set(handles.Tabla_Canales_Analogicos,'Data',a)
                return
            end
        end
    end
            
    
    
%-------------------Funcion generar señales de salida----------------------
%--------------------------------------------------------------------------
function Generar_Senales_Salida_Callback(hObject, eventdata, handles)                                                               %Para las señales de salida se requiere un vector del mismo tamaño que el numero de canales en sesion. Este funcion crea ese vector dondo valor de 5 a los canales analogicos y de 1 a los canales digitales.
    global s salidas2
    
    [~,num]=size(s.Channels);                                                                                                       %num es el numero de canales de salida.        
    salida=cell(num,3);
    salidas2=zeros(1,num);                                                                                                          %salidas2 es el vector donde se asignaran los valores a las salidas.   
    
    if num==0                                                                                                                       %si no hay ningun canal de salida se despliega la advertencia.
        salidas2=[];
        warndlg('No hay ningun canal de salida');
    end
    
    for cont=1:num                                                                                                                  %Se asigna a cada canal una salida, la posicion en el vector de salida corresponde tambien al index del canal.
       salida{cont,1}=s.Channels(1,cont).ID;
            if strcmp(s.Channels(1,cont).MeasurementType,'Voltage')
                salida{cont,2}='Escalon analogico';
                min=s.Channels(1,cont).Range.Min;
                max=s.Channels(1,cont).Range.Max;
                anse=str2double(inputdlg(sprintf('Valor del escalon (%i-%i)',max,min),salida{cont,1},1,{'5'}));
                if anse>max
                    anse=max;
                elseif anse<min
                    anse=min;
                end
                salida{cont,3}=anse;
                salidas2(cont)=anse;
            elseif strcmp(s.Channels(1,cont).MeasurementType,'OutputOnly')
                salida{cont,2}='Escalon digital';
                salidas2(cont)=1;
                salida{cont,3}=1;
            end
    end
    
    set(handles.Tabla_Canales_Salida,'Data',salida);
    
%--------------------Funcion de adquisicion de datos-----------------------
%--------------------------------------------------------------------------
function Adquirir_Datos_Callback(hObject, eventdata, handles)                                                                       %Esta funcion inicia la adquisicion de datos en modo background.
    global s q ejes salidas2  t_o data lh d_leidos info subsistemas_disponibles stop_salida
    stop_salida=0;
    if get(handles.Retardo_Random,'value')                                                                                          %Si el checkbox Retardo _Random  esta activado entonces el vector de retardos se toma de la funcion de retardo aleatoria.
         t_duracion=Unidades_Tiempo_Simulacion(handles);
         retardos=funcion_retardo_aleatorio(t_duracion);                                                                            %La funcion funcion_retardo_aleatorio devuelve un vector de retardo aleatorio.
    else 
        retardos=str2num(get(handles.Vector_Retardos,'string'));                                                                    %Retardos es el vector de retardos para los cambios de estado de la salida.
        if isempty(retardos)                                                                                                        %En caso de que no se introduzca ningun valor el valor normal para el retardo es cero, y si cambios de estado intermedios.
            retardos=0;
        end
    end
    
    
    Ocupado(handles);
    d_leidos=0;
    set(handles.Tabla_Datos,'Data',[])                                                                                              %Se borran los datos de la Tabla de datos.
    m=length(salidas2);                                                                                                             %Salidas2 tiene los valores de las señales de salida.
    salidas1=zeros(1,m);                                                                                                            %Salidas1 es un vector de ceros del mismo tamaño de salidas2 y sirve para reiniciar los valores de salida a cero.
    [~,num]=size(s.Channels);
    [~,num1]=size(q.Channels);
    if num>0                                                                                                                        %Si en la sesion s(canales de salida) tenemos por lo menos un canal en sesion se inician todos en cero.
        s.outputSingleScan(salidas1);
    end
    if num1==0                                                                                                                      %Se verifica que por lo menos haya un canal de entrada.
        warndlg('Tiene que haber por lo menos una entrada')
        return
    end
        
    t_muestreo=Unidades_Periodo_Muestreo(handles);                                                                                  %Se toma el tiempo de muestreo.    
    if t_muestreo<1/max(info.Subsystems(1,subsistemas_disponibles(2,1)).RateLimit) || t_muestreo>1/min(info.Subsystems(1,subsistemas_disponibles(2,1)).RateLimit) %Verificamos que el tiempo de muestreo esta en rango.
       h=errordlg('El periodo de muestreo no esta en el rango permitido');
       uiwait(h)
       return
    end
    t_duracion=Unidades_Tiempo_Simulacion(handles);                                                                                 %El tiempo de duracion.
    t_o=[];                                                                                                                         %t_o es el vector de tiempo de adquisicion.
    data=[];                                                                                                                        %data es una matriz de mxn donde m es el numero de muestras y n el numero de canales. 
    ejes=handles.Senales_Adquiridas;                                                                                                %ejes contiene el handles de la figura donde se desea graficar.
    cla(ejes);
    lh=q.addlistener('DataAvailable',@guardar);                                                                                     %Debido a que se emplea la adquisicion en modo background se deben de añadir listener que ejecuten funciones cada que haya nueva informacion disponible. lh es un listener concatena la nueva informacion a la informacion anterior.
    lh2=q.addlistener('DataAvailable',@plotear);                                                                                    %Plotear grafica la informacion conforme se va adquiriendo en la figura ejes.
    q.DurationInSeconds=t_duracion;                                                                                                 %Definimos la duracion de la adquisicion.
    q.Rate=1/t_muestreo;                                                                                                            %Definimos el numero de escaneos por segundo.
    set(handles.Abortar,'Enable','on')
    q.startBackground;                                                                                                              %Iniciamos la adquisicion.
    if num>0                                                                                                                        %Si tenemos canales de salida entonces llamamos a la funcion retardo justo despues de iniciada la adquisicion.    
        retardo(s,salidas1,salidas2,retardos);
    end
    q.wait();                                                                                                                       %wait espera hasta que termina la adquisicion para seguir ejectutando la funcion.
    if num>0
        s.outputSingleScan(salidas1);
    end
    Tabular_Callback(hObject, eventdata, handles)
    set(handles.Abortar,'Enable','off')
    Desocupado(handles);
   
%---------------------------Funciones finales------------------------------    
%--------------------------------------------------------------------------
function Ordenar_Callback(hObject, eventdata, handles)                                                                              %Esta funcion refresca la informacion de los canales en sesion.
    global s q
    Ocupado(handles);
    [~,m]=size(s.Channels);
    [~,m1]=size(q.Channels);
    a=[];
    b=[];
    
    
    i=1;
    k=1;
    for cont=1:m                                                                                                                    %Inicia con los canales en la seseion s
        if strcmp(s.Channels(1,cont).MeasurementType,'Voltage')                                                                     %Si es canal analogico entonces Measurement Type es voltaje. Usamos esta caracteristica para distinguirlo de un canal digital.
            a{i,1}='s';                                                                                                                 
            a{i,2}=cont;
            a{i,3}='ao';
            a{i,4}=s.Channels(1,cont).Device.ID;
            a{i,5}=s.Channels(1,cont).ID;
            a{i,6}=s.Channels(1,cont).TerminalConfig;
            a{i,7}=sprintf('%g to %g %s',s.Channels(1,cont).Range.Min,s.Channels(1,cont).Range.Max,s.Channels(1,cont).Range.Units);
            i=i+1;
        elseif strcmp(s.Channels(1,cont).MeasurementType,'OutputOnly')                                                              %Si es un canal digital entonces MeasurementType es OutputOnly.
            b{k,1}='s';
            b{k,2}=cont;
            b{k,3}='dio';
            b{k,4}=s.Channels(1,cont).Device.ID;
            b{k,5}=s.Channels(1,cont).ID;
            b{k,6}=s.Channels(1,cont).MeasurementType;
            k=k+1;
        end
    end
    for cont=1:m1                                                                                                                   %Despues de terminar con los canales en la sesion s prosigue con loc canales en la sesion q.
        if strcmp(q.Channels(1,cont).MeasurementType,'Voltage')                                                                     %Ya que solo tiene canales analogico MeasurementType es voltaje.
            a{i,1}='q';
            a{i,2}=cont;
            a{i,3}='ai';
            a{i,4}=q.Channels(1,cont).Device.ID;
            a{i,5}=q.Channels(1,cont).ID;
            a{i,6}=q.Channels(1,cont).TerminalConfig;
            a{i,7}=sprintf('%g to %g %s',q.Channels(1,cont).Range.Min,q.Channels(1,cont).Range.Max,q.Channels(1,cont).Range.Units);
            i=i+1;
        end
    end
    
    set(handles.Tabla_Canales_Analogicos,'Data',a);
    set(handles.Tabla_Canales_Digitales,'Data',b);
    Desocupado(handles);
    
function Tratar_Datos_Callback(hObject, eventdata, handles)                                                                         %Esta funcion tiene como proposito cambiar la señal de entrada a sus valores originales, es decir, remover la ganancia y desviacion del sensor.
    global cont  t_muestreo nombres t_o data ejes
    Ocupado(handles);
    data=get(handles.Tabla_Datos,'Data');
    nombres=get(handles.Tabla_Datos,'ColumnName');
    t_muestreo=Unidades_Periodo_Muestreo(handles);
    [~,n]=size(data);
    for cont=1:n
        h=tratado_datos;                                                                                                            %Tratado de datos es la interfaz permite al usuario ajustar la ganancia y desviacion para contrarestar el efecto del sensor. Se llamara tantas veces a tratado de datos como canales de entrada hay en la sesion.
        uiwait(h);
    end
    set(handles.Tabla_Datos,'Data',data);
    cla(handles.Senales_Adquiridas)
    plot(handles.Senales_Adquiridas,t_o,data)
    legend(handles.Senales_Adquiridas,nombres);
    Desocupado(handles);
    
function Importar_Callback(hObject, eventdata, handles)                                                                             %Impotar sirve para cerrar la interfaz de adquisicion y regresar las señales adquiridas a a la interfaz principal de identificacion.
    clear global nombres s q info 
    close(handles.figure1);
    


function Nueva_Sesion_Callback(hObject, eventdata, handles)                                                                         %Nueva sesion borra todos los datos de la sesion actual, para poder iniciar una nueva sesion con un nuevo dispositivo. 
    Ocupado(handles);
    daq.reset;
    set(handles.Lista_Dispositivos,'value',1,'Enable','off')
    set(handles.Buscar_Dispositivos,'Enable','on')
    set(handles.Informacion_Dispositivos,'Enable','off')
    set(handles.Iniciar_Sesion,'Enable','off')
    set(handles.Salida_Analogica,'Enable','off','value',0)
    set(handles.Salida_Digital,'Enable','off','value',0)
    set(handles.Legend_Anadir_canal_de_salida,'Enable','off')
    set(handles.Anadir_Canal_Salida,'Enable','off')
    set(handles.Legend_Borrar_canal,'Enable','off')
    set(handles.Borrar_Canal,'Enable','off')
    set(handles.Abortar,'Enable','off')
    set(handles.Legend_Anadir_canal_de_entrada,'Enable','off')
    set(handles.Anadir_Canal_Entrada,'Enable','off')
    set(handles.Generar_Senales_Salida,'Enable','off')
    set(handles.Legend_Generar_senales_salida,'Enable','off')
    set(handles.Adquirir_Datos,'Enable','off')
    set(handles.Legend_Periodo_MinimoyMaximo_Muestreo,'string','')
    cla(handles.Senales_Adquiridas)
    legend(handles.Senales_Adquiridas,'off')
    set(handles.Tabla_Datos,'Data',[])
    set(handles.Tabla_Datos,'ColumnName',[])
    set(handles.Tabla_Canales_Analogicos,'Data',[])
    set(handles.Tabla_Canales_Digitales,'Data',[])
    set(handles.Tabla_Canales_Salida,'Data',[])
    Cancelar_Canal_salida_Callback(hObject, eventdata, handles)
    Cancelar_Canal_Entrada_Callback(hObject, eventdata, handles)
    Cancelar_Borrar_Canal_Callback(hObject, eventdata, handles)
    Desocupado(handles);
    
function Tabular_Callback(hObject, eventdata, handles)                                                                              %Tabular sirve para tabular los datos de las señales durante la adquisicion, aunque esta aun no haya terminado.
    global q data t_o
    set(handles.Tabla_Datos,'Data',data)
    [~,num]=size(q.Channels);
    nombres=cell(num,1);
    for cont=1:num
        nombres{cont,1}=q.Channels(1,cont).ID;
    end
    set(handles.Tabla_Datos,'ColumnName',nombres)
    plot(handles.Senales_Adquiridas,t_o,data)
    legend(handles.Senales_Adquiridas,nombres);

function Abortar_Callback(hObject, eventdata, handles)                                                                              %Abortar sirve para para la adquisicion en el momento en que desee el usuario.
    global q stop_salida
    q.stop();
    stop_salida=1;
    Tabular_Callback(hObject, eventdata, handles)



function Vector_Retardos_Callback(hObject, eventdata, handles)
% hObject    handle to Vector_Retardos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Vector_Retardos as text
%        str2double(get(hObject,'String')) returns contents of Vector_Retardos as a double


% --- Executes during object creation, after setting all properties.
function Vector_Retardos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vector_Retardos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Retardo_Random.
function Retardo_Random_Callback(hObject, eventdata, handles)                                                                       %Esta funcion corresponde al checkbox Retardo Random y si esta activo la que hace es que el vector de retardos es generado al azar.
    if get(handles.Retardo_Random,'value')
        set(handles.Vector_Retardos,'Enable','off')
    else
        set(handles.Vector_Retardos,'Enable','on')
    end
    


% --- Executes on button press in Guardar.
function Guardar_Callback(hObject, eventdata, handles)
    global data valores
    t_muestreo=Unidades_Periodo_Muestreo(handles);
    [m,n]=size(data);
    Datos=cell(8,n);
    [nombre_archivo,path,index]=uiputfile({'*.txt';'*.xls';'*.xlsx'});
    nombre=strcat(path,nombre_archivo);
    h=Eleccion_salidas_entradas;
    uiwait(h);
    pause(2)
    Datos{1,1}='Numero_de_salidas';
    Datos{2,1}=valores(1);
    Datos{3,1}='Numero_de_entradas';
    Datos{4,1}=valores(2);
    Datos{5,1}='Periodo_de_muestreo';
    Datos{6,1}=t_muestreo;
    Datos{7,1}='Numero_de_datos';
    Datos{8,1}=m;
    
    if valores(1)>0
        Salida=data(:,1:valores(1));
        Salida=num2cell(Salida);
    else
        Salida=[];
    end
    
    if valores(2)>0
        Entrada=data(:,valores(1)+1:n);
        Entrada=num2cell(Entrada);
    else
        Entrada=[];
    end
    
    if valores(1)>0 && valores(2)>0
        Arch=[Datos;Salida,Entrada];
        tabla=table(Arch);
    elseif valores(1)>0 && valores(2)<=0
        Arch=[Datos;Salida];
        tabla=table(Arch);
    elseif valores(1)<=0 && valores(2)>0
        Arch=[Datos;Entrada];
        tabla=table(Arch);
    end
    if index==1
        writetable(tabla,nombre,'Delimiter','\t','WriteVariableNames',false);
    else
        writetable(tabla,nombre,'WriteVariableNames',false)
    end
