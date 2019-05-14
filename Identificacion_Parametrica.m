
%---------------------Elaboro: Juan Tapia Tinoco---------------------------
%----------------Asesor: M.I. Salvador Ramirez Zavala----------------------
%----------Universidad Michoacana de San Nicolas de Hidalgo----------------
%-----------------Facultad de Ingenieria Electrica-------------------------

%Descripcion: El   presente   gui   agrupa  algunos  de   los  metodos   de
%identificacion   mas  comunes,  todos  ellos  son  parte  del  toolbox  de
%identificacion  de matlab. Para llevar a cabo la identificacion se emplean
%los datos de  identificacion  que es  la señal  de entrada y  la señal  de
%salida  del sistema  ademas de  los  parametros  caracteristicos  de  cada
%metodo. De forma resumida los metodos son 4:

%1.-Estimacion de funcion de transferencia continua mediante el comando
%tfest.

%2.-Estimacion   de   modelo   mediante   la   estructura   de  caja  negra
%(structuras ARX,ARMAX,OE,BJ,IV4)

%3.-Estimacion de modelo mediente process models de matlab.

%4.-Estimacion de modelo mediante variables de estado.

function varargout = Identificacion_Parametrica(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Identificacion_Parametrica_OpeningFcn, ...
                   'gui_OutputFcn',  @Identificacion_Parametrica_OutputFcn, ...
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
 

function Identificacion_Parametrica_OpeningFcn(hObject, eventdata, handles, varargin)                                               %Mediante esta funcion se inicializa la interfaz. 
    global sistemas
    sistemas={'Sistemas';'color de ploteo';'salida simulada'};                                                                      %sistemas es una variable que contiene todos los sistemas que se hayan identificado para posteriormente ser validados.
    Desocupado(handles)
    set(handles.Tabla_Modelos,'Data',[])
    set(handles.Tabla_A,'visible','off')
    set(handles.Tabla_B,'visible','off')
    set(handles.Tabla_C,'visible','off')
    set(handles.Tabla_D,'visible','off')
    set(handles.Tabla_K,'visible','off')
    set(handles.nk_Estimado,'string','')
    set(handles.Estimar_na,'string','')
    set(handles.Estimar_nb,'string','')
    set(handles.Estimar_nk,'string','')
    set(handles.AIC,'value',1)
    set(handles.MLD,'value',0)
    set(handles.Numero_Polos,'string','')
    set(handles.Numero_Ceros,'string','')
    set(handles.Retardo,'string','')
    set(handles.uipanel3,'title','')
    set(handles.uipanel11,'title','')
    set(handles.Modelo_e,'string','')
    set(handles.Lista_Polos,'value',1)
    set(handles.Lista_Ceros,'value',1)
    set(handles.Subamortiguado,'value',0)
    set(handles.Retardo_Proceso,'value',0)
    set(handles.Integrador,'value',0)
    set(handles.Lista_Modelo_Ruido,'value',1)
    set(handles.Pem,'value',0)
    set(handles.Lista_Colores,'value',1)
    set(handles.nx,'string','')
    set(handles.Funcion_Transferencia,'string','')
    cla(handles.Respuestas_Modelos)
    
    handles.output = hObject;
    guidata(hObject, handles);

function varargout = Identificacion_Parametrica_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

%------------------------Creacion de las funciones-------------------------
%--------------Se les da el aspecto a los edits y popupmenus---------------
function na_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function na_Callback(hObject, eventdata, handles)
    
function nb_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function nb_Callback(hObject, eventdata, handles)
    
function nc_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function nc_Callback(hObject, eventdata, handles)
    
function nd_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function nd_Callback(hObject, eventdata, handles)

function nf_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function nf_Callback(hObject, eventdata, handles)
    
function nk_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function nk_Callback(hObject, eventdata, handles)
    
function nk_Estimado_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function nk_Estimado_Callback(hObject, eventdata, handles)
    
function Lista_Metodos_Identificacion_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Lista_Colores_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Lista_Colores_Callback(hObject, eventdata, handles)

function Estimar_na_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Estimar_na_Callback(hObject, eventdata, handles)    

function Estimar_nb_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Estimar_nb_Callback(hObject, eventdata, handles)    

function Estimar_nk_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Estimar_nk_Callback(hObject, eventdata, handles)

function Lista_Polos_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Lista_Polos_Callback(hObject, eventdata, handles)

function Lista_Ceros_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end  
function Lista_Ceros_Callback(hObject, eventdata, handles)

function Lista_Modelo_Ruido_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Lista_Modelo_Ruido_Callback(hObject, eventdata, handles)

function Numero_Polos_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Numero_Polos_Callback(hObject, eventdata, handles)

function Numero_Ceros_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Numero_Ceros_Callback(hObject, eventdata, handles)
    
 function nx_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function nx_Callback(hObject, eventdata, handles)

function Retardo_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Retardo_Callback(hObject, eventdata, handles)

function Pem_Callback(hObject, eventdata, handles)
function Retardo_Proceso_Callback(hObject, eventdata, handles)
function Integrador_Callback(hObject, eventdata, handles)
function Ayuda_Callback(hObject, eventdata, handles)

%--------------------------------Menus-------------------------------------
%--------------------------------------------------------------------------
function menu_axes4_Callback(hObject, eventdata, handles)                                                                           %Estos 2 coontexmenus sirven para escalar los ejes de la grafica de modelos simulados manualmente.
    function menu_limites_Callback(hObject, eventdata, handles)
        function menu_limitesx_Callback(hObject, eventdata, handles) 
            global x_1 x_2
            h=limite_;
            uiwait(h);
            set(handles.Respuestas_Modelos,'Xlim',[x_1 x_2]);
        function menu_limitesy_Callback(hObject, eventdata, handles)
            global y_1 y_2
            h=limite_y;
            uiwait(h);
            set(handles.Respuestas_Modelos,'Ylim',[y_1 y_2]);

%--------------------Panel Modelos no parametricos-------------------------
%Son dos diferentes metodos el primero es la respuesta a la frecuencia y el
%segundo  es  la  respuesta al escalon, ambos sirven para darle una idea al
%usuario del orden del modelo.
function Respuesta_frecuencia_Callback(hObject, eventdata, handles)                                                                 %Esta funcion se encarga de estimar empiricamente la respuesta a la frecuencia del sistema.
    global datos_id
    Ocupado(handles)
    pause(0.5)
    Res_Frecuencia=spa(datos_id);                                                                                                   %spa estima la funcion de transferencia mediante un analisis espectral para una resolucion de frecuencia fijada.
    figure
    bode(Res_Frecuencia);                                                                                                           %bode grafica la respuesta a la frecuencia generada por la funcion spa. 
    Desocupado(handles)

function Respuesta_Impulso_Callback(hObject, eventdata, handles)                                                                    %Esta funcion se encarga de estimar empiricamente la respuesta al escalon del sistema.
    global datos_id
    Ocupado(handles)
    pause(0.5)
    Res_Escalon=impulseest(datos_id,60);                                                                                            %impulseest calcula el modelo no parametrico para la respuesta al escalon para un impulso de orden 60.
    figure
    step(Res_Escalon);                                                                                                              %step simula la respuesta al escalon del sistema.
    Desocupado(handles)

%-----------------Panel de estimacion de retardo---------------------------
%Se aplican  al modelo una  serie de  estructuras ARX de diferentes ordenes
%con el fin de calcular el retardo del sistema.

function Estimar_Retardo_Callback(hObject, eventdata, handles)                                                                      %Esta funcion tiene por proposito estimar el parametro nk(retardo o tiempo muerto)
    global datos_id
    Ocupado(handles)
    pause(0.5)
    nk=delayest(datos_id);                                                                                                          %delayest calcula el retardo basandose en la comparacion de modelos ARX con diferentes retardos. 
    set(handles.nk_Estimado,'string',num2str(nk))
    Desocupado(handles)

%---------------Panel de estimacion del orden del modelo-------------------
%En  este panel  se evalua los  datos de  identificacion  con  una serie de
%estructuras  ARX o IV  definidas  por  el  usuario  de  manera  que matlab
%devuelva la que mejor cumpla con el critero 'AIC' o 'MLD'. Luego se estima
%el modelo y su respuesta.
    
function Estimar_Mediante_ARX_Callback(hObject, eventdata, handles)                                                                 %La estimacion del orden de modelos basada en la estructura ARX se usa para encontrar el orden del modelo que mejor resultados nos brinda.  
    global datos_id   datos_val                                                                                                              %datos_id son los datos para identificacion.                
    na=str2num(get(handles.Estimar_na,'string'));                                                                                   %na es el rango del parametro na. Se comprueba que se haya introducido un dato numerico, en caso contrario se interrumpe la funcion y se manda un mensaje de error.
    if isnumeric(na)~=1
        h=errordlg('na debe ser un entero positivo igual o mayor a 1');
        uiwait(h)
        return
    end
    if isempty(na)
        h=errordlg('na no ha sido definido');
        uiwait(h)
        return
    end    
    nb=str2num(get(handles.Estimar_nb,'string'));                                                                                   %nb es el rango del parametro nb.
    if isnumeric(nb)~=1
        h=errordlg('nb debe ser un entero positivo');
        uiwait(h)
        return
    end
    if isempty(nb)
        h=errordlg('nb no ha sido definido');
        uiwait(h)
        return
    end    
    nk=str2num(get(handles.Estimar_nk,'string'));                                                                                   %nk es el retardo que fue previamente estimado.
    if isnumeric(nk)~=1
        h=errordlg('nk debe ser un entero positivo o cero');
        uiwait(h)
        return
    end
    if isempty(nk)
        h=errordlg('nk no ha sido definido');
        uiwait(h)
        return
    end  
    
    Ocupado(handles);    
    NN=struc(na,nb,nk);                                                                                                             %NN es una estructura que contiene todas las combinaciones posibles de parametros (na,nb,nk).
    loss_func=arxstruc(datos_id,datos_val,NN);                                                                                      %loss_func contiene todas las funciones de perdidas para todos los modelos ARX contenidos en NN.                

    if get(handles.MLD,'value')==1                                                                                                  %Se determina que tipo de critero se tomara 'aic' o 'mld'.
        nn=selstruc(loss_func,'mld');
    elseif get(handles.AIC,'value')==1
        nn=selstruc(loss_func,'aic');
    end                                                                                                                             %nn es un vector que contiene los valores optimos para na,nb y nk.                                 
    
    set(handles.na,'string',num2str(nn(1)));
    set(handles.nb,'string',num2str(nn(2)));
    set(handles.nk,'string',num2str(nn(3)));
    set(handles.Lista_Metodos_Identificacion,'value',2)
    Identificar_Callback(hObject, eventdata, handles)                                                                               %Ya que la interfaz tiene un panel para identificacion mediante el modelo de caja negra,  se hace uso de este panel para la identificacion del modelo con los parametros recien adquiridos.

function Estimar_Mediante_IV_Callback(hObject, eventdata, handles)                                                                  %La estimacion del orden de modelo basada en la estructura IV4 se usa para encontrar el orden del modelo que mejor resultados nos brinda.
    global datos_id datos_val                                                                                                       %datos_id son los datos de identificacion, miestras datos_val son los datos de validacion.Se comprueba que se haya introducido un dato numerico, en caso contrario se interrumpe la funcion y se manda un mensaje de error.                    
    na=str2num(get(handles.Estimar_na,'string'));                                                                                   %na es el rango del parametro na.
    if isnumeric(na)~=1
        h=errordlg('na debe ser un entero positivo igual o mayor a 1');
        uiwait(h)
        return
    end
    if isempty(na)
        h=errordlg('na no ha sido definido');
        uiwait(h)
        return
    end
    nb=str2num(get(handles.Estimar_nb,'string'));                                                                                   %nb es el rango del parametro nb.
    if isnumeric(nb)~=1
        h=errordlg('nb debe ser un entero positivo');
        uiwait(h)
        return
    end
    if isempty(nb)
        h=errordlg('nb no ha sido definido');
        uiwait(h)
        return
    end
    nk=str2num(get(handles.Estimar_nk,'string'));                                                                                   %nk es el retardo que fue previamente estimado.
    if isnumeric(nk)~=1
        h=errordlg('nk debe ser un entero positivo o cero');
        uiwait(h)
        return
    end
    if isempty(nk)
        h=errordlg('nk no ha sido definido');
        uiwait(h)
        return
    end
    
    Ocupado(handles);
    NN=struc(na,nb,nk);                                                                                                             %NN es una estructura que contiene todas las combinaciones posibles de parametros (na,nb,nk).
    loss_func=arxstruc(datos_id,datos_val,NN);                                                                                      %loss_func contiene todas las funciones de perdidas para todos los modelos IV4 contenidos en NN.                

    if get(handles.MLD,'value')==1                                                                                                  %Se determina que tipo de critero se tomara 'aic' o 'mld'.
        nn=selstruc(loss_func,'mld');
    elseif get(handles.AIC,'value')==1
        nn=selstruc(loss_func,'aic');
    end                                                                                                                             %nn es un vector que contiene los valores optimos para na,nb y nk. 
    
    set(handles.na,'string',num2str(nn(1)));
    set(handles.nb,'string',num2str(nn(2)));
    set(handles.nk,'string',num2str(nn(3)));
    set(handles.Lista_Metodos_Identificacion,'value',9)
    Identificar_Callback(hObject, eventdata, handles)                                                                               %Ya que la interfaz tiene un panel para identificacion mediante el modelo de caja negra,  se hace uso de este panel para la identificacion del modelo con los parametros recien adquiridos.

%--------------------Panel Estimar modelo de continua----------------------    
%Este  panel  emplea  la   funcion  tfest  para  estimar   una  funcion  de 
%transferencia continua. Como  variables de entrada se introducen los datos 
%de identificacion, numero de polos, numero de ceros y retardo.     
 
function Estimar_ft_orden_modelo_Callback(hObject, eventdata, handles)                                                              %Esta funcion estima una funcion de transferencia continua en base a los datos de identificacion.
    global datos_id sistemas
    np=str2num(get(handles.Numero_Polos,'string'));                                                                                 %np es el numero de polos.
    nz=str2num(get(handles.Numero_Ceros,'string'));                                                                                 %nz es el numero de ceros.
    ioDelay=str2num(get(handles.Retardo,'string'));                                                                                 %ioDelay es el retardo entre la entrada y la salida.
    if isnumeric(np)~=1                                                                                                             %Comprobamos que np es un valor numerico. En caso contrario mandamos un mensaje de error.   
        h=errordlg('El Numero de Polos debe ser un entero positivo igual o mayor a 1');
        uiwait(h)
        return
    end
    if isempty(np)
        h=errordlg('El numero de polos no ha sido definido');
        uiwait(h)
        return
    end
    Ocupado(handles)
    if isempty(nz)||isnumeric(nz)~=1                                                                                                %en caso de que nz o ioDelay no sean valores numerico o esten vacios, se defien como variables vacias para que la funcion tfest las calcule automaticamente.
        nz=[];
    end
    if isempty(ioDelay)||isnumeric(ioDelay)~=1
        ioDelay=[];
    end
    
    sys=tfest(datos_id,np,nz,ioDelay);                                                                                              %Estimamos el modelo mediante tfest.

    set(handles.Tabla_A,'visible','off')                                                                                            %Hacemos invisibles los campos que estan preparados para cuando el modelo de identificacion es por variables de estado.
    set(handles.Tabla_B,'visible','off')
    set(handles.Tabla_C,'visible','off')   
    set(handles.Tabla_D,'visible','off')
    set(handles.Tabla_K,'visible','off') 
    set(handles.Modelo_e,'string','','HorizontalAlignment','center')
    set(handles.Funcion_Transferencia,'visible','on')
    set(handles.uipanel3,'title','Funcion de transferencia del modelo')
    set(handles.uipanel11,'title','Modelo del ruido e')
    
    a1=poly2str(sys.num,'s');                                                                                                       %poly2str convierte un vector de la forma [a0 a1 ... an] a un string de la forma a0+a1*s^1+...+ans^n. 
    a2=poly2str(sys.den,'s');
    ioDelay=sys.ioDelay;                                                                                                            %ioDelay se renueva con el valor de retardo obtenido del modelo.
    
    tam1=length(a1);                                                                                                                %Se creara un string para desplegar la funcion de transferencia para que sea visible para el usuario, dicho string se almacenara en la variable a.    
    if length(a2)>tam1
        tam1=length(a2);
    end

    Linea_ft=[];
    for cont=1:tam1+20
        Linea_ft=sprintf('%s-',Linea_ft);
    end
    if ioDelay~=0
        a=sprintf('(%s)*exp(-%gs)\n%s\n%s',a1,ioDelay,Linea_ft,a2);
    else
        a=sprintf('(%s)\n%s\n%s',a1,Linea_ft,a2);
    end
    
    set(handles.Funcion_Transferencia,'string',a)                                                                                   %Imprimimos la funcion de transferencia en la interfaz.          

    t=(0:datos_id.TS:(length(datos_id.y)-1)*datos_id.TS);                                                                           %Calculamos el vector t que corresponde al tiempo de adquision de os datos de adquisicion.
    salida_sistema=lsim(sys,datos_id.u,t);                                                                                          %Simulamos la respuesta del sistema ante la entrada de los datos de identificacion.    

    val_col=get(handles.Lista_Colores,'value');                                                                                     %Tomamos el color que se ha elegido para el ploteo.
    switch val_col
        case 1  
            col='b';    
            c_l='azul';
        case 2
            col='b';
            c_l='azul';
        case 3
            col='g';
            c_l='verde';
        case 4
            col='r';
            c_l='rojo';
        case 5
            col='c';
            c_l='cian';
        case 6
            col='m';
            c_l='magenta';
        case 7
            col='y';
            c_l='amarillo';
        case 8
            col='k';
            c_l='negro';
    end 
    datos_sistema={sys;col;salida_sistema};                                                                                         %datos_sistema es uncell que contiene el sistema identificado, el color del ploteo y la respuesta del modelo a la entrada de identificacion.
    sistemas=[sistemas,datos_sistema];                                                                                              %Se agrega el sistema a la variable sistemas donde se almacenan todos los sistemas identificados mediante la interfaz.       
   
    b{1,1}=c_l;
    b{1,2}='TFEST';
    b{1,3}='';
    b{1,4}='';
    b{1,5}='';
    b{1,6}='';
    b{1,7}='';
    b{1,8}='';
    b{1,9}=np;
    b{1,10}=nz;
    b{1,11}='';
    b{1,12}=true;
    b{1,13}=false;
    b{1,14}=sys.Report.Fit.FitPercent;
    b{1,15}=sys.Report.Fit.FPE;
    b{1,16}=sys.Report.Fit.MSE;
    b{1,17}=sys.Report.Fit.LossFcn;                                                                                                 %B es un cell donde se guardan los parametros empleados para cada modelo, para ser luego desplegados en la Tabla de modelos. 
    
    datos_tabla_modelos=get(handles.Tabla_Modelos,'Data');                                                                          %Se toman de la tabla los datos de los modelos ya adquiridos, en caso de que no haya otro sistema b se convierte en los datos_tabla_modelos de otro modo se añade a los datos de los demas modelos.
    if isempty(datos_tabla_modelos) 
        datos_tabla_modelos=b;
    else
        datos_tabla_modelos=[datos_tabla_modelos;b];
    end
    set(handles.Tabla_Modelos,'Data',datos_tabla_modelos)
    cla(handles.Respuestas_Modelos)                                                                                                 %Ploteamos la respuesta de los sistemas que hayan sido seleccionados por el usuario.
    plot(handles.Respuestas_Modelos,t,datos_id.y)
    if ishold(handles.Respuestas_Modelos)==0
        hold(handles.Respuestas_Modelos)
    end
    [m,~]=size(datos_tabla_modelos);
    for cont=1:m
        if datos_tabla_modelos{cont,12}
            plot(handles.Respuestas_Modelos,t,sistemas{3,cont+1},sistemas{2,cont+1})
        end
    end
Desocupado(handles)

%------Panel Estructuras basicas de identificacion tipo caja negra---------
%En  este  panel  se emplean  las estructuras ARX,ARMAX,OE,BJ y IV4 para la
%identificacion  de los  sistemas cada  uno tiene  diferentes estructuras y
%parametros por lo que al  elegir alguno de ellos de la lista de estructura
%solo los parametros que son necesarios para la estructura seleccionada son
%editables. Ademas al  presionar el boton de ayuda se despliega una ventana
%con informacion relevante de la estructura seleccionada.

function Lista_Metodos_Identificacion_Callback(hObject, eventdata, handles)                                                         %Al seleccionar alguna de las estructuras de la lista de estructuras se bloquean aquellos parametros que no son parte del modelo.
    val=get(hObject,'value');
        switch val
            case 2
                set(handles.na,'Enable','on');
                set(handles.Legend_na,'Enable','on');
                set(handles.nb,'Enable','on');
                set(handles.Legend_nb,'Enable','on');
                set(handles.nc,'Enable','off');
                set(handles.Legend_nc,'Enable','off');
                set(handles.nd,'Enable','off');
                set(handles.Legend_nd,'Enable','off');
                set(handles.nf,'Enable','off');
                set(handles.Legend_nf,'Enable','off');
                set(handles.nk,'Enable','on');
                set(handles.Legend_nk,'Enable','on');
            case 3
                set(handles.na,'Enable','on');
                set(handles.Legend_na,'Enable','on');
                set(handles.nb,'Enable','on');
                set(handles.Legend_nb,'Enable','on');
                set(handles.nc,'Enable','off');
                set(handles.Legend_nc,'Enable','off');
                set(handles.nd,'Enable','off');
                set(handles.Legend_nd,'Enable','off');
                set(handles.nf,'Enable','off');
                set(handles.Legend_nf,'Enable','off');
                set(handles.nk,'Enable','on');
                set(handles.Legend_nk,'Enable','on');
        case 4
                set(handles.na,'Enable','on');
                set(handles.Legend_na,'Enable','on');
                set(handles.nb,'Enable','on');
                set(handles.Legend_nb,'Enable','on');
                set(handles.nc,'Enable','on');
                set(handles.Legend_nc,'Enable','on');
                set(handles.nd,'Enable','off');
                set(handles.Legend_nd,'Enable','off');
                set(handles.nf,'Enable','off');
                set(handles.Legend_nf,'Enable','off');
                set(handles.nk,'Enable','on');
                set(handles.Legend_nk,'Enable','on');
        case 5
                set(handles.na,'Enable','on');
                set(handles.Legend_na,'Enable','on');
                set(handles.nb,'Enable','on');
                set(handles.Legend_nb,'Enable','on');
                set(handles.nc,'Enable','on');
                set(handles.Legend_nc,'Enable','on');
                set(handles.nd,'Enable','off');
                set(handles.Legend_nd,'Enable','off');
                set(handles.nf,'Enable','off');
                set(handles.Legend_nf,'Enable','off');
                set(handles.nk,'Enable','on');
                set(handles.Legend_nk,'Enable','on');
                set(handles.Legend_nd,'Enable','off');
                set(handles.nf,'Enable','off');
                set(handles.Legend_nf,'Enable','off');
        case 6
                set(handles.na,'Enable','off');
                set(handles.Legend_na,'Enable','off');
                set(handles.nb,'Enable','on');
                set(handles.Legend_nb,'Enable','on');
                set(handles.nc,'Enable','off');
                set(handles.Legend_nc,'Enable','off');
                set(handles.nd,'Enable','off');
                set(handles.Legend_nd,'Enable','off');
                set(handles.nf,'Enable','on');
                set(handles.Legend_nf,'Enable','on');
                set(handles.nk,'Enable','on');
                set(handles.Legend_nk,'Enable','on');
        case 7
                set(handles.na,'Enable','off');
                set(handles.Legend_na,'Enable','off');
                set(handles.nb,'Enable','on');
                set(handles.Legend_nb,'Enable','on');
                set(handles.nc,'Enable','on');
                set(handles.Legend_nc,'Enable','on');
                set(handles.nd,'Enable','on');
                set(handles.Legend_nd,'Enable','on');
                set(handles.nf,'Enable','on');
                set(handles.Legend_nf,'Enable','on');
                set(handles.nk,'Enable','on');
                set(handles.Legend_nk,'Enable','on');
  
        case 8
                set(handles.na,'Enable','off');
                set(handles.Legend_na,'Enable','off');
                set(handles.nb,'Enable','on');
                set(handles.Legend_nb,'Enable','on');
                set(handles.nc,'Enable','on');
                set(handles.Legend_nc,'Enable','on');
                set(handles.nd,'Enable','on');
                set(handles.Legend_nd,'Enable','on');
                set(handles.nf,'Enable','on');
                set(handles.Legend_nf,'Enable','on');
                set(handles.nk,'Enable','on');
                set(handles.Legend_nk,'Enable','on');     
            case 9
                set(handles.na,'Enable','on');
                set(handles.Legend_na,'Enable','on');
                set(handles.nb,'Enable','on');
                set(handles.Legend_nb,'Enable','on');
                set(handles.nc,'Enable','off');
                set(handles.Legend_nc,'Enable','off');
                set(handles.nd,'Enable','off');
                set(handles.Legend_nd,'Enable','off');
                set(handles.nf,'Enable','off');
                set(handles.Legend_nf,'Enable','off');
                set(handles.nk,'Enable','on');
                set(handles.Legend_nk,'Enable','on');
        end

function Identificar_Callback(hObject, eventdata, handles)                                                                          %Una ves que se ha elegido algun modelo y se han determinado sus parametros la funcion de identificar utiliza las funciones de matlab para identificar el sistema.

    global datos_id sistemas
    Ocupado(handles);
    fun=get(handles.Lista_Metodos_Identificacion,'value');                                                                          %Tomamos los valores de los parametros y la estructura elegida de la interfaz.
    na=str2double(get(handles.na,'string'));
    nb=str2double(get(handles.nb,'string'));
    nc=str2double(get(handles.nc,'string'));
    nd=str2double(get(handles.nd,'string'));
    nf=str2double(get(handles.nf,'string'));
    nk=str2double(get(handles.nk,'string'));
    Estado_pem=get(handles.Pem,'value');
   
    set(handles.Tabla_A,'visible','off')                                                                                            %Hacemos invisibles los campos preparados para los modelos en variables de estado.
    set(handles.Tabla_B,'visible','off')
    set(handles.Tabla_C,'visible','off')   
    set(handles.Tabla_D,'visible','off')
    set(handles.Tabla_K,'visible','off') 
    set(handles.Modelo_e,'HorizontalAlignment','center')
    set(handles.Funcion_Transferencia,'visible','on')
    set(handles.uipanel3,'title','Funcion de transferencia del modelo')
    set(handles.uipanel11,'title','Modelo del ruido e')
    
    switch fun                                                                                                                      %Se estima el modelo segun la estructura elegida y se guarda en la variable sys.
        case 1
            h=errordlg('No has elegido ninguna estructura');
            uiwait(h)
            return
        case 2
            met='ARX';
            sys=arx(datos_id,[na nb nk]);
            nc='';
            nd='';
            nf='';
        case 3
            met='ARIX';
            sys=arx(datos_id,[na nb nk],'IntegrateNoise',true);
            nc='';
            nd='';
            nf='';
        case 4
            met='ARMAX';
            sys=armax(datos_id,[na,nb,nc,nk]);          
            nd='';
            nf='';
        case 5
            met='ARIMAX';
            sys=armax(datos_id,[na,nb,nc,nk],'IntegrateNoise',true);
            nd='';
            nf='';
        case 6
            met='OE';
            sys=oe(datos_id,[nb,nf,nk]);
            na='';
            nc='';
            nd='';
        case 7
            met='BJ';
            sys=bj(datos_id,[nb,nc,nd,nf,nk]);
            na='';
        case 8
            met='BJ con I';
            sys=bj(datos_id,[nb,nc,nd,nf,nk],'IntegrateNoise',true);
            na='';
        case 9
            met='IV4';
            sys=iv4(datos_id,[na nb nk]);
            nc='';
            nd='';
            nf='';
    end
    if  Estado_pem==1                                                                                                               %El algoritmo de prediccion de error es usado para recalcular los parametros de el modelo sys si el checkbox pem del panel es activado.                                                                                                       
        sys=pem(datos_id,sys);
    end
    Modelo_planta=tf(sys,'measured');                                                                                               %Se extrae el modelo de la planta y el del ruido por separado del modelo.
    Modelo_ruido=tf(sys,'noise');
        
                                                                                                                                    %Se toman los datos de cada modelo para desplegarlos en la interfaz.
    num_planta=poly2str_digital(Modelo_planta.num{:});
    den_planta=poly2str_digital(Modelo_planta.den{:});
    ioDelay_planta=(Modelo_planta.IoDelay);
    
    num_ruido=poly2str_digital(Modelo_ruido.num{:});
    den_ruido=poly2str_digital(Modelo_ruido.den{:});
    ioDelay_ruido=(Modelo_ruido.IoDelay);
    
    tam1=length(den_planta);
    if length(num_planta)>tam1
        tam1=length(num_planta);
    end
    Linea_planta=[];
    for cont=1:tam1+20
        Linea_planta=sprintf('%s-',Linea_planta);
    end

    tam1=length(den_ruido);
    if length(num_ruido)>tam1
        tam1=length(num_ruido);
    end
    Linea_ruido=[];
    for cont=1:tam1+20
        Linea_ruido=sprintf('%s-',Linea_ruido);
    end
    if ioDelay_planta>0
        funcion_planta=sprintf('(%s)*exp(-%gs)\n%s\n%s',num_planta,ioDelay_planta,Linea_planta,den_planta);
    else
        funcion_planta=sprintf('%s\n%s\n%s',num_planta,Linea_planta,den_planta);
    end
    if ioDelay_ruido>0
        funcion_ruido=sprintf('(%s)*exp(-%gs)\n%s\n%s',num_ruido,ioDelay_ruido,Linea_ruido,den_ruido);
    else
        funcion_ruido=sprintf('%s\n%s\n%s',num_ruido,Linea_ruido,den_ruido);
    end
    
    set(handles.Funcion_Transferencia,'string',funcion_planta);
    set(handles.Modelo_e,'string',funcion_ruido);
    
    t=(0:datos_id.TS:(length(datos_id.y)-1)*datos_id.TS);                                                                           %Se simula el modelo para calcular la respuesta del modelo ante la misma entrada usada para la identificacion.
    salida_sistema=lsim(sys,datos_id.u,t);
   
    val_col=get(handles.Lista_Colores,'value');                                                                                     %Tomamos el color elegido para el ploteo de la señal.
    switch val_col
        case 1
            col='b';
            c_l='azul';
        case 2
            col='b';
            c_l='azul';
        case 3
            col='g';
            c_l='verde';
        case 4
            col='r';
            c_l='rojo';
        case 5
            col='c';
            c_l='cian';
        case 6
            col='m';
            c_l='magenta';
        case 7
            col='y';
            c_l='amarillo';
        case 8
            col='k';
            c_l='negro';
    end 
    datos_sistema={sys;col;salida_sistema};                                                                                         %datos_sistema contiene los datos del sistema identificado.
    sistemas=[sistemas,datos_sistema];                                                                                              %El sistema recien identificado se añade a los demas sistemas identifiacados.
   
    b{1,1}=c_l;
    b{1,2}=met;
    b{1,3}=na;
    b{1,4}=nb;
    b{1,5}=nc;
    b{1,6}=nd;
    b{1,7}=nf;
    b{1,8}=nk;
    b{1,9}='';
    b{1,10}='';
    b{1,11}='';
    b{1,12}=true;
    b{1,13}=false;
    b{1,14}=sys.Report.Fit.FitPercent;
    b{1,15}=sys.Report.Fit.FPE;
    b{1,16}=sys.Report.Fit.MSE;
    b{1,17}=sys.Report.Fit.LossFcn;                                                                                                 %B es un cell donde se guardan los parametros empleados para cada modelo, para ser luego desplegados en la Tabla de modelos. 
    
    datos_tabla_modelos=get(handles.Tabla_Modelos,'Data');                                                                          %Se toman de la tabla los datos de los modelos ya adquiridos, en caso de que no haya otro sistema b se convierte en los datos_tabla_modelos de otro modo se añade a los datos de los demas modelos.
    if isempty(datos_tabla_modelos) 
        datos_tabla_modelos=b;
    else
        datos_tabla_modelos=[datos_tabla_modelos;b];
    end
    set(handles.Tabla_Modelos,'Data',datos_tabla_modelos)
    cla(handles.Respuestas_Modelos)                                                                                                 %Ploteamos la respuesta de los sistemas que hayan sido seleccionados por el usuario.
    plot(handles.Respuestas_Modelos,t,datos_id.y)
    if ishold(handles.Respuestas_Modelos)==0
        hold(handles.Respuestas_Modelos)
    end
    [m,~]=size(datos_tabla_modelos);
    for cont=1:m
        if datos_tabla_modelos{cont,12}
            plot(handles.Respuestas_Modelos,t,sistemas{3,cont+1},sistemas{2,cont+1})
        end
    end
   Desocupado(handles);

   %---------------------Panel Modelos de Proceso--------------------------
   %Los modelos de  procesos son una serie de modelos, donde los parametros
   %a definir son el numero de polos, el numero de ceros, si es una funcion
   %de trasferencia con  subamortiguamiento, si tiene retardo o si tiene un
   %integrador. 
   
   function Subamortiguado_Callback(hObject, eventdata, handles)                                                                    %Esta funcion despliega la opcion de 2 y 3 polos cuando el sistema es subamortiguado(polos complejos)y 1,2 y 3 polos cuando el sistema solo tiene polos reales.
    
    val=get(hObject,'value');
    if  val==1
        set(handles.Lista_Polos,'string',{'Numero de Polos';'2';'3'},'value',1);
    else
        set(handles.Lista_Polos,'string',{'Numero de Polos';'1';'2';'3'},'value',1);
    end
   
   function Identificar_Proceso_Callback(hObject, eventdata, handles)                                                               %Esta funcion toma los valores elegidos por el usuario para mediante la funcion de matlab process estimar un modelos de proceso.
    global datos_id sistemas
    val=get(handles.Lista_Polos,'value');                                                                                           %Tomamos el valor del numero de polos, en caso de que se haya elegido el encabezado de la lista se manda un mensaje de error.
    if val==1
        h=errordlg('No has elegido un numero de polos valido');
        uiwait(h)
        return
    else
        Lista_Polos=get(handles.Lista_Polos,'string');
        Num_Polos=str2double(Lista_Polos(val));
    end
    
    Exp=sprintf('P%g',Num_Polos);                                                                                                   %Expresion es un string esta variable sera la variable de entrada a la funcion process. Esta expresion define el modelo mediante el cual se desea aproximar el comportamiento a los datos de identificacion. El numero de polos se especifica con un Pn  donde n es el numero de polos entre 1 y 3.
    
    val=get(handles.Lista_Ceros,'value');                                                                                           %Se toma el valor de los ceros. En caso de haberse elegidop el encabezado se manda un mensaje de error.
    if val==1
        h=errordlg('No has elegido un numero de ceros valido');
        uiwait(h)
        return
    else
        Lista_Ceros=get(handles.Lista_Ceros,'string');
        Num_Ceros=str2double(Lista_Ceros(val));
    end
        
    if Num_Ceros==1
        Exp=sprintf('%sZ',Exp);                                                                                                     %Si se desea que el modelo tenga un cero se añade a EXP la letra Z.
    end
  
    if get(handles.Retardo_Proceso,'value')==1                                                                                      %Si se desa que el modelo tenda un retardo se añade la letra D.
        Exp=sprintf('%sD',Exp);
    end

    if get(handles.Integrador,'value')==1                                                                                           %Si se desea que el modelo tenga un integrador se añade la letra I.
        Exp=sprintf('%sI',Exp);
    end    
    
    if get(handles.Subamortiguado,'value')==1                                                                                       %Si se desea que el modelo sea subamortiguado se añade la letra U.
        Exp=sprintf('%sU',Exp);
    end
    
    Ocupado(handles);
    Tipo=idproc(Exp);                                                                                                               %idproc crea un modelo de proceso listo para que los datos de identificacion sean estimados.
    
    Opt=procestOptions;
    val=get(handles.Lista_Modelo_Ruido,'value');                                                                                    %si se indica se añade un modelo para el ruido y enseguida se realiza la estimacion del modelo.
    if val==2
        Opt.DisturbanceModel='ARMA1';
        sys=procest(datos_id,Tipo,Opt);
        Exp=strcat(Exp,'R_ARMA1');
    elseif val==3
        Opt.DisturbanceModel='ARMA2';
        sys=procest(datos_id,Tipo,Opt);
        Exp=strcat(Exp,'R_ARMA2');
    else
        sys=procest(datos_id,Tipo);
    end
    
    Kp=sys.Kp;                                                                                                                      %Se toman las parametros identificados y se contruyen strings de los modelos de la planta y del ruido para ser desplegados en la interfaz de modo que sean visibles para el usuario.
    Tp1=sys.Tp1;
    Tp2=sys.Tp2;
    Tp3=sys.Tp3;
    Tz=sys.Tz;
    Tw=sys.Tw;
    Zeta=sys.Zeta;
    Td=sys.Td;
    Integration=sys.Integration;
    if Tp1~=0
        if Tp1>0
            exp_den=sprintf('(1+%g*s)',Tp1);
        else
            exp_den=sprintf('(1-%g*s)',abs(Tp1));   
        end
    else
        exp_den='';
    end
    
   if Tp2~=0
        if Tp2>0
            exp_den=sprintf('%s(1+%g*s)',exp_den,Tp2);
        else
            exp_den=sprintf('%s(1-%g*s)',exp_den,abs(Tp2));   
        end
   end
   if Tp3~=0
        if Tp3>0
            exp_den=sprintf('%s(1+%g*s)',exp_den,Tp3);
        else
            exp_den=sprintf('%s(1-%g*s)',exp_den,abs(Tp3));   
        end
   end
    
   if Tw~=0
       if Zeta>0
           exp_den=sprintf('(1+%g*s+(%s*s)^2)%s',2*Zeta*Tw,Tw,exp_den);
       else
           exp_den=sprintf('(1-%g*s+(%g*s)^2)%s',2*Zeta*Tw,Tw,exp_den);
       end
   end
   
   if Integration==1
       exp_den=strcat('s',exp_den);
   end
   
   
   exp_num=sprintf('%g',Kp);
   
   if Tz~=0
        if Tz>0
            exp_num=sprintf('(%s)(1+%g*s)',exp_num,Tz);
        else
            exp_num=sprintf('(%s)(1-%g*s)',exp_num,abs(Tz));   
        end
   end
   
    if Td~=0
        exp_num=sprintf('%s*exp(-%g*s)',exp_num,Td);
    end
    
    tam1=length(exp_den);
    if length(exp_num)>tam1
        tam1=length(exp_num);
    end
    Linea_modelo=[];
    for cont=1:tam1+20
        Linea_modelo=sprintf('%s-',Linea_modelo);
    end
    funcion_proceso=sprintf('%s\n%s\n%s',exp_num,Linea_modelo,exp_den);
    set(handles.Funcion_Transferencia,'string',funcion_proceso)
    
    Modelo_ruido=tf(sys,'noise');
    num_ruido=poly2str(Modelo_ruido.num{:},'s');
    den_ruido=poly2str(Modelo_ruido.den{:},'s');
    ioDelay_ruido=(Modelo_ruido.IoDelay);
    tam1=length(den_ruido);
    if length(num_ruido)>tam1
        tam1=length(num_ruido);
    end
    Linea_ruido=[];
    for cont=1:tam1+20
        Linea_ruido=sprintf('%s-',Linea_ruido);
    end
    if ioDelay_ruido>0
        funcion_ruido=sprintf('(%s)*exp(-%gs)\n%s\n%s',num_ruido,ioDelay_ruido,Linea_ruido,den_ruido);
    else
        funcion_ruido=sprintf('%s\n%s\n%s',num_ruido,Linea_ruido,den_ruido);
    end
    set(handles.Modelo_e,'string',funcion_ruido,'HorizontalAlignment','center');
    
    set(handles.Tabla_A,'visible','off')                                                                                            %Hacemos invisibles los campos preparados para los modelos en variables de estado.
    set(handles.Tabla_B,'visible','off')
    set(handles.Tabla_C,'visible','off')   
    set(handles.Tabla_D,'visible','off')
    set(handles.Tabla_K,'visible','off') 
    set(handles.Funcion_Transferencia,'visible','on')
    set(handles.uipanel3,'title','Funcion de transferencia del modelo')
    set(handles.uipanel11,'title','Modelo del ruido e')
   
     
    t=(0:datos_id.TS:(length(datos_id.y)-1)*datos_id.TS);                                                                           %Se simula el modelo para calcular la respuesta del modelo ante la misma entrada usada para la identificacion.
    salida_sistema=lsim(sys,datos_id.u,t);
    
    val_col=get(handles.Lista_Colores,'value');                                                                                     %Tomamos el color elegido para el ploteo de la señal.
    switch val_col
        case 1
            col='b';
            c_l='azul';
        case 2
            col='b';
            c_l='azul';
        case 3
            col='g';
            c_l='verde';
        case 4
            col='r';
            c_l='rojo';
        case 5
            col='c';
            c_l='cian';
        case 6
            col='m';
            c_l='magenta';
        case 7
            col='y';
            c_l='amarillo';
        case 8
            col='k';
            c_l='negro';
    end 
    datos_sistema={sys;col;salida_sistema};                                                                                         %datos_sistema contiene los datos del sistema identificado.
    sistemas=[sistemas,datos_sistema];                                                                                              %El sistema recien identificado se añade a los demas sistemas identifiacados.
   
    b{1,1}=c_l;
    b{1,2}=Exp;
    b{1,3}='';
    b{1,4}='';
    b{1,5}='';
    b{1,6}='';
    b{1,7}='';
    b{1,8}='';
    b{1,9}='';
    b{1,10}='';
    b{1,11}='';
    b{1,12}=true;
    b{1,13}=false;
    b{1,14}=sys.Report.Fit.FitPercent;
    b{1,15}=sys.Report.Fit.FPE;
    b{1,16}=sys.Report.Fit.MSE;
    b{1,17}=sys.Report.Fit.LossFcn;                                                                                                 %B es un cell donde se guardan los parametros empleados para cada modelo, para ser luego desplegados en la Tabla de modelos. 
    
    datos_tabla_modelos=get(handles.Tabla_Modelos,'Data');                                                                          %Se toman de la tabla los datos de los modelos ya adquiridos, en caso de que no haya otro sistema b se convierte en los datos_tabla_modelos de otro modo se añade a los datos de los demas modelos.
    if isempty(datos_tabla_modelos) 
        datos_tabla_modelos=b;
    else
        datos_tabla_modelos=[datos_tabla_modelos;b];
    end
    set(handles.Tabla_Modelos,'Data',datos_tabla_modelos)
    cla(handles.Respuestas_Modelos)                                                                                                 %Ploteamos la respuesta de los sistemas que hayan sido seleccionados por el usuario.
    plot(handles.Respuestas_Modelos,t,datos_id.y)
    if ishold(handles.Respuestas_Modelos)==0
        hold(handles.Respuestas_Modelos)
    end
    [m,~]=size(datos_tabla_modelos);
    for cont=1:m
        if datos_tabla_modelos{cont,12}
            plot(handles.Respuestas_Modelos,t,sistemas{3,cont+1},sistemas{2,cont+1})
        end
    end
   Desocupado(handles);
   
   %-------------Panel Modelos mediante variables de estado----------------
   %En este panel se emplea la funcion ssest de  matlab para identificar un
   %sistema  mediante  el modelo de  variables  de estado, como  entrada la
   %funcion solo recibe  el valor de los datos de identificacion y el orden
   %del modelo.
   
   function Estimar_ss_Callback(hObject, eventdata, handles)
    global datos_id sistemas 
    
    nx=str2num(get(handles.nx,'string'));                                                                                   %nx el orden del sistema. Verificamos que sea unvalor numerico en caso de que no lo sea regresamos un mensaje de error.
    if isnumeric(nx)~=1
        h=errordlg('nx debe ser un entero positivo igual o mayor a 1');
        uiwait(h)
        return
    end
    if isempty(nx)
        h=errordlg('nx no ha sido definido');
        uiwait(h)
        return
    end
    Ocupado(handles)
    xs={'x1','x2','x3','x4','x5','x6','x7','x8','x9','x10'};
    xs1=xs(1:nx);
    
    sys=ssest(datos_id,nx);                                                                                                         %Empleamos la funcion ssets de matlab y luego hacemos visibles los campos de la interfaz para identificacion mediante variables de estado y desplegar la informacion del modelo.
    set(handles.Tabla_A,'visible','on','Data',sys.A,'ColumnName',xs1,'RowName',xs1)
    set(handles.Tabla_B,'visible','on','Data',sys.B,'ColumnName','u1','RowName',xs1)
    set(handles.Tabla_C,'visible','on','Data',sys.C,'ColumnName',xs1,'RowName','y1')   
    set(handles.Tabla_D,'visible','on','Data',sys.D,'ColumnName','u1','RowName','y1')
    set(handles.Tabla_K,'visible','on','Data',sys.K,'ColumnName','y1','RowName',xs1)
    texto={'';'dx/dy=Ax(t)+Bu(t)+Ke(t)';'y(t)=Cx(t)+Du(t)+e(t)'};
    set(handles.Modelo_e,'string',texto,'HorizontalAlignment','right')
    set(handles.Funcion_Transferencia,'visible','off')
    set(handles.uipanel3,'title','Modelo en variables de estado matrices A,B y C')
    set(handles.uipanel11,'title','Modelo en variables de estado matrices D y K')
    
        t=(0:datos_id.TS:(length(datos_id.y)-1)*datos_id.TS);                                                                           %Se simula el modelo para calcular la respuesta del modelo ante la misma entrada usada para la identificacion.
    salida_sistema=lsim(sys,datos_id.u,t);
    
    val_col=get(handles.Lista_Colores,'value');                                                                                     %Tomamos el color elegido para el ploteo de la señal.
    switch val_col
        case 1
            col='b';
            c_l='azul';
        case 2
            col='b';
            c_l='azul';
        case 3
            col='g';
            c_l='verde';
        case 4
            col='r';
            c_l='rojo';
        case 5
            col='c';
            c_l='cian';
        case 6
            col='m';
            c_l='magenta';
        case 7
            col='y';
            c_l='amarillo';
        case 8
            col='k';
            c_l='negro';
    end 
    datos_sistema={sys;col;salida_sistema};                                                                                         %datos_sistema contiene los datos del sistema identificado.
    sistemas=[sistemas,datos_sistema];                                                                                              %El sistema recien identificado se añade a los demas sistemas identifiacados.
   
    b{1,1}=c_l;
    b{1,2}='ss';
    b{1,3}='';
    b{1,4}='';
    b{1,5}='';
    b{1,6}='';
    b{1,7}='';
    b{1,8}='';
    b{1,9}='';
    b{1,10}='';
    b{1,11}=nx;
    b{1,12}=true;
    b{1,13}=false;
    b{1,14}=sys.Report.Fit.FitPercent;
    b{1,15}=sys.Report.Fit.FPE;
    b{1,16}=sys.Report.Fit.MSE;
    b{1,17}=sys.Report.Fit.LossFcn;                                                                                                 %B es un cell donde se guardan los parametros empleados para cada modelo, para ser luego desplegados en la Tabla de modelos. 
    
    datos_tabla_modelos=get(handles.Tabla_Modelos,'Data');                                                                          %Se toman de la tabla los datos de los modelos ya adquiridos, en caso de que no haya otro sistema b se convierte en los datos_tabla_modelos de otro modo se añade a los datos de los demas modelos.
    if isempty(datos_tabla_modelos) 
        datos_tabla_modelos=b;
    else
        datos_tabla_modelos=[datos_tabla_modelos;b];
    end
    set(handles.Tabla_Modelos,'Data',datos_tabla_modelos)
    cla(handles.Respuestas_Modelos)                                                                                                 %Ploteamos la respuesta de los sistemas que hayan sido seleccionados por el usuario.
    plot(handles.Respuestas_Modelos,t,datos_id.y)
    if ishold(handles.Respuestas_Modelos)==0
        hold(handles.Respuestas_Modelos)
    end
    [m,~]=size(datos_tabla_modelos);
    for cont=1:m
        if datos_tabla_modelos{cont,12}
            plot(handles.Respuestas_Modelos,t,sistemas{3,cont+1},sistemas{2,cont+1})
        end
    end
   Desocupado(handles);
   
%---------------------Panel Modelos Identificados--------------------------
%En este panel se  despliega la informacion  de los sistemas iedentificados
%ademas  contiene  la opcion  de decidir que  sistemas plotear  asi como la
%opcion para borrar los sistemas.

function Tabla_Modelos_CellSelectionCallback(hObject, eventdata, handles)
function Tabla_Modelos_CellEditCallback(hObject, eventdata, handles)                                                                %Esta funcion se ejecuta cada que se edita un elemento de la tabla de modelos identificados
    global sistemas datos_id
   
    t=(0:datos_id.TS:(length(datos_id.y)-1)*datos_id.TS);
    datos_tabla_modelos=get(handles.Tabla_Modelos,'Data');
    [m,~]=size(datos_tabla_modelos);
    for cont=m:-1:1                                                                                                                 %Se borran los sistemas señalados tanto de los datos de la tabla como de la variable sistemas.
        if datos_tabla_modelos{cont,13}
            datos_tabla_modelos(cont,:)=[];
            sistemas(:,cont+1)=[];
        end
    end

    [m,~]=size(datos_tabla_modelos);                                                                                                %Se plotean los sistemas restantes que se deseen plotear.
    if m~=0
        cla(handles.Respuestas_Modelos)
        plot(handles.Respuestas_Modelos,t,datos_id.y)
        if ishold(handles.Respuestas_Modelos)==0
            hold(handles.Respuestas_Modelos)
        end
        for cont=1:m
            if datos_tabla_modelos{cont,12}
                plot(handles.Respuestas_Modelos,t,sistemas{3,cont+1},sistemas{2,cont+1})
            end
        end
    else
        cla(handles.Respuestas_Modelos)
    end
    
    set(handles.Tabla_Modelos,'Data',datos_tabla_modelos)

    
 function Cerrar_Callback(hObject, eventdata, handles)                                                                              %Este boton cierra la interfaz.
    close(handles.figure1);  