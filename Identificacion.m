%---------------------Elaboro: Juan Tapia Tinoco---------------------------
%----------------Asesor: M.I. Salvador Ramirez Zavala----------------------
%----------Universidad Michoacana de San Nicolas de Hidalgo----------------
%-----------------Facultad de Ingenieria Electrica-------------------------

%Descripcion: El presente script junto con su archivo del tipo figura(.fig)
%corresponden a una  gui(grafic user interface) que tiene como finalidad el
%facilitar al usuario la  adquisicion de datos. Esta interfaz constituye la
%interfaz principal para el proyecto de identificacion de sitemas empleando
%matlab. Al ser  esta la  interfaz principal,  todos los procesos que deben
%llevarse  acabo  para llevar a  cabo la  identificacion  de  la  planta se
%ejecutan desde aqui, estos pasos son:

%Adquisicion de la señal de entrada y  salida: Debido a que el proposito de
%del proyecto  es identificar  sistemas  SISO (una entrada y una salida),se 
%deben de adquirir estas dos señales.

%Pretratamiento  de los datos: Los datos se  deben de limpiar para eliminar
%errores introducidos por los sensores y el ruido externo al sistema.

%Identificacion  del  sistema.  Una   vez  llevados  acabo  los  dos  pasos
%anteriores  entonces  es tiempo de identificar el sistema mediante modelos
%ya sean parametricos o no parametricos.

%Validacion. Finalmente  se validan los  datos comprobando si la estimacion
%del modelo  del sistema se aproxima  con la presicion y exactitud deseados 
%al comportamiento real del sistema. 

function varargout = Identificacion(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Identificacion_OpeningFcn, ...
                   'gui_OutputFcn',  @Identificacion_OutputFcn, ...
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



% -------Esta funcion se ejecuta justo al hacerse visble la interface------
% --------inhabilita las casillas que en un inicio no son requerridas------ 
function Identificacion_OpeningFcn(hObject,~, handles, varargin) 
    global estado_validacion sistemas sistemas_no_lineales anfis_fis
    sistemas=[]; 
    sistemas_no_lineales=[];
    anfis_fis=[];
    estado_validacion=0;
    Limpiar_Pretatamiento_Datos(handles);
       Limpiar_Modelos_Preestablecidos(handles);
       Limpiar_Entradas(handles);
       Limpiar_Senales(handles);
       Limpiar_Filtros(handles);
       set(handles.Archivo,'Enable','off','value',0)
       set(handles.Tabla1,'ColumnName',['u';'y'])
       set(handles.Simular,'Enable','off')
       set(handles.Identificacion_Escalon,'Enable','off')
       set(handles.Identificacion_no_lineal,'Enable','off')
       set(handles.Identificacion_logica_difusa,'Enable','off')
       set(handles.Identificacion_Parametrica,'Enable','off')
       Desocupado(handles);
handles.output = hObject;
guidata(hObject, handles);

%--------Outputs from this function are returned to the command line.-----
function varargout = Identificacion_OutputFcn(~, ~, handles) 
varargout{1} = handles.output;

%------------------------CreateFcn-----------------------------------------
%--------------------------------------------------------------------------
function Lista_Modelos_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Lista_Funciones_Entrada_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Unidades_Tiempo_Simulacion_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Unidades_Periodo_Muestreo_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Unidades_Periodo_Muestreo_Callback(hObject, eventdata, handles)
    
function Periodo_Muestreo_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Periodo_Muestreo_Callback(hObject, eventdata, handles)
    
function Tiempo_Simulacion_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Tiempo_Simulacion_Callback(hObject, eventdata, handles)

function Datos_Identificacion_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Graficar_Senal_Salida_CreateFcn(hObject, eventdata, handles)

function Graficar_Senal_Entrada_CreateFcn(hObject, eventdata, handles)

function Filtro_Promediador_CreateFcn(hObject, eventdata, handles)
function Filtro_Promediador_Callback(hObject, eventdata, handles)
    
function Filtro_Eliminador_Continua_CreateFcn(hObject, eventdata, handles)
function Filtro_Eliminador_Continua_Callback(hObject, eventdata, handles)
    
function Modificar_Datos_CreateFcn(hObject, eventdata, handles)
    
function Filtro_Pasabajas_Callback(hObject, eventdata, handles)


function Cargar_Modelo_CreateFcn(hObject, eventdata, handles)

    
 
%-----------------------------Menus---------------------------------------
%-------------------------------------------------------------------------
function Menu_Cargar_Modelos_Callback(~, ~, ~)
    function Menu_DesdeArchivo_Callback(~, ~, handles)                                                           %Este menu extrae las señales de tiempo,entrada y salida de un archivo con formato (columnas: tiempo entrada salida) 
        global u y t valores                                                                                                           %Declara globales a las variable.
        Limpiar_Modelos_Preestablecidos(handles);                                                                               %Limpia los datos de la seccion modelos preestablecidos e inhabilita los botones de la misma seccion.
        Limpiar_Entradas(handles);
        filespec = {'*.txt'};                                                                                                     %Establece que podemos buscar archivos con cualquier nombre y de cualquier tipo.
        [filename, pathname] = uigetfile(filespec);                                                                             %Abre una ventana que nos permite buscar archivos en el sistema devolviendo su nombre y direccion.
        archivo=strcat(pathname,filename);                                                                                      %Conjuntamos el nombre y la direccion del archivo para que matlab pueda abrirlo sin estar en la carpeta que lo contiene.
        fid=fopen(archivo);                                                                                                     %fopen abre el archivo y en fid se guarda el identificador del archivo.
        escaneo=textscan(fid,'%s');                                                                                           %textscan escanea el archivo con el identificador fid con el formato dado y regresa un cel que contiene todos los datos leidos.
        fclose(fid);                                                                                                            %fclose cierra el archivo.
        escaneo=escaneo{1};
        num_salidas=str2double(escaneo(2));                                                                                                               %Se debe extraer el vector que esta dentro del cell y se hace mediante esta expresion.
        num_entradas=str2double(escaneo(4));
        periodo_muestreo=str2double(escaneo(6));
        num_muestras=str2double(escaneo(8));
        valores(1)=num_salidas;
        valores(2)=num_entradas;
        u=zeros(num_muestras,num_entradas);
        y=zeros(num_muestras,num_salidas);
        cont_columna=1;
        cont_renglon=1;
        for cont=9:length(escaneo)
            if cont_columna<=num_salidas
                y(cont_renglon,cont_columna)=str2double(escaneo(cont));
                if cont_columna==num_salidas+num_entradas
                    cont_columna=o;
                    cont_renglon=cont_renglon+1;
                end
                cont_columna=cont_columna+1;
            elseif cont_columna<=num_salidas+num_entradas
                u(cont_renglon,cont_columna-num_salidas)=str2double(escaneo(cont));
                if cont_columna==num_salidas+num_entradas
                    cont_columna=0;
                    cont_renglon=cont_renglon+1;
                end
                cont_columna=cont_columna+1;
            end
        end

        t=(0:periodo_muestreo:(num_muestras-1)*periodo_muestreo);                                                                                                              %Se debe extraer el vector que esta dentro del cell y se hace mediante esta expresion.
                                                                                                           %Se debe extraer el vector que esta dentro del cell y se hace mediante esta expresion.
        set(handles.Periodo_Muestreo,'string',num2str(periodo_muestreo),'Enable','inactive');                                          %Este comando desactiva el editable marcado como edit2 al tiempo que despliega en él el periodo de muestreo.
        set(handles.Tabla1,'Data',[y u]);
        nombres=cell(1,valores(1)+valores(2));
        nombres{1}='y';
        nombres{valores(1)+1}='u';
        set(handles.Tabla1,'ColumnName',nombres)
        Limpiar_Modelos_Preestablecidos(handles);
        Limpiar_Filtros(handles);
        Limpiar_Senales(handles);
        set(handles.Identificacion_Escalon,'Enable','off')
        set(handles.Identificacion_no_lineal,'Enable','off')
        set(handles.Identificacion_logica_difusa,'Enable','off')
        set(handles.Identificacion_Parametrica,'Enable','off')
        set(handles.Dividir_Datos_Identificacion,'Enable','off')
        set(handles.Datos_Identificacion,'Enable','off','string','')
        set(handles.Legend_Porcentage_datos_identificacion,'Enable','off')
        set(handles.Con_cola_salida,'Enable','off','value',0)
        set(handles.Sin_cola_salida,'Enable','off','value',0)
        set(handles.Adquirir_Datos_Validacion,'Enable','off')
        cla(handles.Senal_Entrada_Identificar)
        cla(handles.Senal_Salida_Identificar)
        cla(handles.Senal_Entrada_Validar)
        cla(handles.Senal_Salida_Validar)
        set(handles.Cambiar_Entrada,'Enable','off')
        set(handles.Simular,'Enable','off')
        set(handles.Unidades_Periodo_Muestreo,'Enable','inactive');
        set(handles.Tabular_Datos,'Enable','on');
        set(handles.Legend_Muestreo,'Enable','on','FontWeight','bold');
        set(handles.Modificar_Datos,'Enable','on');
        set(handles.Guardar_Datos_Tabla,'Enable','on');
        plot(handles.Senal_Entrada,t,u);
        title(handles.Senal_Entrada,'Entrada')
        plot(handles.Senal_Salida,t,y);
        title(handles.Senal_Salida,'Respuesta')
        set(handles.Tiempo_Simulacion,'Enable','off','String','');
        set(handles.Archivo,'Enable','off','value',0)
    function Menu_Modelos_Preestablecidos_Callback(~, ~, handles)
        global valores
        valores(1)=1;
        valores(2)=1;
        Limpiar_Modelos_Preestablecidos(handles); 
        set(handles.Lista_Modelos,'Enable','on');
        set(handles.Cargar_Modelo,'Enable','on');
        set(handles.Num_Funcion_Transferencia,'Enable','on');
        set(handles.Den_Funcion_Transferencia,'Enable','on');
        set(handles.Legend_Simulacion,'Enable','off');
        set(handles.Legend_Muestreo,'Enable','off');
        set(handles.Cambiar_Modelo,'Enable','on');
        set(handles.Lista_Funciones_Entrada,'Enable','on');
        set(handles.Unidades_Tiempo_Simulacion,'Enable','on');
        set(handles.Unidades_Periodo_Muestreo,'Enable','on');
        set(handles.Tiempo_Simulacion,'Enable','on');
        set(handles.Periodo_Muestreo,'Enable','on');
        set(handles.Ver_Entrada,'Enable','on');
        set(handles.Cambiar_Entrada,'Enable','on');
        set(handles.Generar_Ruido,'Enable','on');
        set(handles.Simular,'Enable','on');                                                                              %Limpia los datos de la seccion modelos preestablecidos e inhabilita los botones de la misma seccion.                               
        Limpiar_Filtros(handles);
        Limpiar_Senales(handles);                                                                                                     %Se grafica tiempo vs salida en los ejes marcados como axes3.
        set(handles.Tabla1,'Data',[],'ColumnName',[]);
        set(handles.Tabular_Datos,'Enable','off');
        set(handles.Guardar_Datos_Tabla,'Enable','off');
        set(handles.Modificar_Datos,'Enable','off');
        set(handles.Identificacion_Escalon,'Enable','off')
        set(handles.Identificacion_no_lineal,'Enable','off')
        set(handles.Identificacion_logica_difusa,'Enable','off')
        set(handles.Identificacion_Parametrica,'Enable','off')
        set(handles.Dividir_Datos_Identificacion,'Enable','off')
        set(handles.Datos_Identificacion,'Enable','off','string','')
        set(handles.Legend_Porcentage_datos_identificacion,'Enable','off')
        set(handles.Con_cola_salida,'Enable','off','value',0)
        set(handles.Sin_cola_salida,'Enable','off','value',0)
        set(handles.Adquirir_Datos_Validacion,'Enable','off')
        set(handles.Archivo,'Enable','off','value',0)
        cla(handles.Senal_Entrada_Identificar)
        cla(handles.Senal_Salida_Identificar)
        cla(handles.Senal_Entrada_Validar)
        cla(handles.Senal_Salida_Validar)
        Desocupado(handles);             
    function Menu_Adquisicion_Callback(~, ~, handles)                                                                               %Este menu permite abrir la interfaz de adquisicion para medir datos reales. 
        function Adquisicion_sin_contador_salida_Callback(hObject, eventdata, handles)
            global data t_o u y estado_validacion  valores                                                                                                 %Declaramos globales estas variables porque deben compartirse entre algunas funciones data:contiene las señales de entrada y salida t_o:es el vetor de tiempo u:es como se pasa la señal de entrada a las funciones y:es como se pasa la señal de salida a las funciones  
            Ocupado(handles);                                                                                                       %Esta funcion despliega una imagen que dice "ocupado" en los ejes marcados como axes10
            h=Adquisicion_datos_sin_contador_de_salida;                                                                             %Esta linea de comando abre la interfaz de adquisicion y guarda en h su identificador.
            uiwait(h)                                                                                                               %Esta funcion detiene el script hasta que la figura con identificador h se cierra. 
            if estado_validacion~=1
                h=Eleccion_salidas_entradas;
                uiwait(h);
                u=data(:,valores(1)+1:valores(1)+valores(2));                                                                                                            %La primer columna de la matriz data tiene los datos de la entrda.
                y=data(:,1:valores(1));                                                                                                            %La segunda columna de la matriz data tiene los datos de la salida.
                nombres=cell(1,valores(1)+valores(2));
                nombres{1}='y';
                nombres{valores(1)+1}='u';
                Limpiar_Modelos_Preestablecidos(handles);                                                                               %Limpia los datos de la seccion modelos preestablecidos e inhabilita los botones de la misma seccion.                               
                Limpiar_Filtros(handles);
                Limpiar_Entradas(handles);
                Limpiar_Senales(handles);               
                plot(handles.Senal_Entrada,t_o,u);                                                                                      %Se grafica tiempo vs entrada en los ejes marcados como axes2.
                plot(handles.Senal_Salida,t_o,y);                                                                                       %Se grafica tiempo vs salida en los ejes marcados como axes3.
                set(handles.Tabla1,'Data',data);
                set(handles.Tabla1,'ColumnName',nombres)
                set(handles.Tabular_Datos,'Enable','on');
                set(handles.Guardar_Datos_Tabla,'Enable','on');
                set(handles.Modificar_Datos,'Enable','on');
                set(handles.Unidades_Periodo_Muestreo,'Enable','inactive');
                set(handles.Legend_Muestreo,'Enable','on','FontWeight','bold');
                set(handles.Periodo_Muestreo,'string',num2str(t_o(2)-t_o(1)),'Enable','inactive');                                      %Este comando desactiva el editable marcado como edit2 al tiempo que despliega en él el periodo de muestreo.
                set(handles.Identificacion_Escalon,'Enable','off')
                set(handles.Identificacion_no_lineal,'Enable','off')
                set(handles.Identificacion_logica_difusa,'Enable','off')
                set(handles.Identificacion_Parametrica,'Enable','off')
                set(handles.Dividir_Datos_Identificacion,'Enable','off')
                set(handles.Datos_Identificacion,'Enable','off','string','')
                set(handles.Legend_Porcentage_datos_identificacion,'Enable','off')
                set(handles.Con_cola_salida,'Enable','off','value',0)
                set(handles.Sin_cola_salida,'Enable','off','value',0)
                set(handles.Adquirir_Datos_Validacion,'Enable','off')
                set(handles.Archivo,'Enable','off','value',0)
                cla(handles.Senal_Entrada_Identificar)
                cla(handles.Senal_Salida_Identificar)
                cla(handles.Senal_Entrada_Validar)
                cla(handles.Senal_Salida_Validar)
                Desocupado(handles);                                                                                                    %Esta funcion borra la imagen que dice "ocupado" en los ejes marcados como axes10
            end
            estado_validacion=0;
        function Adquisicion_con_contador_salida_Callback(hObject, eventdata, handles)
            global data t_o u y   estado_validacion                                                                                                  %Declaramos globales estas variables porque deben compartirse entre algunas funciones data:contiene las señales de entrada y salida t_o:es el vetor de tiempo u:es como se pasa la señal de entrada a las funciones y:es como se pasa la señal de salida a las funciones  
            Ocupado(handles);                                                                                                       %Esta funcion despliega una imagen que dice "ocupado" en los ejes marcados como axes10
            h=Adquisicion_datos_con_contador_de_salida;                                                                             %Esta linea de comando abre la interfaz de adquisicion y guarda en h su identificador.
            %uiwait(h)                                                                                                               %Esta funcion detiene el script hasta que la figura con identificador h se cierra. 
            if estado_validacion~=1
                u=data(:,1);                                                                                                            %La primer columna de la matriz data tiene los datos de la entrda.
                y=data(:,2);                                                                                                            %La segunda columna de la matriz data tiene los datos de la salida.
                Limpiar_Modelos_Preestablecidos(handles);                                                                               %Limpia los datos de la seccion modelos preestablecidos e inhabilita los botones de la misma seccion.                               
                Limpiar_Filtros(handles);
                Limpiar_Entradas(handles);
                Limpiar_Senales(handles);
                plot(handles.Senal_Entrada,t_o,u);                                                                                      %Se grafica tiempo vs entrada en los ejes marcados como axes2.
                plot(handles.Senal_Salida,t_o,y);                                                                                       %Se grafica tiempo vs salida en los ejes marcados como axes3.
                set(handles.Tabla1,'Data',data);
                set(handles.Tabular_Datos,'Enable','on');
                set(handles.Guardar_Datos_Tabla,'Enable','on');
                set(handles.Modificar_Datos,'Enable','on');
                set(handles.Unidades_Periodo_Muestreo,'Enable','inactive');
                set(handles.Legend_Muestreo,'Enable','on','FontWeight','bold');
                set(handles.Periodo_Muestreo,'string',num2str(t_o(2)-t_o(1)),'Enable','inactive');
                set(handles.Archivo,'Enable','off','value',0)                                                                               %Este comando desactiva el editable marcado como edit2 al tiempo que despliega en él el periodo de muestreo.
                Desocupado(handles);                                                                                                    %Esta funcion borra la imagen que dice "ocupado" en los ejes marcados como axes10
            end
            estado_validacion=0;
function Menu_Senal_Entrada_Callback(~, ~, handles)                                                                                 %Este menu se emplea para cambiar el valor de los maximos y minimos en los ejes marcados como axes2 al dar clic derecho sobre la figura.
    function Menu_Limites_Callback(~, ~, handles)
        function Menu_Limitex_Callback(~, ~, handles)
            global x_1 x_2
            h=limite_x;
            uiwait(h);
            set(handles.Senal_Entrada,'Xlim',[x_1 x_2]);
        function Menu_Limitey_Callback(~, ~, handles)
            global y_1 y_2
            h=limite_y;
            uiwait(h);
            set(handles.Senal_Entrada,'Ylim',[y_1 y_2]);
       
function Menu_Senal_Salida_Callback(hObject, eventdata, handles)                                                                    %Este menu se emplea para cambiar el valor de los maximos y minimos en los ejes marcados como axes3 al dar clic derecho sobre la figura.
    function menu_limites1_Callback(hObject, eventdata, handles)
        function Menu_Limites1_Callback(hObject, eventdata, handles)
            global x_1 x_2
            h=limite_x;
            uiwait(h);
            set(handles.Senal_Salida,'Xlim',[x_1 x_2]);
        function Menu_Limitey_1_Callback(hObject, eventdata, handles)
            global y_1 y_2
            h=limite_y;
            uiwait(h);
            set(handles.Senal_Salida,'Ylim',[y_1 y_2]);
            
function Menu_Senal_Entrada_Identificar_Callback(hObject, eventdata, handles)                                                       %Este menu se emplea para cambiar el valor de los maximos y minimos en los ejes marcados como axes5 al dar clic derecho sobre la figura.
    function Menu_Limites2_Callback(hObject, eventdata, handles)
        function Menu_Limitesx2_Callback(hObject, eventdata, handles)
             global x_1 x_2
            h=limite_x;
            uiwait(h);
            set(handles.Senal_Entrada_Identificar,'Xlim',[x_1 x_2]);
        function Menu_Limitesy2_Callback(hObject, eventdata, handles)
            global y_1 y_2
            h=limite_y;
            uiwait(h);
            set(handles.Senal_Entrada_Identificar,'Ylim',[y_1 y_2]);
            
function Menu_Senal_Salida_Identificar_Callback(hObject, eventdata, handles)                                                        %Este menu se emplea para cambiar el valor de los maximos y minimos en los ejes marcados como axes6 al dar clic derecho sobre la figura.
    function Menu_Limites3_Callback(hObject, eventdata, handles)
        function Menu_Limitesx3_Callback(hObject, eventdata, handles)
            global x_1 x_2
            h=limite_x;
            uiwait(h);
            set(handles.Senal_Salida_Identificar,'Xlim',[x_1 x_2]);
        function Menu_Limitesy3_Callback(hObject, eventdata, handles)
            global y_1 y_2
            h=limite_y;
            uiwait(h);
            set(handles.Senal_Salida_Identificar,'Ylim',[y_1 y_2]);

%----------Funciones dentro del panel "Modelos Preestablecidos"-----------
%-------------------------------------------------------------------------
function Lista_Modelos_Callback(hObject, ~, handles)
    
    clear global Num Den;                                                                                                           %Borra las variables globales de Num=Numerador y Den=Denominador de la funcion de transferencia
    set(handles.Num_Funcion_Transferencia,'string','');                                                                             %Borra el numerador de la ft de la gui.
    set(handles.Den_Funcion_Transferencia,'string','');                                                                             %Borra el denominador de la ft de la gui.
    valor=get(hObject,'value');                                                                                                     %La variable valor almacena el numero de la renglon elegido de la lista de modelos.
    modelo=get(hObject,'string');                                                                                                   %modelo almacena la lista completa de modelos.
    
    if(valor==1||valor==8)
         cla(handles.Figuras_Modelos);                                                                                              %Si se elige el renglon 1(Modelos) o el renglos 9(Definido por el usuario) no se despliega ninguna imagen.
    else
        nombre=char(strcat('imagenes/',(strcat(modelo(valor),'.jpg'))));                                                            %nombre almacena el nombre del modelo elegido.
        [x,~]=imread(nombre,'jpg');
        axes(handles.Figuras_Modelos)
        image(x)
        axis off;
    end
        
    switch valor                                                                                                                    %Abre las gui's de inicializacion de parametros de los modelos
            case 2
                h=bola_y_barramodelo;
            case 3
                h=circuito_RLCmodelo;
            case 4
                h=control_cruceromodelo;
            case 5
                h=masa_resorte_amortiguadormodelo;
            case 6 
                h=posicion_motor_CDmodelo;
            case 7
                h=velocidad_motor_CDmodelo;
            case 8
                h=Definido_x_usuariomodelo;
    end
    uiwait(h);
    
    function Cargar_Modelo_Callback(hObject, ~, handles)
        
    valor=get(handles.Lista_Modelos,'value');                                                                                       %En la variable valor se almacena el numero del renglon elegido de la lista de modelos.
    
    if valor==1                                                                                                                     %En caso de elegir el renglon 1(Modelos) se despliega un mensaje de error.
        h=errordlg('No has elegido un modelo',' Error ');   
        uiwait(h);
        return;
    end
    
    global Num Den m j r d l R L C b k;                                                                                         %Se declaran las funciones globales Num y Den asi como los parametros necesarios para la construccion de las ft para el modelo elegido.
    
    switch valor
          case 2
            g=-9.8;
            Num=-m*d*g/(l*(j/r^2+m));
            Den=[1 0 0];
        case 3
            Num=[1 0];
            Den=[L R 1/C]; 
        case 4
            Num=1;
            Den=[m b];
        case 5
            Num=[b k];
            Den=[m b k];
        case 6
            Num=k;
            Den=conv([1 0],(conv([j b],[l r])+[0 0 k^2]));
        case 7
            Num=k;
            Den=conv([j b],[l r])+[0 0 k^2]; 
        case 8
            %ft ya creada por el usuario
    end
    
    clear global m j r d l R L C b k
    
    set(handles.Num_Funcion_Transferencia,'string',poly2str(Num,'s'));
    set(handles.Den_Funcion_Transferencia,'string',poly2str(Den,'s'));
    set(handles.Lista_Modelos,'Enable','off');
    set(hObject,'Enable','off');
    
    function Cambiar_Modelo_Callback(~, ~, handles)
        
        clear global Den Num y;                                                                                                     %Ya que se cambio el modelos se borran el numerador y el denominador del antiguo modelo, asi como la señal de entrada si la hubiera.
        Limpiar_Filtros(handles);
        set(handles.Num_Funcion_Transferencia,'string','');
        set(handles.Den_Funcion_Transferencia,'string','');
        set(handles.Lista_Modelos,'value',1,'Enable','on');
        set(handles.Cargar_Modelo,'Enable','on');
        cla(handles.Figuras_Modelos)
        cla(handles.Senal_Salida)
        cla(handles.Senal_Entrada_Validar)
        cla(handles.Senal_Entrada_Identificar)
        cla(handles.Senal_Salida_Validar)
        cla(handles.Senal_Salida_Identificar)
        set(handles.Tabla1,'Data',[]);
        set(handles.Tabular_Datos,'Enable','off');
        set(handles.Guardar_Datos_Tabla,'Enable','off');
        set(handles.Modificar_Datos,'Enable','off');
        set(handles.Identificacion_Escalon,'Enable','off')
        set(handles.Identificacion_no_lineal,'Enable','off')
        set(handles.Identificacion_logica_difusa,'Enable','off')
        set(handles.Identificacion_Parametrica,'Enable','off')
        set(handles.Dividir_Datos_Identificacion,'Enable','off')
        set(handles.Datos_Identificacion,'Enable','off','string','')
        set(handles.Legend_Porcentage_datos_identificacion,'Enable','off')
        set(handles.Con_cola_salida,'Enable','off','value',0)
        set(handles.Sin_cola_salida,'Enable','off','value',0)
        set(handles.Adquirir_Datos_Validacion,'Enable','off')
        set(handles.Validar_Modelos,'Enable','off')
        set(handles.Archivo,'Enable','off','value',0)


%--------------Funciones dentro del panel "Entrada"-----------------------
%-------------------------------------------------------------------------
function Lista_Funciones_Entrada_Callback(hObject, ~, handles)
   
    clear global t                                                                                                                  %Borramos la vartiable t ya que es posible que para la nueva señal se requiera un tiempo diferente. 
    global t;
    valor=get(hObject,'value');
    
    set(handles.Unidades_Tiempo_Simulacion,'Enable','off');
    set(handles.Unidades_Periodo_Muestreo,'Enable','off');
    set(handles.Tiempo_Simulacion,'Enable','off');
    set(handles.Periodo_Muestreo,'Enable','off');
    set(handles.Cargar_Senal_Entrada,'Enable','on');
    set(handles.Ver_Entrada,'Value',0);
    cla(handles.Senal_Entrada);
   
    t_simulacion=str2double(get(handles.Tiempo_Simulacion,'string'));                                                               %Se toma el valor del tiempo de simulacion, en caso de no ser un numero lo que se teclea se usa el valor de 10s como el valor por default.
    if isnan(t_simulacion)
        t_simulacion=10;
    end 
    t_muestreo=str2double(get(handles.Periodo_Muestreo,'string'));                                                                  %Se toma el valor del tiempo de muestreo, en caso de no ser un numero lo que se teclea se usa el valor de 0.01s como el valor por default.
    if isnan(t_muestreo)
        t_muestreo=0.01;
    end  
    
    t_muestreo=Unidades_Periodo_Muestreo(handles);                                                                                  %Se escala el tiempo de muestreo mediante esta funcion.
    t_simulacion=Unidades_Tiempo_Simulacion(handles);                                                                               %Se escale el tiempo de simulacion mediante esta funcion.
    
    t=0:t_muestreo:t_simulacion;                                                                                                    %Se crea el vector de tiempo con tiempo inicial t=0s, incremeto de t_muestreo segundos y tiempo final=t_simulacion.
  
    switch valor                                                                                                                    %Segun corresponda el valor de variable "valor" se hace el llamado a la gui correspondiente a cada funcion de entrada.
         case 2
            h=Senoidal;           
        case 3
            h=Triangular;            
        case 4
            h=Cuadrada;
        case 5
            h=Rampa;
        case 6
            h=Impulso;
        case 7
            h=Escalon;
        case 8
            h=senal_definida_usuario; 
        case 9
            h=random_cuadrada;
    end
    uiwait(h);
    
    function Ver_Entrada_Callback(hObject, ~, handles)
    
    global u t;                                                                                                                     %Tomamos el valor de la señal de entrada y el tiempo para plotearlo.
    
    if get(hObject,'value')==1
        axes(handles.Senal_Entrada)
        plot(t,u);
        title('Entrada');
    else
        cla(handles.Senal_Entrada);
    end
    
    set(handles.Ver_Ruido,'value',0);
    
    
function Ver_Ruido_Callback(hObject, ~, handles)

    global WN t u;                                                                                                                  %Tomamos la señal de entrada, el tiempo y el ruido blanco para plotearlos juntos.
    if get(hObject,'value')==1                                                                                                      %En caso de que el checkbox haya pasado del valor 0 al 1 ploteara la señal de salida + el ruido blanco (WN).
        axes(handles.Senal_Entrada)
        plot(t,(u+WN));
        title('Entrada');
    else                                                                                                                            %En caso de que el checkbox haya pasado del valor 1 al 0 solo ploteara la señal de salida sin ruido.
        axes(handles.Senal_Entrada)
        plot(t,u);
        title('Entrada');
    end

function Generar_Ruido_Callback(~, eventdata, handles)
    h=Ruido;
    uiwait(h);
    global pow t WN;
    WN=ruidoblanco(length(t),pow);
    Ver_Ruido_Callback(handles.Ver_Ruido,eventdata,handles);
    set(handles.Ver_Ruido,'value',0,'Enable','on');

function Cambiar_Entrada_Callback(~, ~, handles)
   
    clear global u t WN                                                                                                             %Borramos los valores de la entrada, el tiempo y el ruido.
    Limpiar_Filtros(handles);
    set(handles.Lista_Funciones_Entrada,'value',1,'Enable','on');
    set(handles.Unidades_Tiempo_Simulacion,'value',1,'Enable','on');
    set(handles.Unidades_Periodo_Muestreo,'value',1,'Enable','on');
    set(handles.Tiempo_Simulacion,'Enable','on');
    set(handles.Periodo_Muestreo,'Enable','on');
    set(handles.Ver_Entrada,'Enable','on');
    set(handles.Cargar_Senal_Entrada,'Enable','on');
    set(handles.Generar_Ruido,'Enable','on');
    set(handles.Cargar_Senal_Entrada,'Enable','off');
    set(handles.Ver_Entrada,'value',0);
    set(handles.Ver_Ruido,'value',0);
    cla(handles.Senal_Entrada)
    cla(handles.Senal_Salida)
    set(handles.Tabla1,'Data',[]);
    cla(handles.Senal_Salida)
    cla(handles.Senal_Entrada_Validar)
    cla(handles.Senal_Entrada_Identificar)
    cla(handles.Senal_Salida_Validar)
    cla(handles.Senal_Salida_Identificar)
    set(handles.Tabla1,'Data',[]);
    set(handles.Tabular_Datos,'Enable','off');
    set(handles.Guardar_Datos_Tabla,'Enable','off');
    set(handles.Modificar_Datos,'Enable','off');
    set(handles.Identificacion_Escalon,'Enable','off')
    set(handles.Identificacion_no_lineal,'Enable','off')
    set(handles.Identificacion_logica_difusa,'Enable','off')
    set(handles.Identificacion_Parametrica,'Enable','off')
    set(handles.Dividir_Datos_Identificacion,'Enable','off')
    set(handles.Datos_Identificacion,'Enable','off','string','')
    set(handles.Legend_Porcentage_datos_identificacion,'Enable','off')
    set(handles.Con_cola_salida,'Enable','off','value',0)
    set(handles.Sin_cola_salida,'Enable','off','value',0)
    set(handles.Adquirir_Datos_Validacion,'Enable','off')
    set(handles.Validar_Modelos,'Enable','off')
    set(handles.Archivo,'Enable','off','value',0)
    
function Cargar_Senal_Entrada_Callback(hObject, ~, handles)
   
    global WN u                                                                                                                     %Una vez que se presiona este boton quiere decir que la señal de entrada esta lista, entonces si existe una señal de ruido se le añadira a la señal de entrada.
    if get(handles.Lista_Funciones_Entrada,'value')==1                                                                              %En caso de haberse elegido el renglo 1 de la lista de señales se regresa el siguiente mensaje de error.
            h=errordlg('No has elegido una entrada');           
            uiwait(h)
            return;
    end
    tam=length(WN);                                                                                                                 %Si existe señal de ruido se le añade a la señal de entrada.
    if tam>0
        u=WN+u;
    end
    clear global WN;                                                                                                                %Se borra la señal de ruido para que no ocupe espacio de memoria.
    set(handles.Lista_Funciones_Entrada,'Enable','off');
    set(handles.Tiempo_Simulacion,'Enable','off');
    set(handles.Periodo_Muestreo,'Enable','off');
    set(handles.Ver_Entrada,'Enable','off');
    set(handles.Ver_Ruido,'Enable','off');
    set(hObject,'Enable','off');
    set(handles.Generar_Ruido,'Enable','off');
    set(handles.Unidades_Tiempo_Simulacion,'Enable','off');
    set(handles.Unidades_Periodo_Muestreo,'Enable','off');

%----------Funciones dentro del panel "Pretatamiento de datos"------------
%-------------------------------------------------------------------------
function Dividir_Datos_Identificacion_Callback(hObject, eventdata, handles)
    set(handles.Datos_Identificacion,'Enable','on')
    set(handles.Legend_Porcentage_datos_identificacion,'Enable','on')
    set(handles.Con_cola_salida,'Enable','off','value',0)
    set(handles.Sin_cola_salida,'Enable','off','value',0)
    set(handles.Filtrar_Adquiridos,'Enable','off','value',0)
    set(handles.Archivo,'Enable','off','value',0)
    
    
    
    
%     global u y  datos_id datos_f datos_val                                                                                          %Las variables datos_id, datos_val y datos_f se usan para separar los datos en datos de identificacion, datos de validacion y datos temporalesde filtrado.
%     t_muestreo=Unidades_Periodo_Muestreo(handles);
%     tam=length(u);
%     porcentaje=str2double(get(handles.Datos_Identificacion,'string'));                                                              %La variable porcentaje indica en porcentaje de los datos que se usan para la identificacion.
%     u_id=u(1:fix(tam*porcentaje/100));
%     u_val=u(fix(tam*porcentaje/100)+1:tam);
%     y_id=y(1:fix(tam*porcentaje/100));
%     y_val=y(fix(tam*porcentaje/100)+1:tam);
%     datos_id=iddata(y_id,u_id,t_muestreo);                                                                                          %iddata se emplea para almacenar las señales de entrada y salida asi como el tiempo de muestreo.
%     datos_val=iddata(y_val,u_val,t_muestreo);
%     datos_f=datos_id;                                                                                                               %En datos_f se almacena una copia de los datos para identificacion para aplicarle los filtros.
%     t=(0:t_muestreo:(length(u_id)-1)*t_muestreo);
%     plot(handles.Senal_Entrada_Identificar,t,u_id);
%     title(handles.Senal_Entrada_Identificar,'Entrada');
%     plot(handles.Senal_Salida_Identificar,t,y_id);
%     title(handles.Senal_Salida_Identificar,'Respuesta');
%     set(handles.Aplicar_Filtro,'Enable','on');
%     set(handles.Guardar_Datos_Filtrados,'Enable','on');
%     set(handles.Cambiar_Filtro,'Enable','on','value',1)
%     set(handles.Identificacion_Parametrica,'Enable','on');
%     set(handles.Identificacion_Escalon,'Enable','on');
    
function Identificacion_Parametrica_Callback(~,~,~)
    global valores
    
    if valores(1)~=1 ||valores(2)~=1
        h=errordlg('Este tipo de identificacion solo es compatible con sistemas SISO');
        uiwait(h)
        return
    end
    h=Identificacion_Parametrica;
    %uiwait(h);
  
function Identificacion_Escalon_Callback(~,~,~)
    global valores
    if valores(1)~=1 ||valores(2)~=1
        h=errordlg('Este tipo de identificacion solo es compatible con sistemas SISO');
        uiwait(h)
        return
    end
    h=Identificacion_Respuesta_Al_Escalon;
    %uiwait(h);

function Identificacion_no_lineal_Callback(~,~,~)
    global valores
    if valores(1)~=1 ||valores(2)~=1
        h=errordlg('Este tipo de identificacion solo es compatible con sistemas SISO');
        uiwait(h)
        return
    end
    h=Identificacion_No_Lineal;
    %uiwait(h); 
    
function Identificacion_logica_difusa_Callback(~,~,~)    
    global valores
    if valores(1)~=1
        h=errordlg('Este tipo de identificacion solo es compatible con sistemas MISO');
        uiwait(h)
        return
    end
    h=Identificacion_con_logica_difusa;
    set(handles.Validar_Modelos,'Enable','on')
   % uiwait(h);
    
%------------------Funciones dentro del panel "Filtros"-------------------
%-------------------------------------------------------------------------
function Aplicar_Filtro_Callback(hObject, eventdata, handles)
    global datos u y filter t_muestreo datos_val                                                                                               %Se declaran globales los datos de filtrado, el filtro y el tiempo de muestreo para poder tomarlos de otras funciones donde tambien fueron declarados globales.
    
    Filtro_Continua=get(handles.Filtro_Eliminador_Continua,'value');                                                                %Se escanean los checkbox para tomar su estado y asi determinar que tipo de filtro se desea aplicar.
    Filtro_Pasabajas=get(handles.Filtro_Pasabajas,'value');
    Filtro_Promediador=get(handles.Filtro_Promediador,'value');
    t_muestreo=Unidades_Periodo_Muestreo(handles);
    
    if get(handles.Filtrar_Adquiridos,'value')==1
        datos=datos_val;
    else
        datos=iddata(y,u,t_muestreo);
    end
    
    if Filtro_Promediador==1
        datos.u=promediador(datos.u);
        datos.y=promediador(datos.y);
    end
    
    if Filtro_Pasabajas==1
        h=pasabajas;
        uiwait(h);
        datos=idfilt(datos,filter);
    end
    
    if Filtro_Continua==1
        datos=detrend(datos);
    end
    t=(0:datos.Ts:(length(datos.y)-1)*datos.Ts); 
    if get(handles.Filtrar_Adquiridos,'value')==1                                                                              %Con los datos de filtrado se genera el vector de tiempo para poder graficar las señales.
        plot(handles.Senal_Entrada_Validar,t,datos.u);
        title(handles.Senal_Entrada_Validar,'Entrada');
        plot(handles.Senal_Salida_Validar,t,datos.y);
        title(handles.Senal_Salida_Validar,'Respuesta');
        set(handles.Guardar_Datos_Filtrados,'Enable','on')
        set(handles.Reset,'Enable','on')        
    else                                                                             %Con los datos de filtrado se genera el vector de tiempo para poder graficar las señales.
        plot(handles.Senal_Entrada,t,datos.u);
        title(handles.Senal_Entrada,'Entrada');
        plot(handles.Senal_Salida,t,datos.y);
        title(handles.Senal_Salida,'Respuesta');
        set(handles.Guardar_Datos_Filtrados,'Enable','on')
        set(handles.Reset,'Enable','on')
    end
function Guardar_Datos_Filtrados_Callback(hObject, eventdata, handles)
    global datos u y datos_val                                                                                                        %Esta funcion actualiza los valores de los datos de identificacion, es decir convierte los datos de filtrado en los datos de validacion.
    if get(handles.Filtrar_Adquiridos,'value')==1
        datos_val=datos;
    else
        u=datos.u;
        y=datos.y;
    end
    
    
    
function Reset_Callback(hObject, eventdata, handles)
    global u y datos_val
    if get(handles.Filtrar_Adquiridos,'value')==1
        t_muestreo=Unidades_Periodo_Muestreo(handles);
        t=(0:t_muestreo:(length(datos_val.u)-1)*t_muestreo);                                                                              %Con los datos de filtrado se genera el vector de tiempo para poder graficar las señales.
    
        plot(handles.Senal_Entrada_Validar,t,datos_val.u);
        title(handles.Senal_Entrada_Validar,'Entrada');
        plot(handles.Senal_Salida_Validar,t,datos_val.y);
        title(handles.Senal_Salida_Validar,'Respuesta');
    else    
        t_muestreo=Unidades_Periodo_Muestreo(handles);
        t=(0:t_muestreo:(length(y)-1)*t_muestreo);                                                                              %Con los datos de filtrado se genera el vector de tiempo para poder graficar las señales.
    
        plot(handles.Senal_Entrada,t,u);
        title(handles.Senal_Entrada,'Entrada');
        plot(handles.Senal_Salida,t,y);
        title(handles.Senal_Salida,'Respuesta');
    end
    function Cambiar_Filtro_Callback(hObject, eventdata, handles)
    if get(hObject,'value')==1
        set(hObject,'BackgroundColor',[ 0 0 1])
        set(handles.Filtro_Eliminador_Continua,'Enable','on')
        set(handles.Filtro_Pasabajas,'Enable','on')
        set(handles.Filtro_Promediador,'Enable','on')
    else
        set(hObject,'BackgroundColor',[0.9412    0.9412    0.9412])
        set(handles.Filtro_Eliminador_Continua,'Enable','off')
        set(handles.Filtro_Pasabajas,'Enable','off')
        set(handles.Filtro_Promediador,'Enable','off')
    end
    
%--------------------Funcines fuera de los paneles------------------------
%-------------------------------------------------------------------------
function Simular_Callback(~, ~, handles)
  global Num Den u t y;     
  Ocupado(handles);
  if strcmp((get(handles.Cargar_Modelo,'Enable')),'on')                                                                             %Para poder simular el sistema necesitamos tener un modelo, entonces una prueba de ello es que el boton de cargar modelo este inactivo.
      h=errordlg('No has cargado un modelo');
      uiwait(h)
      return;
  end
  if strcmp((get(handles.Cargar_Senal_Entrada,'Enable')),'on')                                                                      %Otro elemento necesario para la simulacion es la señal de entrada, una prueba de que hay una señal de entrada es que el boton de Cargar señal este inactivo. 
      h=errordlg('No has cargado una entrada');
      uiwait(h)
      return;
  end
  set(handles.Tabular_Datos,'Enable','on');                                                                                         %En caso de complirse las dos condiciones anteriores se procede a simular la respuesta del sistema mediante el comando lsim.
  sys=tf(Num,Den);
  y=lsim(sys,u,t);
  plot(handles.Senal_Salida,t,y);
  title(handles.Senal_Salida,'Respuesta')
  Desocupado(handles)
    
function Tabular_Datos_Callback(~, ~, handles)
    global u y  valores                                                                                                                    %Esta funcion despliega los valores de la señal de entrada y la señal de salida en la tabla.
    z=[y u];
    nombres=cell(1,valores(1)+valores(2));
    nombres{1}='y';
    nombres{valores(1)+1}='u';
    set(handles.Tabla1,'Data',z,'ColumnName',nombres);
    set(handles.Modificar_Datos,'Enable','on');
    set(handles.Guardar_Datos_Tabla,'Enable','on');
    set(handles.Periodo_Muestreo,'Enable','inactive');
    set(handles.Unidades_Periodo_Muestreo,'Enable','inactive');    

function Modificar_Datos_Callback(hObject, eventdata, handles)
    global valores
    if get(hObject,'value')==1                                                                                                      %Este callback es para un toggle button; mientras el boton este activo cambia de colo y permite modificar manualmente los datos de la tabla.
        set(handles.Tabla1,'ColumnEditable',true);
        set(hObject,'BackgroundColor',[ 0 0 1]);
    else                                                                                                                            %Cuando cambia de estado a estar nuevamente inactivo el boton, se plotean los datos en la tabla. 
        set(hObject,'BackgroundColor',[0.9412    0.9412    0.9412])
        set(handles.Tabla1,'ColumnEditable',false);
        z=get(handles.Tabla1,'Data');
        u=z(:,valores(1)+1:valores(1)+valores(2));
        y=z(:,1:valores(1));
        t_muestreo=str2double(get(handles.Periodo_Muestreo,'string'));
        t=(0:t_muestreo:t_muestreo*(length(y)-1));
        plot(handles.Senal_Entrada,t,u);
        title(handles.Senal_Entrada,'Entrada');
        plot(handles.Senal_Salida,t,y);
        title(handles.Senal_Salida,'Respuesta');   
    end
    
function Graficar_Senal_Salida_Callback(hObject, eventdata, handles)
    global y                                                                                                                        %Esta funcion sirve para graficar señales que han sido cargadas desde individualmente desde archivo.
    t_muestreo=Unidades_Periodo_Muestreo(handles);
    t=(0:t_muestreo:(length(y)-1)*t_muestreo);
    
    title(handles.Senal_Salida,'Respuesta');
    if get(hObject,'value')==1
        plot(handles.Senal_Salida,t,y);
        title(handles.Senal_Salida,'Respuesta');
    else
        cla(handles.Senal_Salida);
    end    

    function Graficar_Senal_Entrada_Callback(hObject, eventdata, handles)
    global u                                                                                                                        %Esta funcion sirve para graficar señales que han sido cargadas desde individualmente desde archivo.
    t_muestreo=Unidades_Periodo_Muestreo(handles);
    t=(0:t_muestreo:(length(u)-1)*t_muestreo);
 
    title(handles.Senal_Entrada,'Entrada');
    if get(hObject,'value')==1
        plot(handles.Senal_Entrada,t,u);
        title(handles.Senal_Entrada,'Entrada');
    else
        cla(handles.Senal_Entrada);
    end

function Guardar_Datos_Tabla_Callback(~, ~, handles)
    global u y valores                                                                                                                     %Este boton se emplea para confirmar que los datos en la tabla estan bien, o para confirmar alguna correccion que se les haya hecho.
    set(handles.Tabular_Datos,'Enable','off');
    z=get(handles.Tabla1,'Data');
    u=z(:,valores(1)+1:valores(1)+valores(2));
    y=z(:,1:valores(1));
    set(handles.Dividir_Datos_Identificacion,'Enable','on');
    set(handles.Adquirir_Datos_Validacion,'Enable','on')
    set(handles.Aplicar_Filtro,'Enable','on')
    set(handles.Cambiar_Filtro,'Enable','on')

%-----------------------------Herramientas--------------------------------
%-------------------------------------------------------------------------
function uipushtool1_ClickedCallback(~, ~, handles)
grid(handles.Senal_Entrada);                                                                                                        %Esta es una funcion de la barra de herramientas, la cual grafica el mallado en las graficas.
grid(handles.Senal_Salida);
grid(handles.Senal_Salida_Identificar);
grid(handles.Senal_Entrada_Identificar);


% --- Executes on button press in Adquirir_Datos_Validacion.
function Adquirir_Datos_Validacion_Callback(hObject, eventdata, handles)
    set(handles.Datos_Identificacion,'Enable','off')
    set(handles.Legend_Porcentage_datos_identificacion,'Enable','off')
    set(handles.Con_cola_salida,'Enable','on','value',0)
    set(handles.Sin_cola_salida,'Enable','on','value',0)
    set(handles.Archivo,'Enable','on','value',0)
    set(handles.Filtrar_Adquiridos,'Enable','off','value',0)
    % hObject    handle to Adquirir_Datos_Validacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Sin_cola_salida.
function Sin_cola_salida_Callback(hObject, eventdata, handles)
% hObject    handle to Sin_cola_salida (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Sin_cola_salida


% --- Executes on button press in Con_cola_salida.
function Con_cola_salida_Callback(hObject, eventdata, handles)
% hObject    handle to Con_cola_salida (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Con_cola_salida
function Datos_Identificacion_Callback(hObject, eventdata, handles)
    global u y  datos_id datos_f datos_val                                                                                          %Las variables datos_id, datos_val y datos_f se usan para separar los datos en datos de identificacion, datos de validacion y datos temporalesde filtrado.
    t_muestreo=Unidades_Periodo_Muestreo(handles);
    tam=length(u);
    t=(0:t_muestreo:(length(u)-1)*t_muestreo);
    porcentaje=str2double(get(handles.Datos_Identificacion,'string'));                                                              %La variable porcentaje indica en porcentaje de los datos que se usan para la identificacion.
    
    
    u_id=u(1:fix(tam*porcentaje/100),:);
    u_val=u(fix(tam*porcentaje/100)+1:tam,:);
    y_id=y(1:fix(tam*porcentaje/100),:);
    y_val=y(fix(tam*porcentaje/100)+1:tam,:);
    t_id=t(1:fix(tam*porcentaje/100));
    t_val=t(fix(tam*porcentaje/100)+1:tam);
    datos_id=iddata(y_id,u_id,t_muestreo);                                                                                          %iddata se emplea para almacenar las señales de entrada y salida asi como el tiempo de muestreo.
    datos_val=iddata(y_val,u_val,t_muestreo);
    datos_f=datos_id;                                                                                                               %En datos_f se almacena una copia de los datos para identificacion para aplicarle los filtros.
    
    plot(handles.Senal_Entrada_Identificar,t_id,u_id);
    title(handles.Senal_Entrada_Identificar,'Entrada');
    plot(handles.Senal_Salida_Identificar,t_id,y_id);
    title(handles.Senal_Salida_Identificar,'Respuesta');
    
    plot(handles.Senal_Entrada_Validar,t_val,u_val);
    title(handles.Senal_Entrada_Validar,'Entrada');
    plot(handles.Senal_Salida_Validar,t_val,y_val);
    title(handles.Senal_Salida_Validar,'Respuesta');
    
    set(handles.Aplicar_Filtro,'Enable','on');
    set(handles.Guardar_Datos_Filtrados,'Enable','off');
    set(handles.Reset,'Enable','off')
    set(handles.Cambiar_Filtro,'Enable','on','value',1)
    set(handles.Identificacion_Parametrica,'Enable','on');
    set(handles.Identificacion_Escalon,'Enable','on');
    set(handles.Identificacion_no_lineal,'Enable','on')
    set(handles.Identificacion_logica_difusa,'Enable','on')


% --- Executes during object creation, after setting all properties.
function Aplicar_Filtro_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Aplicar_Filtro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected object is changed in uipanel11.
function uipanel11_SelectionChangeFcn(hObject, eventdata, handles)
    global estado_validacion datos_val P_muestreo datos_id data valores u y
    estado_validacion=1;
    P_muestreo=Unidades_Periodo_Muestreo(handles);
    val1=get(handles.Con_cola_salida,'value');
    val2=get(handles.Sin_cola_salida,'value');
    val3=get(handles.Archivo,'value');
    h=msgbox(sprintf('El numero de señales de salida son: %g y el de señales de entrada %g ',valores(1),valores(2)));
    uiwait(h);
    if val1==1
        Adquisicion_con_contador_salida_Callback(hObject, eventdata, handles)
    elseif val2==1
        Adquisicion_sin_contador_salida_Callback(hObject, eventdata, handles)
    elseif val3==1                                                                                                                  %Declara globales a las variable                                                                                    %Limpia los datos de la seccion modelos preestablecidos e inhabilita los botones de la misma seccion
        filespec = {'*.txt'};                                                                                                     %Establece que podemos buscar archivos con cualquier nombre y de cualquier tipo.
        [filename, pathname] = uigetfile(filespec);                                                                             %Abre una ventana que nos permite buscar archivos en el sistema devolviendo su nombre y direccion.
        archivo=strcat(pathname,filename);                                                                                      %Conjuntamos el nombre y la direccion del archivo para que matlab pueda abrirlo sin estar en la carpeta que lo contiene.
        fid=fopen(archivo);                                                                                                     %fopen abre el archivo y en fid se guarda el identificador del archivo.
        escaneo=textscan(fid,'%s');                                                                                           %textscan escanea el archivo con el identificador fid con el formato dado y regresa un cel que contiene todos los datos leidos.
        fclose(fid);                                                                                                            %fclose cierra el archivo.
        escaneo=escaneo{1};
        num_salidas=str2double(escaneo(2));                                                                                                               %Se debe extraer el vector que esta dentro del cell y se hace mediante esta expresion.
        num_entradas=str2double(escaneo(4));
        periodo_muestreo=str2double(escaneo(6));
        num_muestras=str2double(escaneo(8));
        u_val=zeros(num_muestras,num_entradas);
        y_val=zeros(num_muestras,num_salidas);
        cont_columna=1;
        cont_renglon=1;
        for cont=9:length(escaneo)
            if cont_columna<=num_salidas
                y_val(cont_renglon,cont_columna)=str2double(escaneo(cont));
                if cont_columna==num_salidas+num_entradas
                    cont_columna=o;
                    cont_renglon=cont_renglon+1;
                end
                cont_columna=cont_columna+1;
            elseif cont_columna<=num_salidas+num_entradas
                u_val(cont_renglon,cont_columna-num_salidas)=str2double(escaneo(cont));
                if cont_columna==num_salidas+num_entradas
                    cont_columna=0;
                    cont_renglon=cont_renglon+1;
                end
                cont_columna=cont_columna+1;
            end
        end
        t=(0:periodo_muestreo:(num_muestras-1)*periodo_muestreo);                                                                                                              %Se debe extraer el vector que esta dentro del cell y se hace mediante esta expresion.
        if num_entradas~=valores(2)||num_salidas~=valores(1)                                                                                                   %Se debe extraer el vector que esta dentro del cell y se hace mediante esta expresion.
            h=errordlg('El numero de señales de validacion y de identificacion no coinciden');
            uiwait(h)
        else
            datos_val=iddata(y_val,u_val,periodo_muestreo);
        end
    end
    if val1==1||val2==1
        [~,n]=size(data);
        if n~=sum(valores)
            h=errordlg('El numero de señales para validacion no coincide con las señales de identificacion');
            uiwait(h)
            set(handles.Con_cola_salida,'value',0)
            set(handles.Sin_cola_salida,'value',0)
            cla(handles.Senal_Entrada_Validar)
            cla(handles.Senal_Salida_Validar)
            return
        end
        
    u_val=data(:,valores(1)+1:valores(1)+valores(2));                                                                                                            %La primer columna de la matriz data tiene los datos de la entrda.
    y_val=data(:,1:valores(1));   
    datos_val=iddata(y_val,u_val,P_muestreo);
    end
    t=(0:datos_val.TS:(length(datos_val.u)-1)*datos_val.TS);
    plot(handles.Senal_Entrada_Validar,t,datos_val.u);
    title(handles.Senal_Entrada_Validar,'Entrada')
    plot(handles.Senal_Salida_Validar,t,datos_val.y);
    title(handles.Senal_Salida_Validar,'Respuesta')
    
    datos_id=iddata(y,u,datos_val.TS);
    t=(0:datos_id.TS:(length(datos_id.u)-1)*datos_id.TS);
    plot(handles.Senal_Entrada_Identificar,t,datos_id.u);
    title(handles.Senal_Entrada_Identificar,'Entrada')
    plot(handles.Senal_Salida_Identificar,t,datos_id.y);
    title(handles.Senal_Salida_Identificar,'Respuesta')
    
    if val1==1||val2==1||val3==1
            set(handles.Filtrar_Adquiridos,'Enable','on','value',0)
    end
    set(handles.Identificacion_Escalon,'Enable','on');
    set(handles.Identificacion_no_lineal,'Enable','on')
    set(handles.Identificacion_logica_difusa,'Enable','on')
    set(handles.Identificacion_Parametrica,'Enable','on')
    estado_validacion=0;
    Desocupado(handles)

function Filtrar_Adquiridos_Callback(hObject, eventdata, handles)


% --- Executes on button press in Validar_Modelos.
function Validar_Modelos_Callback(hObject, eventdata, handles)
    h=Validacion(handles);
    %uiwait(h)
% hObject   h handle to Validar_Modelos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
