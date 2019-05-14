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
%tarjetas de adqusicion de la  marca  NI(National Instruments) que permiten 
%el  poner en la  cola de  salida señales  analogicas. Esto permite generar  
%señales  de salida  analogicas  que van  desde un  escalon hasta una señal 
%senoidal por sitar algunos ejemplos. 

%La funcionalidad de cada una de las funciones del presente script asi como
%el proposito de cada una  de las variables se  introducen en el cuerpo del
%programa  en forma de  comentarios  para  facilitar  el  entendimiento del
%programa.



function varargout = Adquisicion_datos_con_contador_de_salida(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Adquisicion_datos_con_contador_de_salida_OpeningFcn, ...
                   'gui_OutputFcn',  @Adquisicion_datos_con_contador_de_salida_OutputFcn, ...
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
function Adquisicion_datos_con_contador_de_salida_OpeningFcn(hObject, eventdata, handles, varargin)
    global info    estado_validacion P_muestreo                                                                 %Se declara global la variable "info" que contendra la informacion de las tarjetas NI conectadas a la computadora.
    Ocupado(handles);                                                               %Esta funcion despliega una imagen en la interfaz la cual contiene la palabra "ocupado", con el fin de informar al usuario que esta bajo ejecucion alguna funcion.
    daq.reset;                                                                      %Este comando borra todos los objetos del toolbox "data adqusition" del workspace de MATLAB. 
    info=daq.getDevices;                                                            %El comando devuelve dentro de la variable info la lista de dispositivos disponibles en el sistema y sus caracterisicas.                                        
    Dispositivos={info.Model};                                                      %En la variable dispositivos se guarda una lista de los modelos de los dispositivos disponibles en el sistema.
    Dispositivos=[{'Dispositivos'},Dispositivos];                                   %Agregamos la palabra "Dispositivos" a la lista para que sea desplegada en la lista de dispositivos.
    set(handles.Lista_Dispositivos,'string',Dispositivos,'Enable','on','value',1);
    set(handles.Informacion_Dispositivos,'Enable','off');
    set(handles.Lista_Dispositivos,'value',1);
    set(handles.Lista_Canales,'value',1,'Enable','off');
    set(handles.Legend_Anadir_canal,'Enable','off');
    set(handles.Informacion_Dispositivos,'Enable','off');
    set(handles.Iniciar_Sesion,'Enable','off');
    set(handles.Anadir_Canal,'Enable','off');
    set(handles.Ok_Anadir_Canal,'Enable','off');
    set(handles.Entrada_Analogica,'value',0,'Enable','off');
    set(handles.Salida_Analogica,'value',0,'Enable','off');
    set(handles.Tabla_Canales_En_Sesion,'Data',[]);
    set(handles.Index,'Enable','off');
    set(handles.Borrar_Canal,'Enable','off');
    set(handles.Ok_Borrar_Canal,'Enable','off');
    set(handles.Legend_Borrar_canal,'Enable','off');
    set(handles.Legend_Seleccionar_index,'Enable','off');
    set(handles.Adquirir_Datos,'Enable','off');
    set(handles.Frecuencia_Minima,'Enable','off');
    set(handles.Frecuencia_Maxima,'Enable','off');
    set(handles.text8,'Enable','off');
    set(handles.text9,'Enable','off');
    set(handles.Tabla_Datos,'Data',[]);
    cla(handles.Senales_Adquiridas);
    axis(handles.Indicador_Ocupado,'off')
    if estado_validacion==1
        set(handles.Periodo_Muestreo,'string',num2str(P_muestreo),'Enable','inactive');
        set(handles.Unidades_Periodo_Muestreo,'Enable','inactive')
    end
    Desocupado(handles);
    
    handles.output = hObject;
    guidata(hObject, handles);

function varargout = Adquisicion_datos_con_contador_de_salida_OutputFcn(~, ~, handles) 
    varargout{1} = handles.output;

%--------------------------------CreateFcn---------------------------------
%--------------------------------------------------------------------------
function Lista_Dispositivos_CreateFcn(hObject, ~, ~)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
function Lista_Canales_CreateFcn(hObject, ~, ~)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
function Lista_Canales_Callback(hObject, eventdata, handles)
function Tiempo_Simulacion_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
function Tiempo_Simulacion_Callback(hObject, eventdata, handles)
function Periodo_Muestreo_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
function Periodo_Muestreo_Callback(hObject, eventdata, handles)
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end    
function edit6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Frecuencia_Maxima_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
function Frecuencia_Maxima_Callback(hObject, eventdata, handles)
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
function Frecuencia_Minima_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Frecuencia_Minima_Callback(hObject, eventdata, handles)
function Index_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Index_Callback(hObject, eventdata, handles)
function pushbutton15_Callback(hObject, eventdata, handles)
    
%-------------------------------Menus--------------------------------------
%--------------------------------------------------------------------------
function menu_axes1_Callback(hObject, eventdata, handles)
    function menu_limites_Callback(hObject, eventdata, handles)
        function menu_limitesx_Callback(hObject, eventdata, handles)                                                               %Esta funcion se emplea para definir manualmente los limites de x en la figura de señales adquiridas.
            global x_1 x_2
            Ocupado(handles);
            h=limite_;
            uiwait(h);
            set(handles.Senales_Adquiridas,'Xlim',[x_1 x_2]);
            Desocupado(handles);
        function menu_limitesy_Callback(hObject, eventdata, handles)                                                                %Esta funcion se emplea para definir manualmente los limites de y en la figura de señales adquiridas.
            global y_1 y_2
            Ocupado(handles);
            h=limite_y;
            uiwait(h);
            set(handles.Senales_Adquiridas,'Ylim',[y_1 y_2]);
            Desocupado(handles);

%--------------------------Funciones iniciales-----------------------------
%--------------------------------------------------------------------------
function Lista_Dispositivos_Callback(hObject, ~, handles)                                                                           %Esta funcion habilita o deshabilita los pushbutton de Informacion_Dispositivos e Iniciar_Sesion.
    if get(hObject,'value')>1
        set(handles.Informacion_Dispositivos,'Enable','on');
        set(handles.Iniciar_Sesion,'Enable','on');
    else
        set(handles.Informacion_Dispositivos,'Enable','off');
        set(handles.Iniciar_Sesion,'Enable','off');
    end
    
function Buscar_Dispositivos_Callback(hObject, ~, handles)                                                                          %En casos de que al inicializarse la interfaz no se haya encontrado un dispostivo deseado o este se haya conectado despues de inicializada la interfaz, se puede emplear este boton para que el dispositivo sea desplegado en la lista de dispositivos.  
    global info                                                                                                                     %Se declara la variable info como global.
    Ocupado(handles);                                                                                                               %Esta funcion despliega una imagen en la interfaz la cual contiene la palabra "ocupado", con el fin de informar al usuario que esta bajo ejecucion alguna funcion.
    daq.reset;                                                                                                                      %Este comando borra todos los objetos del toolbox "data adqusition" del workspace de MATLAB. 
    info=daq.getDevices;                                                                                                            %El comando devuelve dentro de la variable info la lista de dispositivos disponibles en el sistema y sus caracterisicas.                                        
    Dispositivos={info.Model};                                                                                                      %En la variable dispositivos se guarda una lista de los modelos de los dispositivos disponibles en el sistema.
    Dispositivos=[{'Dispositivos'},Dispositivos];                                                                                   %Agregamos la palabra "Dispositivos" a la lista para que sea desplegada en la lista de dispositivos.
    set(handles.Lista_Dispositivos,'string',Dispositivos,'Enable','on','value',1);
    set(handles.Informacion_Dispositivos,'Enable','off');
    Desocupado(handles);                                                                                                            %Esta funcion borra la imagen que indica al usuario que se esta ejecutando una funcion, por lo tanto indica que la funcion ha finalizado.
     
function Informacion_Dispositivos_Callback(hObject, ~, handles)
    global info                                                                                                                     %Declaramos la variable info como global, esto nos permite utilizar la informacion de los dispositivos disponibles en el sistema, procedente de alguna de las dos funciones anteriores.
    indice=get(handles.Lista_Dispositivos,'value');                                                                                 %En la variable indice se guarda la posicion de la lista de dispositivos del dispositivo que se haya elegido. 
    if indice>1                                                                                                                     %Si el indice es mayor a la posiscion 1 ('Dispositivos') entonces se llama a la funcion Desplegar_Informacion para mostrar en una ventana la informacion del dispositivo.
        [~,Informacion_tarjeta]=Desplegar_Informacion(info(1,indice-1));                                                            %La funcion desplegar informacion nos regresa dos variables, la primera indica los subsistemas que tiene la tarajeta de adquisicion elegida y la otra es la informacion de estos subsistemas.           
    msgbox(Informacion_tarjeta)                                                                                                     %msgbox despliga un mensaje con la informacion de la tarjeta.
    end
    
function Iniciar_Sesion_Callback(hObject, eventdata, handles)                                                                       %El pushbutton 'Iniciar Sesion' verifica tres cosas antes de iniciar la sesion, 1. que la tarjeta tenga subsistema de salida analogica. 2.-Que el sistema de salida analogica acepte que se le pongan datos en cola para la salida. 3.-Que tenga subsistema de entrada analogica.                 
    global info s subsistemas_disponibles                                                                                           %Se declaran globales las variables info(informacion de los dispositivos disponibles), s(la sesion que sera inicializada) y subsistemas_disponibles(Matriz que me indica que sistemas tiene el despositivo que sea elegido).
    indice=get(handles.Lista_Dispositivos,'value');                                                                              %En la variable indice se guarda la posicion de la lista de dispositivos del dispositivo que se haya elegido. 
    if indice>1                                                                                                                     %Si el indice es mayor a la posiscion 1 ('Dispositivos') entonces se llama a la funcion Desplegar_Informacion para tomar la variable que nos indica los subsistemas disponibles en el dispositivo.
        [subsistemas_disponibles,~]=Desplegar_Informacion(info(1,indice-1));           
        if subsistemas_disponibles(2,1)==0                                                                                          %Si la matriz subsistemas_disponibles en la posicion(2,1)contiene un valor diferente a cero entonces el dispositivo cuenta con subsitema de entrada analogica.
            h=errordlg('La tarjeta de adquisicion elegida no  puede  emplearse  debido a que no cuenta con canales analogicos de entrada');   %En caso de que no tenga subsistema de entrada analogica se despliega este mensaje de error si se aborta la ejecucion de la funcion.
            uiwait(h);   
            return
        end
        if subsistemas_disponibles(2,2)~=0                                                                                          %Si la matriz subsistemas_disponibles en la posicion(2,2)contiene un valor diferente a cero entonces el dispositivo cuenta con subsitema de salida analogica.
            if max(info(1,indice-1).Subsystems(subsistemas_disponibles(2,2)).RateLimit)==0                                          %Ademas de contar con subsistema de salida analogica el dispositivo debe poder admitir datos para ponerlo en la cola de salida, si el valor maximo de RateLimit es igual a cero, entonces no posee esta caracteristica.
                h=errordlg('La  tarjeta  de  adquisicion  elegida  no  puede  emplearse  debido  a que los canales analogicos con los que  cuenta no aceptan que se le pongan datos en cola como datos de salida'); %Si no cumple con la caracteristica anterior se despliga este mensaje de error y se aborta la ejecucon de la funcion.
                uiwait(h);
                return
            end
        else  
            h=errordlg('La tarjeta de adquisicion elegida no  puede  emplearse  debido a que no cuenta con canales analogicos de salida');  %Este mensaje de error se ejecuta si el dispositivo que se pretende utilizar no tiene subsistema de salida analogica, luego se aborta la ejecucion de la funcion.
            uiwait(h);   
            return
        end
    end
    
    Index_analogico_entrada=subsistemas_disponibles(2,1);                                                                           %Index_analogico_entrada nos indica en que posicion de los subistemas se encuentra el subsistema de entrada analogica. 
    Index_analogico_salida=subsistemas_disponibles(2,2);                                                                            %Index_analogico_salida nos indica en que posicion de los subistemas se encuentra el subsistema de salida analogica.
    
    Ocupado(handles);
    s=daq.createSession('ni');                                                                                                      %daq.createSession crea una nueva sesion y la almacena en la variable s, el argumento de entrada es 'ni' que se refiere a National Instruments.
    info=(info(1,indice-1));                                                                                                        %Se sobreescribe el valor de la variable info, de aqui en delante solo contendra la informacion relativa al dispositivo elegido.
    t_muestreo=min(max(info.Subsystems(1,Index_analogico_salida).RateLimit), max(info.Subsystems(1,Index_analogico_entrada).RateLimit)); %Se elige el menor de los RateLimit del los subsistemas de salida y entrada analogica como la maxima frecuencia de muestreo.
    t_muestreo=1/t_muestreo;                                                                                                         %sacamos el inverso a la frecuencia de muestreo para obtener el maximo periodo de muestreo.
    tex=sprintf('El menor tiempo de muestreo es:\n%i s',t_muestreo);
    set(handles.text7,'string',tex);
    set(handles.Lista_Dispositivos,'Enable','off');
    set(handles.Buscar_Dispositivos,'Enable','off');
    set(handles.Informacion_Dispositivos,'Enable','off');
    set(handles.Iniciar_Sesion,'Enable','off');                                                                                 
    set(handles.Anadir_Canal,'Enable','on');
    set(handles.Legend_Anadir_canal,'Enable','on');   
    Desocupado(handles);   

%--------------Funciones dentro del panel de añadir canal------------------
%--------------------------------------------------------------------------
function Anadir_Canal_Callback(hObject, ~, handles)                                                                                 %Añadir canal habilita los radiobuttons 'Entrada_Analogica' y 'Salida_Analogica' asi como la Lista de Canales.     
    set(handles.Entrada_Analogica,'Enable','on');
    set(handles.Salida_Analogica,'Enable','on');
    set(handles.Lista_Canales,'Enable','on','value',1);
    
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)                                                                   %Este uipanel carga la lista de canales con los canales disponibles en el dspositivo elegido, segun se haya elegido la opcion de canales de entrada o de salida.
    global info
    Entrada=get(handles.Entrada_Analogica,'value');                                                                                 %Si el valor de Entrada es 1 entonces se cargan los canales analogicos de entrada.
    Salida=get(handles.Salida_Analogica,'value');
    if Entrada==1
        a=info.Subsystems(1,1).ChannelNames;
        set(handles.Lista_Canales,'string',a);
    elseif Salida==1                                                                                                                %Si el valor de Salida es 1 entonces se cargan los canales analogicos de salida.
        a=info.Subsystems(1,2).ChannelNames;
        set(handles.Lista_Canales,'string',a);
    end
    set(handles.Ok_Anadir_Canal,'Enable','on');                                                                                     %Se habilita el boton de Ok_Anadir_Canal.
    
    
function Ok_Anadir_Canal_Callback(hObject, ~, handles)
    global info s;                                                                                                                  %Se declaran globales las variables info que contiene la informacion del dispositivo y s que es la variable donde esta almacenada la sesion.
    Ocupado(handles);
    indice=get(handles.Lista_Canales,'value');                                                                                      %indice indica el renglon de la lista de canales que esta seleccionado.
    nombre=get(handles.Lista_Canales,'string');                                                                                     %nombre contiene la lista de todos los canales disponibles.  
    nombre=nombre(indice);                                                                                                          %Cambiamos la variable nombre con el nombre del canal que deseamos agragar a la sesion.
    data=get(handles.Tabla_Canales_En_Sesion,'Data');                                                                               %Tomamos los datos de la tabla de canales en sesion para modificarla.
    [m,~]=size(data);                                       
    if m>0                                                                                                                          %El numero de filas que tiene la variable data es igual al numero de canales en sesion, en caso de que no haya ningun canal añadido m=0.
        canales_sesion=data(:,4);                                                                                                   %Si m>0 entonces debemos comprobar que el canal que estamos tratando de añadir no ha sido previamente añadido a la sesion. Tomamos de la variable data los nombres de los canales en sesion dentro de la variable canales_sesion.
        for cont=1:m
            if strcmp(canales_sesion(cont),nombre)                                                                                  %Comparamos el nombre del canal que deseamos añadir con todos los canales en sesion, en caso de que coincida con uno de ellos se despliga el mensaje de error y se aborta la ejecucion de la funcion.
                h=errordlg('El canala no puede ser añadido ya que ya ha sido añadido previamente a la sesion');           
                uiwait(h);
                Desocupado(handles)
                return
            end
        end
    end
    
    if get(handles.Entrada_Analogica,'value')==1                                                                                    %Se comprueba el estado de los radiobuttons en Entrada_Analogica y Salida Analogica, el que se halla seleccionado tendra un valor igual a 1 y ese tipo de canal sera añadido.
       h=s.addAnalogInputChannel(info.ID,nombre,'voltage');
       b{1,2}='ai';                                                                                                                 %b es una variable tipo cell en ella se encuentran los datos del canal que queremos añadir. Para la posiscion 2 el valor en b corresponde al tipo de canal.
    elseif get(handles.Salida_Analogica,'value')==1
       h=s.addAnalogOutputChannel(info.ID,nombre,'voltage');
       b{1,2}='ao';
    end
    b{1,1}=m+1;                                                                                                                     %b en la posicion 1 contiene el indice del canal.
    b{1,3}=info.ID;                                                                                                                 %b en la posicion 3 contiene el ID del sispositivo.
    b{1,4}=h.ID;                                                                                                                    %b en la posicion 4 contiene la ID del canal.
    b{1,5}=h.TerminalConfig;                                                                                                        %b en la posicion 5 contiene la configuracion del canal.
    b{1,6}=sprintf('%g to %g %s',h.Range.Min,h.Range.Max,h.Range.Units);                                                            %b en la posicion 6 contiene el rango y las unidades del canal.
  
    if m>0                                                                                                                          %Si ya habia canales en la sesion, los datos del nuevo canal se añaden a los datos de los canales ya en sesion.
        data=[data;b];
    else
        data=b;                                                                                                                     %En caso de que no hubiera otros canales en sesion los datos en la tabla seran solo los datos del canal que estamos añadiendo.
    end
    set(handles.Tabla_Canales_En_Sesion,'Data',data);
    set(handles.Lista_Canales,'Enable','off');
    set(handles.Entrada_Analogica,'Enable','off');
    set(handles.Salida_Analogica,'Enable','off');
    set(handles.Borrar_Canal,'Enable','on');
    set(handles.Adquirir_Datos,'Enable','on');
    set(handles.Legend_Borrar_canal,'Enable','on');    
    Desocupado(handles);
    
function Tabla_Canales_En_Sesion_CellSelectionCallback(hObject, eventdata, handles)                                                 %Esta funcion guarda una copia de la informacion dentro de la tabla de canales en sesion y es llamada cada que se selecciona una casilla de la tabla.
    global copia
    copia=get(handles.Tabla_Canales_En_Sesion,'Data');

function Tabla_Canales_En_Sesion_CellEditCallback(hObject, eventdata, handles)                                                      %Esta funcion toma una copia de la informacion dentro de la tabla de canales en sesion justo despues de que alguna casilla fue modificada, luego compara la informacion con la que esta almacenada en la variable copia de la funcion anterior y si es el caso mofifica las caracteristicas de los canles.
    global copia s subsistemas_disponibles
    
    Index_analogico_entrada=subsistemas_disponibles(2,1);                                                                           %Index_analogico_entrada nos indica en que posicion de los subistemas se encuentra el subsistema de entrada analogica. 
    Index_analogico_salida=subsistemas_disponibles(2,2);                                                                            %Index_analogico_salida nos indica en que posicion de los subistemas se encuentra el subsistema de salida analogica.

    a=get(handles.Tabla_Canales_En_Sesion,'Data');                                                                                  %En la variable a se guarda la informacion de la tabla de canales en sesion ya modificada.
    [m,~]=size(a);                                                                                                                  %m corresponde al numero de canales en sesion.
    canales=a(1:m,2);                                                                                                               %canales es un vector que contiene en orden el tipo de canal en sesion.
    conf1=a(1:m,5);                                                                                                                 %conf1 es la configuracion de los canales antes de ser modificados.
    conf2=copia(1:m,5);                                                                                                             %conf2 es la configuracion de los canales ya modificados.
    index=a(1:m,1);                                                                                                                 %index es el numero del canal
    for cont=1:m
        if strcmp(canales(cont),'ai')                                                                                               %La condicional se cumple si el canal es del tipo entrada analogica.
            if strcmp(conf1(cont),conf2(cont))~=1                                                                                   %La condicional se cumple si la configuracion conf1(antes de mofificar) es diferente a conf2(despues de modificar).
                Conf_disponibles=s.Channels(1,index{cont}).Device.Subsystems(1,Index_analogico_entrada).TerminalConfigsAvailable;   %Se toman las configuraciones que acepta el tipo de canal.
                [~,tam]=size(Conf_disponibles);
                for cont1=1:tam
                    if strcmp(conf1(cont),Conf_disponibles(cont1))                                                                  %Se compara si la configuracion deseada es una de las que acepta el canal.
                        set(s.Channels(1,index{cont}),'TerminalConfig',conf1{cont});                                                %En caso de que la configuracion deseada sea soportada por el canal entonces mediante la funcion set, se cambia el tipo de configuracion.
                        set(handles.Tabla_Canales_En_Sesion,'Data',a);
                        return
                    end
                end
                    h=errordlg('La configuracion no esta disponible');                                                              %En caso de que la configuracion deseada no sea soportada por el canal, se manda este mensaje de error.
                    uiwait(h);
                    set(handles.Tabla_Canales_En_Sesion,'Data',copia);
                    return
            end
        else                                                                                                                        %Si la condicional de canal analogico de entrada no se cumple entonces tenemos un canal de salida analogico.
            if strcmp(conf1(cont),conf2(cont))~=1                                                                                   %La condicional se cumple si la configuracion conf1(antes de mofificar) es diferente a conf2(despues de modificar).
                Conf_disponibles={s.Channels(1,index{cont}).Device.Subsystems(1,Index_analogico_salida).TerminalConfigsAvailable};  %Se toman las configuraciones que acepta el tipo de canal.
                tam=length(Conf_disponibles);
                for cont1=1:tam
                    if strcmp(conf1(cont),Conf_disponibles(cont1))                                                                  %Se compara si la configuracion deseada es una de las que acepta el canal.
                        set(s.Channels(1,index{cont}),'TerminalConfig',conf1{cont});                                                %En caso de que la configuracion deseada sea soportada por el canal entonces mediante la funcion set, se cambia el tipo de configuracion.
                        set(handles.Tabla_Canales_En_Sesion,'Data',a);
                        return
                    end
                end
                h=errordlg('La configuracion no esta disponible');                                                                  %En caso de que la configuracion deseada no sea soportada por el canal, se manda este mensaje de error.
                uiwait(h);
                set(handles.Tabla_Canales_En_Sesion,'Data',copia);
                return
            end
        end
    end
%----------------Funciones dentro del panal borrar canal-------------------
%--------------------------------------------------------------------------
function Borrar_Canal_Callback(hObject, eventdata, handles)                                                                         %Esta funcion habilita los botones dentro del panel de borra canal.
    set(handles.Index,'Enable','on');
    set(handles.Legend_Seleccionar_index,'Enable','on');
    set(handles.Ok_Borrar_Canal,'Enable','on');
    set(handles.Legend_Borrar_canal,'Enable','off');
    
function Ok_Borrar_Canal_Callback(hObject, eventdata, handles)                                                                      %Una vez que se ha elegido el indice del canal que se desea borrar se llama a esta funcion para que borre el canal de la sesion.
    global s
    data=get(handles.Tabla_Canales_En_Sesion,'Data');                                                                               %Se toman los datos de la tabla que contiene los canales en sesion.
    [m,~]=size(data);                                                                                                               %El numero de filas de la tabla corresponde al numero de canales en la sesion. 
    index=str2double(get(handles.Index,'string'));                                                                                  %Index es el indice del canal que deseamos borrar, Index no puede ser mayor al numero de canales en la sesion.
    if index>m                                                                                                                      %En caso de que Index sea mayor a m se despliega el mensaje de error y se aborta la funcion.
        h=errordlg('El indice tecleado no existe en la sesion');
        uiwait(h)
        return
    end
    [data,m]=borrar_dato(data,index);                                                                                               %Borrar dato es la funcion que se encarga de borrar los datos del canal que se desea borrar.
    s.removeChannel(index);                                                                                                         %removeChannel elimina el canal de la sesion.        
    set(handles.Tabla_Canales_En_Sesion,'Data',data);
    set(handles.Index,'Enable','off','string','');
    set(handles.Legend_Seleccionar_index,'Enable','off');
    set(handles.Ok_Borrar_Canal,'Enable','off');
    if m==0                                                                                                                         %Si m es igual a cero ya no hay canales en sesion y se deshabilitan los botones del panel de borra canal puesto que ya no hay canales que borrar.        
        set(handles.Index,'Enable','off','string','');
        set(handles.Legend_Borrar_canal,'Enable','off');
        set(handles.Legend_Seleccionar_index,'Enable','off');
        set(handles.Borrar_Canal,'Enable','off');
        set(handles.Ok_Borrar_Canal,'Enable','off');
        set(handles.Adquirir_Datos,'Enable','off');
    end
    
%--------------Funciones de adqusicion y tratamiento de datos--------------
%--------------------------------------------------------------------------

function Senal_Cuadrada_Callback(hObject, eventdata, handles)                                                                       %Esta funcion habilita o deshabilita los cuadros de edicion para definir la frecuencia maxima y minima de la funcion cuadrada random.
    val=get(hObject,'value');
    if val==1
        set(handles.Frecuencia_Minima,'Enable','on');
        set(handles.Frecuencia_Maxima,'Enable','on');
        set(handles.text8,'Enable','on');
        set(handles.text9,'Enable','on');
    else
        set(handles.Frecuencia_Minima,'Enable','off');
        set(handles.Frecuencia_Maxima,'Enable','off');
        set(handles.text8,'Enable','off');
        set(handles.text9,'Enable','off');
    end

function Adquirir_Datos_Callback(hObject, eventdata, handles)
    global s t_o                                                                                                                    %Se declaran globales las variables s que es la variable donde se almacena la sesion y t_o que es el tiempo de adquisicion. 
    Ocupado(handles);
    t_muestreo=Unidades_Periodo_Muestreo(handles);                                                                                  %t_muestreo= periodo de muestreo.
    t_duracion=Unidades_Tiempo_Simulacion(handles);                                                                                 %t_duracion=es el tiempo maximo de adqusicion.    
    val=get(handles.Senal_Cuadrada,'value');                                                                                        %val almacena el estado del checkbox Senal_Cuadrada en caso de que sea igual a 1 la señal de salida sera una serie de escalones de diferentes frecuencias.
    if val==1
        f_min=str2double(get(handles.Frecuencia_Minima,'string'));
        f_max=str2double(get(handles.Frecuencia_Maxima,'string'));
        u=aleatoria(f_min,f_max,t_muestreo,t_duracion,0,4);
    else                                                                                                                            % si val es igual a 0 entonces la señal de salida sera un unico escalon.
        t=(0:t_muestreo:t_duracion+t_muestreo);
        u=srampa(t,0,4);                                                                                                            %srampa es una funcion que genera una señal tipo rampa, en este caso la pendiente de la señal es 0 por lo que se comporta como un escalon= al valor del offset (4).    
        u=[u;0];
    end
    s.Rate=fix(1/t_muestreo);                                                                                                       %Se fija el numero de scaneos por segundo o frecuencia de muestreo.    
    s.queueOutputData(u);                                                                                                           %Se pone en cola la señal de salida.        
    pause(0.1);                                                                                                                     %Se da una pequeña pausa.
    [data,t_o]=s.startForeground();                                                                                                 %Se inicia la adqusicion de datos mediante la funcion startForeground que bloquea los demas comandos de matlab hasta que se ha terminado la adquisicon.    
    plot(handles.Senales_Adquiridas,t_o,data);                                                                                      %Se plotean las señales adquisidas contra el tiempo de adquisicion.
    dat=get(handles.Tabla_Canales_En_Sesion,'Data');
    [m,~]=size(dat);
    b=zeros(1,m);
    for cont=1:m                                                                                                                    %Se contabiliza el numero de canales analogicos de entrada añadidos a la sesion.
        if strcmp( dat{cont,2},'ai')
            b(cont)=1;
        end
    end
    c=cell(1,sum(b));                                                                                                               %c es una variable tipo cell con tantas columnas como canalaes analogicos de entrada.
    i=1;
    for cont=1:m
        if b(cont)==1
            c{i}=dat{cont,4};                                                                                                       %Se toma el ID de los canales analogicos de entrada. Para que sean desplegados como encabezado de la tabla de datos y en la figura de las señales.
            i=i+1;
        end
    end
    legend(handles.Senales_Adquiridas,c);
    set(handles.Tabla_Datos,'ColumnName',c)
    set(handles.Tabla_Datos,'Data',data);
    Desocupado(handles);
   
function Importar_Callback(hObject, eventdata, handles)                                                                             %Cuando se presiona el boton de importar datos se mandan los datos adquiridos y el vector de timpo de adqusicion(t_o) a la interfaz principal de identificacion.
    global data estado_validacion datos_val                                                                                                                    %Se declara global la variable data.     
    if estado_validacion~=1
        data=get(handles.Tabla_Datos,'Data');                                                                                           %data se actualiza de los valores de la tabla de datos.    
    else
        datos=get(handles.Tabla_Datos,'Data');
        datos_val=iddata(datos(:,2),datos(:,1),Unidades_Periodo_Muestreo(handles));
    end
        daq.reset                                                                                                                       %Se borran todas las variables de la sesion.    
    clear global nombres s info                                                                                                     %Se borran las variables globales info, s y nombres.        
    close(handles.figure1);                                                                                                         %Se cierra la interfaz de adquisicion.

function Nueva_Sesion_Callback(hObject, eventdata, handles)  
    Adquisicion_datos_con_contador_de_salida;                                                                                     %En caso de iniciar una nueva sesion se reinicia completamente la interfaz.

function Tratar_Datos_Callback(hObject, eventdata, handles)                                                                         %En esta funcion se mandan las señales adquiridas para ser modificadas por el factor de escala y la desviacion introducidos por el sensor empleado para medir dichas señales, para asi regresar las señales a sus valores origiinales.
    global data cont  t_muestreo nombres t_o                                                                                        %Declaramos las variables globales.
    Ocupado(handles);
    data=get(handles.Tabla_Datos,'Data');                                                                                           %data toma los valores de la Tabla de datos.
    nombres=get(handles.Tabla_Datos,'ColumnName');                                                                                  %nombres toma el nombre de los canales a los que corresponde cada señal.
    t_muestreo=Unidades_Periodo_Muestreo(handles);                                                                                  %t_muestreo nos servira para graficar cada señal en la interfaz de tratado de datos.
    [~,n]=size(data);
    for cont=1:n                                                                                                                    %Por cada columna de la tabla de datos llamaremos a la interfaz de tratamiento de datos.
        h=tratado_datos;
        uiwait(h);
    end
    plot(handles.Senales_Adquiridas,t_o,data)
    set(handles.Tabla_Datos,'Data',data);
    dat=get(handles.Tabla_Datos,'ColumnName');
    legend(dat);
    Desocupado(handles);
function Guardar_Callback(hObject, eventdata, handles)                                                                              %Con esta funcion guardamos los valores de las señales adquiridas en una variable tipo .mat.
    data=get(handles.Tabla_Datos,'Data');
    t_muestreo=Unidades_Periodo_Muestreo(handles);
    uisave({'data','t_muestreo'},'datos1');

%----------------------------Menus de ayuda--------------------------------
%--------------------------------------------------------------------------
