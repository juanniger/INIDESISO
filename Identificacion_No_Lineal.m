function varargout = Identificacion_No_Lineal(varargin)
% IDENTIFICACION_NO_LINEAL MATLAB code for Identificacion_No_Lineal.fig
%      IDENTIFICACION_NO_LINEAL, by itself, creates a new IDENTIFICACION_NO_LINEAL or raises the existing
%      singleton*.
%
%      H = IDENTIFICACION_NO_LINEAL returns the handle to a new IDENTIFICACION_NO_LINEAL or the handle to
%      the existing singleton*.
%
%      IDENTIFICACION_NO_LINEAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IDENTIFICACION_NO_LINEAL.M with the given input arguments.
%
%      IDENTIFICACION_NO_LINEAL('Property','Value',...) creates a new IDENTIFICACION_NO_LINEAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Identificacion_No_Lineal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Identificacion_No_Lineal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Identificacion_No_Lineal

% Last Modified by GUIDE v2.5 10-Aug-2014 01:23:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Identificacion_No_Lineal_OpeningFcn, ...
                   'gui_OutputFcn',  @Identificacion_No_Lineal_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


%---------------------La funcion de apertura-------------------------------
%Esta  funcion  es la  primera que se ejecuta al inicializarse la interfaz,
%por ello aqui se inicializan todos los botones de accion de la interfaz.
function Identificacion_No_Lineal_OpeningFcn(hObject, eventdata, handles, varargin)
    global sistemas_no_lineales estado_edicion copia  Estimadores                                                                                                   %La variable de sistemas no lineales se usara para guardar todos los sistemas no lineales identificados.
    sistemas_no_lineales={'Sistema no lineal';'Color de ploteo';'Respuesta a datos de identificacion'};
    estado_edicion=0;
    copia=[];
    Estimadores=cell(1,2);
    Desocupado(handles);
    cla(handles.Respuestas_Modelos)
    set(handles.Tabla_Modelos_Identificados,'Data',[])
    set(handles.Tabla_Regresores,'Data',[])
    set(handles.Tabla_Regresores_Usuario,'Data',[])
    set(handles.Finalizar_Edicion,'Enable','off')
    set(handles.Lista_Opciones_Regresores,'Enable','off')
    set(handles.Unidades_Estimadores,'Enable','off')
    set(handles.Legend_Unidades_estimador,'Enable','off')
    set(handles.Lista_Tipo_Regresores,'Enable','off')
    set(handles.n1,'Enable','off')
    set(handles.Legend_n1,'Enable','off')
    set(handles.n2,'Enable','off')
    set(handles.Legend_n2,'Enable','off')
    set(handles.Regresor1,'Enable','off','value',0)
    set(handles.Regresor2,'Enable','off','value',0)
    set(handles.Regresor3,'Enable','off','value',0)
    set(handles.Regresor4,'Enable','off','value',0)
    set(handles.Regresor5,'Enable','off','value',0)
    set(handles.Regresor_Manual,'Enable','off')
    set(handles.Cargar_Regresor,'Enable','off')
    set(handles.Editar_Estimador,'Enable','off')
    set(handles.Cancelar_Editor_Estimador,'Enable','off')
    set(handles.Estimar_nlarx,'Enable','off')
    set(handles.On,'Enable','off','value',1)
    set(handles.Off,'Enable','off','value',0)
    set(handles.Regresores_Modelos_Elegido,'Data',[])
    set(handles.On_hw,'Enable','off','value',1)
    set(handles.Off_hw,'Enable','off','value',0)
    set(handles.Panel_Unidades_hw,'Title','')
    set(handles.Legend_Unidades_hw,'string','')
    set(handles.Unidades_hw,'Enable','off','string','')
    set(handles.Panel_Rango,'Title','')
    set(handles.Min_hw,'Enable','off','string','')
    set(handles.Max_hw,'Enable','off','string','')
    set(handles.Finalizar_Edicion_hw,'Enable','off')
    set(handles.Estimar_nlhw,'Enable','off')
    set(handles.Lista_Estimadores_hw,'Enable','off','value',1)
    
    handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Identificacion_No_Lineal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Identificacion_No_Lineal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%-------------------------Funciones de creacion----------------------------
%--------------Le dan formato a los edits y popupmenus---------------------
function na_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function nb_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function nk_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Lista_Estimadores_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Lista_Colores_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Lista_Colores_Callback(hObject, eventdata, handles)

function Unidades_Estimadores_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Unidades_Estimadores_Callback(hObject, eventdata, handles)

function Lista_Opciones_Regresores_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Regresor_Manual_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Regresor_Manual_Callback(hObject, eventdata, handles)

function n2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function n2_Callback(hObject, eventdata, handles)

function n1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Lista_Tipo_Regresores_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Lista_Tipo_Regresores_Callback(hObject, eventdata, handles)

function nk_hw_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function nb_hw_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function na_hw_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Lista_Modelos_hw_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Min_hw_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
    
function Max_hw_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Unidades_hw_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Lista_Estimadores_hw_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%-----------------Panel Estimar modelos usando lnarx-----------------------
%Este  panel  emplea  la  funcion  de  matlab  lnarx para estimar un modelo
%no-lineal,  para   ello  toma   como  dato   de  entrada  los  datos  para
%identificacion,los parametros na, nb y nk y el tipo de estimador no lineal
%que se desea usar.

function Estimar_nlarx_Callback(hObject, eventdata, handles)                                                                        %Esta funcion es la que se encarga de reunir los datos que ingresa el usuario para identificar el modelo no lineal.
    global datos_id sistemas_no_lineales estado_edicion
    na=str2num(get(handles.na,'string'));                                                                                           %Se toman los valores de los parametros y se verifica que sean numeros, en caso contrario se mandan mensajes de error y se aborta la ejecucion de la funcion.
    nb=str2num(get(handles.nb,'string'));
    nk=str2num(get(handles.nk,'string'));
    
    if isempty(na)
        h=errordlg('na debe ser un entero positivo igual o mayor a 1');
        uiwait(h)
        return
    end
    if isempty(nb)
        h=errordlg('nb debe ser un entero positivo igual o mayor a 1');
        uiwait(h)
        return
    end
    if isempty(nk)
        h=errordlg('nk debe ser un entero positivo o cero');
        uiwait(h)
        return
    end
    
    Ocupado(handles);
    pause(0.5);
    val=get(handles.Lista_Estimadores,'value');                                                                                     %Se toma el estimador elegido por el usuario.
    reg=0;
    
    if estado_edicion==1
        if get(handles.Lista_Estimadores,'value')==2||get(handles.Lista_Estimadores,'value')==3||get(handles.Lista_Estimadores,'value')==4
            
            if isempty(str2num(get(handles.Unidades_Estimadores,'string')))
                Opcion='auto';
            else
                Opcion=str2num(get(handles.Unidades_Estimadores,'string'));
            end
            
            if get(handles.Lista_Estimadores,'value')==2
                if get(handles.On,'value')==1
                    Estimador=wavenet('num',Opcion,'LinearTerm','on');
                else
                    Estimador=wavenet('num',Opcion,'LinearTerm','off');
                end
                Opt='wavenet';
            elseif get(handles.Lista_Estimadores,'value')==3
                if strcmp(Opcion,'auto')
                    Opcion=10;
                end
                if get(handles.On,'value')==1
                    Estimador=sigmoidnet('num',Opcion,'LinearTerm','on');
                else
                    Estimador=sigmoidnet('num',Opcion,'LinearTerm','off');
                end
                Opt='sigmoidnet';
            elseif get(handles.Lista_Estimadores,'value')==4
                Estimador=treepartition('num',Opcion);
                Opt='treepartition';
            end
            
            if get(handles.Lista_Opciones_Regresores,'value')~=5
                if get(handles.Lista_Opciones_Regresores,'value')==1
                    Regresores='all';
                elseif get(handles.Lista_Opciones_Regresores,'value')==2
                    Regresores='input';
                elseif get(handles.Lista_Opciones_Regresores,'value')==3
                    Regresores='output';
                elseif get(handles.Lista_Opciones_Regresores,'value')==4
                    Regresores='standart';
                end
                
            else
                Regresores=get(handles.Tabla_Regresores,'Data');
                Regresores=Regresores(:,2);
                m=length(Regresores);
                cont1=1;
                for cont=1:m
                    if Regresores{cont}
                        reg(cont1)=cont;
                        cont1=cont1+1;
                    end
                end         
                if cont1==1
                    h=errordlg('No es posible usar la funcion nlarx sin ningun regresor');
                    uiwait(h)
                    Cancelar_Editor_Estimador_Callback(hObject, eventdata, handles)
                    set(handles.Editar_Estimador,'Enable','on')
                    set(handles.Estimar_nlarx,'Enable','on')
                    return
                end
                Regresores=reg;
            end
            sys=nlarx(datos_id,[na,nb,nk],Estimador,'nlr',Regresores);            
        elseif get(handles.Lista_Estimadores,'value')==5
            Opt='linear';
            Regresores=get(handles.Tabla_Regresores_Usuario,'Data');
            Regresores=Regresores(:,1);
            sys=nlarx(datos_id,[na,nb,nk],'Linear','CustomReg',Regresores);       
        end
    else
        if val>1
            Opt=get(handles.Lista_Estimadores,'string');
            Opt=Opt{val};
        else
            Opt=[];
        end
        sys=nlarx(datos_id,[na,nb,nk],Opt);
    end 
    
    if get(handles.Lista_Estimadores,'value')==1||get(handles.Lista_Estimadores,'value')==5
        unidades='';
    else
        unidades=sys.Nonlinearity.NumberOfUnits;
    end
    salida_sistema=sim(sys,datos_id.u);                                                                                             %Simulamos la respuesta del sistema ante la entrada de los datos de identificacion.    
    t=(0:datos_id.TS:(length(datos_id.y)-1)*datos_id.TS);
    
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
    sistemas_no_lineales=[sistemas_no_lineales,datos_sistema];                                                                                              %Se agrega el sistema a la variable sistemas donde se almacenan todos los sistemas identificados mediante la interfaz.       
   
    b{1,1}=c_l;
    b{1,2}='nlarx';
    b{1,3}=Opt;
    b{1,4}=unidades;
    b{1,5}=na;
    b{1,6}=nb;
    b{1,7}=nk;
    b{1,8}=true;
    b{1,9}=false;
    b{1,10}=sys.EstimationInfo.FPE;
    b{1,11}=sys.EstimationInfo.LossFcn;                                                                                                  %B es un cell donde se guardan los parametros empleados para cada modelo, para ser luego desplegados en la Tabla de modelos. 
    b{1,12}=false;
    datos_tabla_modelos=get(handles.Tabla_Modelos_Identificados,'Data');                                                                          %Se toman de la tabla los datos de los modelos ya adquiridos, en caso de que no haya otro sistema b se convierte en los datos_tabla_modelos de otro modo se añade a los datos de los demas modelos.
    if isempty(datos_tabla_modelos) 
        datos_tabla_modelos=b;
    else
        datos_tabla_modelos=[datos_tabla_modelos;b];
    end
    set(handles.Tabla_Modelos_Identificados,'Data',datos_tabla_modelos)
    cla(handles.Respuestas_Modelos)                                                                                                 %Ploteamos la respuesta de los sistemas que hayan sido seleccionados por el usuario.
    plot(handles.Respuestas_Modelos,t,datos_id.y)
    if ishold(handles.Respuestas_Modelos)==0
        hold(handles.Respuestas_Modelos)
    end
    [m,~]=size(datos_tabla_modelos);
    for cont=1:m
        if datos_tabla_modelos{cont,8}
            plot(handles.Respuestas_Modelos,t,sistemas_no_lineales{3,cont+1},sistemas_no_lineales{2,cont+1})
        end
    end
    Cancelar_Editor_Estimador_Callback(hObject, eventdata, handles)
    set(handles.na,'string','')
    set(handles.nb,'string','')
    set(handles.nk,'string','')
    set(handles.Lista_Estimadores,'value',1)
    Desocupado(handles)

function Lista_Estimadores_Callback(hObject, eventdata, handles)    
    if get(hObject,'value')~=1&&isempty(str2num(get(handles.na,'string')))~=1&&isempty(str2num(get(handles.nb,'string')))~=1&&isempty(str2num(get(handles.nk,'string')))~=1
        set(handles.Editar_Estimador,'Enable','on')
        set(handles.Estimar_nlarx,'Enable','on')
    else
        set(handles.Editar_Estimador,'Enable','off')
        set(handles.Estimar_nlarx,'Enable','off')
        Cancelar_Editor_Estimador_Callback(hObject, eventdata, handles)
    end
    
function na_Callback(hObject, eventdata, handles)
    if get(handles.Lista_Estimadores,'value')~=1&&isempty(str2num(get(handles.na,'string')))~=1&&isempty(str2num(get(handles.nb,'string')))~=1&&isempty(str2num(get(handles.nk,'string')))~=1
        set(handles.Editar_Estimador,'Enable','on')
        set(handles.Estimar_nlarx,'Enable','on')
    else
        set(handles.Editar_Estimador,'Enable','off')
        set(handles.Estimar_nlarx,'Enable','off')
        Cancelar_Editor_Estimador_Callback(hObject, eventdata, handles)
    end
    
function nb_Callback(hObject, eventdata, handles)
    if get(handles.Lista_Estimadores,'value')~=1&&isempty(str2num(get(handles.na,'string')))~=1&&isempty(str2num(get(handles.nb,'string')))~=1&&isempty(str2num(get(handles.nk,'string')))~=1
        set(handles.Editar_Estimador,'Enable','on')
        set(handles.Estimar_nlarx,'Enable','on')
    else
        set(handles.Editar_Estimador,'Enable','off')
        set(handles.Estimar_nlarx,'Enable','off')
        Cancelar_Editor_Estimador_Callback(hObject, eventdata, handles)
    end
    
function nk_Callback(hObject, eventdata, handles)
    if get(handles.Lista_Estimadores,'value')~=1&&isempty(str2num(get(handles.na,'string')))~=1&&isempty(str2num(get(handles.nb,'string')))~=1&&isempty(str2num(get(handles.nk,'string')))~=1
        set(handles.Editar_Estimador,'Enable','on')
        set(handles.Estimar_nlarx,'Enable','on')
    else
        set(handles.Editar_Estimador,'Enable','off')
        set(handles.Estimar_nlarx,'Enable','off')
        Cancelar_Editor_Estimador_Callback(hObject, eventdata, handles)
    end
    
function Editar_Estimador_Callback(hObject, eventdata, handles)  
    Cancelar_Editor_Estimador_Callback(hObject, eventdata, handles)
    Ocupado(handles)
    Estimador=get(handles.Lista_Estimadores,'value');
    if Estimador==2||Estimador==3||Estimador==4
        set(handles.Lista_Opciones_Regresores,'Enable','on');
        set(handles.Unidades_Estimadores,'Enable','on');
        set(handles.Legend_Unidades_estimador,'Enable','on');
        set(handles.Lista_Tipo_Regresores,'Enable','off');
        set(handles.n1,'Enable','off');
        set(handles.Legend_n1,'Enable','off');
        set(handles.n2,'Enable','off');
        set(handles.Legend_n2,'Enable','off');
        set(handles.Regresor1,'Enable','off');
        set(handles.Regresor2,'Enable','off');
        set(handles.Regresor3,'Enable','off');
        set(handles.Regresor4,'Enable','off');
        set(handles.Regresor5,'Enable','off');
        set(handles.Regresor_Manual,'Enable','off');
        set(handles.Cargar_Regresor,'Enable','off');
        
        na=str2num(get(handles.na,'string'));
        nb=str2num(get(handles.nb,'string'));
        nk=str2num(get(handles.nk,'string'));
        regresores_entrada=cell(nb,2);
        regresores_salida=cell(na,2);
        for cont=1:na
            regresores_salida(cont,1)={sprintf('y1(t-%g)',cont)};
            regresores_salida(cont,2)={true};
        end
        
        for cont=1:nb
            if nk==0 && cont==1
                regresores_entrada(cont,1)={'u1(t)'};
                regresores_entrada(cont,2)={true};
            else
                regresores_entrada(cont,1)={sprintf('u1(t-%g)',nk+cont-1)};
                regresores_entrada(cont,2)={true};
            end
        end
        set(handles.Tabla_Regresores,'Data',[regresores_salida;regresores_entrada]) 
        if get(handles.Lista_Estimadores,'value')==2||get(handles.Lista_Estimadores,'value')==3
            set(handles.On,'Enable','on','value',1)
            set(handles.Off,'Enable','on','value',0)
        end
        
        
    elseif Estimador==5   
        set(handles.Lista_Opciones_Regresores,'Enable','off');
        set(handles.Unidades_Estimadores,'Enable','off');
        set(handles.Legend_Unidades_estimador,'Enable','off');
        set(handles.Lista_Tipo_Regresores,'Enable','on');
        set(handles.n1,'Enable','off');
        set(handles.Legend_n1,'Enable','on');
        set(handles.n2,'Enable','off');
        set(handles.Legend_n2,'Enable','on');
        set(handles.Regresor1,'Enable','on');
        set(handles.Regresor2,'Enable','on');
        set(handles.Regresor3,'Enable','on');
        set(handles.Regresor4,'Enable','on');
        set(handles.Regresor5,'Enable','on');
        set(handles.Regresor_Manual,'Enable','off');
        set(handles.Cargar_Regresor,'Enable','off');
    end
    set(handles.Estimar_nlarx,'Enable','off')
    set(handles.Cancelar_Editor_Estimador,'Enable','on')
    set(handles.na,'Enable','inactive')
    set(handles.nb,'Enable','inactive')
    set(handles.nk,'Enable','inactive')
    set(handles.Lista_Estimadores,'Enable','inactive')
    set(handles.Finalizar_Edicion,'Enable','on')
    Desocupado(handles)
    
function Cancelar_Editor_Estimador_Callback(hObject, eventdata, handles)
    global estado_edicion
    estado_edicion=0;
    set(handles.na,'Enable','on')
    set(handles.nb,'Enable','on')
    set(handles.nk,'Enable','on')
    set(handles.On,'Enable','off','value',1)
    set(handles.Off,'Enable','off','value',0)
    set(handles.Lista_Estimadores,'Enable','on')
    set(handles.Editar_Estimador,'Enable','off')
    set(handles.Cancelar_Editor_Estimador,'Enable','off')
    set(handles.Tabla_Regresores,'Data',[])
    set(handles.Tabla_Regresores_Usuario,'Data',[])
    set(handles.Lista_Opciones_Regresores,'Enable','off','value',1);
    set(handles.Unidades_Estimadores,'Enable','off','string','');
    set(handles.Legend_Unidades_estimador,'Enable','off');
    set(handles.Lista_Tipo_Regresores,'Enable','off');
    set(handles.n1,'Enable','off','string','');
    set(handles.Legend_n1,'Enable','off');
    set(handles.n2,'Enable','off','string','');
    set(handles.Legend_n2,'Enable','off');
    set(handles.Regresor1,'Enable','off','value',0);
    set(handles.Regresor2,'Enable','off','value',0);
    set(handles.Regresor3,'Enable','off','value',0);
    set(handles.Regresor4,'Enable','off','value',0);
    set(handles.Regresor5,'Enable','off','value',0);
    set(handles.Regresor_Manual,'Enable','off','string','Ingresar Manualmente');
    set(handles.Cargar_Regresor,'Enable','off');
    set(handles.Estimar_nlarx,'Enable','off')
    set(handles.Finalizar_Edicion,'Enable','off')

% -------------------------Panel de cerrado--------------------------------
%----Este panel sirve para cerra la interfaz y volver a la gui principal---

function Cerrar_Callback(hObject, eventdata, handles)
    close(handles.figure1)

%------------------------Panel de Modelos Identificadas--------------------
%Este  panel  sirve  de  los  datos  deplegados  en  la  tabla  de  modelos 
%identificados seleccionar cuales modelos desean ser ploteados o  removidos 
%de la tabla. 

function Tabla_Modelos_Identificados_CellSelectionCallback(hObject, eventdata, handles)
    global copia
    copia=get(hObject,'Data');
    copia=copia(:,12);
function Tabla_Modelos_Identificados_CellEditCallback(hObject, eventdata, handles)
    global sistemas_no_lineales datos_id copia
    Ocupado(handles)
    estado_tabla_regresores=0;
    t=(0:datos_id.TS:(length(datos_id.y)-1)*datos_id.TS);
    datos_tabla_modelos=get(handles.Tabla_Modelos_Identificados,'Data');
    [m,~]=size(datos_tabla_modelos);
    for cont=m:-1:1                                                                                                                 %Se borran los sistemas señalados tanto de los datos de la tabla como de la variable sistemas_no_lineales.
        if datos_tabla_modelos{cont,9}
            datos_tabla_modelos(cont,:)=[];
            sistemas_no_lineales(:,cont+1)=[];
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
            if datos_tabla_modelos{cont,8}
                plot(handles.Respuestas_Modelos,t,sistemas_no_lineales{3,cont+1},sistemas_no_lineales{2,cont+1})
            end
        end
    else
        cla(handles.Respuestas_Modelos)
    end
    actual=datos_tabla_modelos(:,12);
    
    if isempty(copia)
        for cont=1:m
            if actual{cont}==true
            end
        end
    else    
        for cont=1:m
            if actual{cont}==true && copia{cont}==false
                estado_tabla_regresores=1;
                sys=sistemas_no_lineales{1,cont+1};
                if isa(sys,'idnlhw')
                    set(handles.Regresores_Modelos_Elegido,'ColumnName','Este sistema no tiene regresores')
                    return
                end
                if strcmp(datos_tabla_modelos{cont,3},'linear')~=1    
                    na=sys.na;
                    nb=sys.nb;
                    nk=sys.nk;
                    regresores_entrada=cell(nb,1);
                    regresores_salida=cell(na,1);
                    for cont1=1:na
                        regresores_salida(cont1,1)={sprintf('y1(t-%g)',cont1)};
                    end

                    for cont1=1:nb
                        if nk==0 && cont1==1
                            regresores_entrada(cont1,1)={'u1(t)'};
                        else
                            regresores_entrada(cont1,1)={sprintf('u1(t-%g)',nk+cont1-1)};
                        end
                    end
                    regresores_no_lineales=[regresores_salida;regresores_entrada];
                    Regresores=sys.NonlinearRegressors;

                    
                    tam=length(Regresores);
                    cont2=tam;
                    for cont1=na+nb:-1:1
                        if cont2>0
                            if Regresores(cont2)==cont1 
                                cont2=cont2-1;
                            else
                                regresores_no_lineales(cont1,:)=[];
                            end
                        else
                            regresores_no_lineales(cont1,:)=[];
                        end
                    end
                    set(handles.Regresores_Modelos_Elegido,'Data',regresores_no_lineales,'ColumnName','Regresores no lineales')
                else
                    set(handles.Regresores_Modelos_Elegido,'ColumnName','Regresores lineales definidos por usuario')
                end
            else
                datos_tabla_modelos(cont,12)={false};
            end
        end
    end
    if estado_tabla_regresores==0
        set(handles.Regresores_Modelos_Elegido,'ColumnName','','Data',[])
    end
    set(handles.Tabla_Modelos_Identificados,'Data',datos_tabla_modelos)
    Desocupado(handles)
           
%------------------------Panel Edicion de estimadores----------------------
%Este  panel contiene  otros cuatro  paneles dentro  de el, su proposito es
%editar segun  las necesidades  del usuario los regresores, dependiendo del
%tipo de  estimador se  habilitaran  algunos de  los paneles dentro de este
%mismo panel.

function Finalizar_Edicion_Callback(hObject, eventdata, handles)
global estado_edicion
    estado_edicion=1;
    Ocupado(handles)
    set(handles.na,'Enable','inactive')
    set(handles.nb,'Enable','inactive')
    set(handles.nk,'Enable','inactive')
    set(handles.On,'Enable','off')
    set(handles.Off,'Enable','off')
    set(handles.Lista_Estimadores,'Enable','inactive')
    set(handles.Editar_Estimador,'Enable','off')
    set(handles.Cancelar_Editor_Estimador,'Enable','off')
    set(handles.Tabla_Regresores,'ColumnEditable',[false,false])
    set(handles.Tabla_Regresores_Usuario,'ColumnEditable',[false,false])
    set(handles.Lista_Opciones_Regresores,'Enable','off');
    set(handles.Unidades_Estimadores,'Enable','off');
    set(handles.Legend_Unidades_estimador,'Enable','off');
    set(handles.Lista_Tipo_Regresores,'Enable','off');
    set(handles.n1,'Enable','off');
    set(handles.Legend_n1,'Enable','off');
    set(handles.n2,'Enable','off');
    set(handles.Legend_n2,'Enable','off');
    set(handles.Regresor1,'Enable','off');
    set(handles.Regresor2,'Enable','off');
    set(handles.Regresor3,'Enable','off');
    set(handles.Regresor4,'Enable','off');
    set(handles.Regresor5,'Enable','off');
    set(handles.Regresor_Manual,'Enable','off');
    set(handles.Cargar_Regresor,'Enable','off');
    set(handles.Estimar_nlarx,'Enable','off')
    set(handles.Finalizar_Edicion,'Enable','off')
    set(handles.Estimar_nlarx,'Enable','on')
    Desocupado(handles)
%---------------------------Panel Regresores-------------------------------
%En este  panel se permite  al usuario que  regresores nolineales se desean
%usar para  la identificacion  para los  estimadores  wavenet, sigmoidnet y
%treepartition.

function Lista_Opciones_Regresores_Callback(hObject, eventdata, handles)
    Ocupado(handles)
    regresores=get(handles.Tabla_Regresores,'Data');
    valor=get(hObject,'value');
    na=str2num(get(handles.na,'string'));
    nb=str2num(get(handles.nb,'string'));    
    est_sal=cell(na,1);
    est_ent=cell(nb,1);
    switch valor
        case 1
            for cont=1:na
                est_sal(cont,1)={true};
            end
            for cont=1:nb
                est_ent(cont,1)={true};
            end
            set(handles.Tabla_Regresores,'ColumnEditable',[false,false])            
        case 2
            for cont=1:na
                est_sal(cont,1)={false};
            end
            for cont=1:nb
                est_ent(cont,1)={true};
            end
            set(handles.Tabla_Regresores,'ColumnEditable',[false,false])            
        case 3

            for cont=1:na
                est_sal(cont,1)={true};
            end
            for cont=1:nb
                est_ent(cont,1)={false};
            end
            set(handles.Tabla_Regresores,'ColumnEditable',[false,false])
        case 4
            for cont=1:na
                est_sal(cont,1)={true};
            end
            for cont=1:nb
                est_ent(cont,1)={true};
            end
            set(handles.Tabla_Regresores,'ColumnEditable',[false,false])
        case 5
            est_sal=regresores(1:na,2);
            est_ent=regresores(na+1:na+nb,2);
            set(handles.Tabla_Regresores,'ColumnEditable',[false,true])
    end
    regresores(:,2)=[];
    set(handles.Tabla_Regresores,'Data',[regresores,[est_sal;est_ent]]);
    Desocupado(handles)
%----------------Panel Regresores definidos por usuario--------------------
%Este  panel tiene  la finalidad de editar los regresores para el estimador
%lineal.
 
function Panel_Regresores_Basicos_SelectionChangeFcn(hObject, eventdata, handles)   
    if  get(handles.Regresor1,'value')==1
        set(handles.n1,'Enable','on','string','')
        set(handles.n2,'Enable','off','string','')
        set(handles.Regresor_Manual,'Enable','off','string','Ingresar Manualmente');
        set(handles.Cargar_Regresor,'Enable','off')
    elseif get(handles.Regresor2,'value')==1
        set(handles.n1,'Enable','on','string','')
        set(handles.n2,'Enable','on','string','')
        set(handles.Regresor_Manual,'Enable','off','string','Ingresar Manualmente');
        set(handles.Cargar_Regresor,'Enable','off')
    elseif get(handles.Regresor3,'value')==1
        set(handles.n1,'Enable','on','string','')
        set(handles.n2,'Enable','off','string','')
        set(handles.Regresor_Manual,'Enable','off','string','Ingresar Manualmente');
        set(handles.Cargar_Regresor,'Enable','off')
    elseif get(handles.Regresor4,'value')==1
        set(handles.n1,'Enable','on','string','')
        set(handles.n2,'Enable','on','string','')
        set(handles.Regresor_Manual,'Enable','off','string','Ingresar Manualmente');
        set(handles.Cargar_Regresor,'Enable','off')
    elseif get(handles.Regresor5,'value')==1 
        set(handles.n1,'Enable','off','string','')
        set(handles.n2,'Enable','off','string','')
        set(handles.Regresor_Manual,'Enable','on','string','Ingresar Manualmente');
        set(handles.Cargar_Regresor,'Enable','on')
    end

function n1_Callback(hObject, eventdata, handles)
    if  get(handles.Regresor1,'value')==1
        if isempty(str2num(get(handles.n1,'string')))~=1
            set(handles.Cargar_Regresor,'Enable','on');
        else
            set(handles.Cargar_Regresor,'Enable','off');
        end
    elseif get(handles.Regresor2,'value')==1
        if isempty(str2num(get(handles.n1,'string')))~=1 && isempty(str2num(get(handles.n2,'string')))~=1
            set(handles.Cargar_Regresor,'Enable','on');
        else
            set(handles.Cargar_Regresor,'Enable','off');
        end
    elseif get(handles.Regresor3,'value')==1
        if isempty(str2num(get(handles.n1,'string')))~=1
            set(handles.Cargar_Regresor,'Enable','on');
        else
            set(handles.Cargar_Regresor,'Enable','off');
        end
    elseif get(handles.Regresor4,'value')==1
        if isempty(str2num(get(handles.n1,'string')))~=1 && isempty(str2num(get(handles.n2,'string')))~=1
            set(handles.Cargar_Regresor,'Enable','on');
        else
            set(handles.Cargar_Regresor,'Enable','off');
        end
    end

function Cargar_Regresor_Callback(hObject, eventdata, handles)
    Ocupado(handles)
    regresores=get(handles.Tabla_Regresores_Usuario,'Data');
    n1=str2num(get(handles.n1,'string'));
    n2=str2num(get(handles.n2,'string'));    
    if get(handles.Regresor1,'value')==1
        if get(handles.Lista_Tipo_Regresores,'value')==1
            variable='y1';
        else
            variable='u1';
        end
        regresores=[regresores;{sprintf('%s(t-%g)',variable,n1),false}];
    elseif get(handles.Regresor2,'value')==1
        if get(handles.Lista_Tipo_Regresores,'value')==1
            variable='y1';
        else
            variable='u1';
        end
        regresores=[regresores;{sprintf('%s(t-%g)^%g',variable,n1,n2),false}];        
    elseif get(handles.Regresor3,'value')==1
        if get(handles.Lista_Tipo_Regresores,'value')==1
            variable='y1';
        else
            variable='u1';
        end
        regresores=[regresores;{sprintf('tan(%s(t-%g))',variable,n1),false}];
    elseif get(handles.Regresor4,'value')==1
        regresores=[regresores;{sprintf('y1(t-%g)*u1(t-%g)',n1,n2),false}];
    elseif get(handles.Regresor5,'value')==1
        regresores=[regresores;{get(handles.Regresor_Manual,'string'),false}];
    end

    set(handles.Tabla_Regresores_Usuario,'Data',regresores)
    set(handles.n1,'Enable','off','string','')
    set(handles.n2,'Enable','off','string','')
    set(handles.Regresor_Manual,'Enable','off','string','Ingresar Manualmente');
    set(handles.Regresor1,'value',0)
    set(handles.Regresor2,'value',0)
    set(handles.Regresor3,'value',0)
    set(handles.Regresor4,'value',0)
    set(handles.Regresor5,'value',0)
    set(handles.Cargar_Regresor,'Enable','off')
    Desocupado(handles)
function Tabla_Regresores_Usuario_CellSelectionCallback(hObject, eventdata, handles)
function Tabla_Regresores_Usuario_CellEditCallback(hObject, eventdata, handles)
    regresores=get(handles.Tabla_Regresores_Usuario,'Data');
    [m,~]=size(regresores);
    for cont=m:-1:1
        if regresores{cont,2}
            regresores(cont,:)=[];
        end
    end
    set(handles.Tabla_Regresores_Usuario,'Data',regresores)
    
%----------------Panel Estimar modelos mediante nlhw-----------------------
%Este panel  tiene  como  propodito  identificar  el modelo que describe el
%sistema mediante el modelo Hammerstein-Wiener, esto se hace a traves de la
%funcion lnhw de matlab.

function Estimar_nlhw_Callback(hObject, eventdata, handles)
    global Estimadores datos_id sistemas_no_lineales
    Ocupado(handles)
    na=str2num(get(handles.na_hw,'string'));
    nb=str2num(get(handles.nb_hw,'string'));
    nk=str2num(get(handles.nk_hw,'string'));
    
    sys=nlhw(datos_id,[na,nb,nk],Estimadores{1},Estimadores{2});
    if isempty(Estimadores{1,1})~=1
        entrada=class(Estimadores{1,1});
        if strcmp(entrada,'char')
            entrada='unitgain';
        end
    else
        entrada='';
    end
    if isempty(Estimadores{2})~=1
        salida=class(Estimadores{2});
        if strcmp(salida,'char')
            salida='unitgain';
        end
    else
        salida='';
    end
    
    salida_sistema=sim(sys,datos_id.u);                                                                                             %Simulamos la respuesta del sistema ante la entrada de los datos de identificacion.    
    t=(0:datos_id.TS:(length(datos_id.y)-1)*datos_id.TS);
    
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
    sistemas_no_lineales=[sistemas_no_lineales,datos_sistema];                                                                                              %Se agrega el sistema a la variable sistemas donde se almacenan todos los sistemas identificados mediante la interfaz.       
   
    b{1,1}=c_l;
    b{1,2}='nlhw';
    b{1,3}=entrada;
    b{1,4}=salida;
    b{1,5}=na;
    b{1,6}=nb;
    b{1,7}=nk;
    b{1,8}=true;
    b{1,9}=false;
    b{1,10}=sys.EstimationInfo.FPE;
    b{1,11}=sys.EstimationInfo.LossFcn;                                                                                                  %B es un cell donde se guardan los parametros empleados para cada modelo, para ser luego desplegados en la Tabla de modelos. 
    b{1,12}=false;
    datos_tabla_modelos=get(handles.Tabla_Modelos_Identificados,'Data');                                                                          %Se toman de la tabla los datos de los modelos ya adquiridos, en caso de que no haya otro sistema b se convierte en los datos_tabla_modelos de otro modo se añade a los datos de los demas modelos.
    if isempty(datos_tabla_modelos) 
        datos_tabla_modelos=b;
    else
        datos_tabla_modelos=[datos_tabla_modelos;b];
    end
    set(handles.Tabla_Modelos_Identificados,'Data',datos_tabla_modelos)
    cla(handles.Respuestas_Modelos)                                                                                                 %Ploteamos la respuesta de los sistemas que hayan sido seleccionados por el usuario.
    plot(handles.Respuestas_Modelos,t,datos_id.y)
    if ishold(handles.Respuestas_Modelos)==0
        hold(handles.Respuestas_Modelos)
    end
    [m,~]=size(datos_tabla_modelos);
    for cont=1:m
        if datos_tabla_modelos{cont,8}
            plot(handles.Respuestas_Modelos,t,sistemas_no_lineales{3,cont+1},sistemas_no_lineales{2,cont+1})
        end
    end
    set(handles.na_hw,'string','')
    set(handles.nb_hw,'string','')
    set(handles.nk_hw,'string','')
    set(handles.Lista_Modelos_hw,'value',1)
    Desocupado(handles)
    
%-------------------Panel Orden y retraso de modelo------------------------
%----Este panel contiene los edits para fijar los valores de na,nb y nk.---
function na_hw_Callback(hObject, eventdata, handles)
    set(handles.Estimar_nlhw,'Enable','off')
    if get(hObject,'value')~=1&&isempty(str2num(get(handles.na_hw,'string')))~=1&&isempty(str2num(get(handles.nb_hw,'string')))~=1&&isempty(str2num(get(handles.nk_hw,'string')))~=1
        set(handles.Lista_Estimadores_hw,'Enable','on','value',1)  
        if get(hObject,'value')==2
            set(handles.Panel_Edicion_Estimadores_hw,'Title','Estimador de entrada');
            set(handles.Finalizar_Edicion_hw,'string','Continuar')
        elseif get(hObject,'value')==3
            set(handles.Panel_Edicion_Estimadores_hw,'Title','Estimador de entrada');
            set(handles.Finalizar_Edicion_hw,'string','Finalizar')
        elseif get(hObject,'value')==4
            set(handles.Panel_Edicion_Estimadores_hw,'Title','Estimador de salida');
            set(handles.Finalizar_Edicion_hw,'string','Finalizar')
        end
    else
         set(handles.Lista_Estimadores_hw,'Enable','off','value',1)
         set(handles.Finalizar_Edicion_hw,'string','')         
    end
    
function nb_hw_Callback(hObject, eventdata, handles)
    set(handles.Estimar_nlhw,'Enable','off')
    if get(hObject,'value')~=1&&isempty(str2num(get(handles.na_hw,'string')))~=1&&isempty(str2num(get(handles.nb_hw,'string')))~=1&&isempty(str2num(get(handles.nk_hw,'string')))~=1
        set(handles.Lista_Estimadores_hw,'Enable','on','value',1)  
        if get(hObject,'value')==2
            set(handles.Panel_Edicion_Estimadores_hw,'Title','Estimador de entrada');
            set(handles.Finalizar_Edicion_hw,'string','Continuar')
        elseif get(hObject,'value')==3
            set(handles.Panel_Edicion_Estimadores_hw,'Title','Estimador de entrada');
            set(handles.Finalizar_Edicion_hw,'string','Finalizar')
        elseif get(hObject,'value')==4
            set(handles.Panel_Edicion_Estimadores_hw,'Title','Estimador de salida');
            set(handles.Finalizar_Edicion_hw,'string','Finalizar')
        end
    else
         set(handles.Lista_Estimadores_hw,'Enable','off','value',1)
         set(handles.Finalizar_Edicion_hw,'string','')         
    end
    
function nk_hw_Callback(hObject, eventdata, handles)
    set(handles.Estimar_nlhw,'Enable','off')
    if get(hObject,'value')~=1&&isempty(str2num(get(handles.na_hw,'string')))~=1&&isempty(str2num(get(handles.nb_hw,'string')))~=1&&isempty(str2num(get(handles.nk_hw,'string')))~=1
        set(handles.Lista_Estimadores_hw,'Enable','on','value',1)  
        if get(hObject,'value')==2
            set(handles.Panel_Edicion_Estimadores_hw,'Title','Estimador de entrada');
            set(handles.Finalizar_Edicion_hw,'string','Continuar')
        elseif get(hObject,'value')==3
            set(handles.Panel_Edicion_Estimadores_hw,'Title','Estimador de entrada');
            set(handles.Finalizar_Edicion_hw,'string','Finalizar')
        elseif get(hObject,'value')==4
            set(handles.Panel_Edicion_Estimadores_hw,'Title','Estimador de salida');
            set(handles.Finalizar_Edicion_hw,'string','Finalizar')
        end
    else
         set(handles.Lista_Estimadores_hw,'Enable','off','value',1)
         set(handles.Finalizar_Edicion_hw,'string','')         
    end
    
%---------------------Panel Eleccion del modelo----------------------------
%El  panel  eleccion  del  modelo  da  opcion  a  tres  modelos diferentes,
%Hammerstein-Wiener, Hammerstein y Wiener; el primero presenta nolinealidad
%tanto a la entrada como a la salida, el segundo solo muestra no linealidad
%a la entrada y el tercero solo presenta no linealidad a la salida.  


function Lista_Modelos_hw_Callback(hObject, eventdata, handles)
    global estado
    estado=0;
    set(handles.Estimar_nlhw,'Enable','off')
    if get(hObject,'value')~=1&&isempty(str2num(get(handles.na_hw,'string')))~=1&&isempty(str2num(get(handles.nb_hw,'string')))~=1&&isempty(str2num(get(handles.nk_hw,'string')))~=1
        set(handles.Lista_Estimadores_hw,'Enable','on','value',1)  
        if get(hObject,'value')==2
            set(handles.Panel_Edicion_Estimadores_hw,'Title','Estimador de entrada');
            set(handles.Finalizar_Edicion_hw,'string','Continuar')
        elseif get(hObject,'value')==3
            set(handles.Panel_Edicion_Estimadores_hw,'Title','Estimador de entrada');
            set(handles.Finalizar_Edicion_hw,'string','Finalizar')
        elseif get(hObject,'value')==4
            set(handles.Panel_Edicion_Estimadores_hw,'Title','Estimador de salida');
            set(handles.Finalizar_Edicion_hw,'string','Finalizar')
        end
    else
         set(handles.Lista_Estimadores_hw,'Enable','off','value',1)
         set(handles.Finalizar_Edicion_hw,'string','')         
    end

%-----------------Panel de edicion de estimadores hw-----------------------
%En  este panel  se editan las configuraciones  de los  estimadores para la
%funcion nlhw.

function Lista_Estimadores_hw_Callback(hObject, eventdata, handles)

val=get(hObject,'value');
    if val==1
        set(handles.On_hw,'Enable','off','value',1)
        set(handles.Off_hw,'Enable','off','value',0)
        set(handles.Panel_Unidades_hw,'Title','')
        set(handles.Legend_Unidades_hw,'string','')
        set(handles.Unidades_hw,'Enable','off','string','')
        set(handles.Panel_Rango,'Title','')
        set(handles.Min_hw,'Enable','off','string','')
        set(handles.Max_hw,'Enable','off','string','')
        set(handles.Finalizar_Edicion_hw,'Enable','off')
    elseif val==2
        set(handles.On_hw,'Enable','off','value',0)
        set(handles.Off_hw,'Enable','off','value',0)
        set(handles.Panel_Unidades_hw,'Title','Unidades Estimador')
        set(handles.Legend_Unidades_hw,'string','Numero de Unidades')
        set(handles.Unidades_hw,'Enable','on','string','')
        set(handles.Panel_Rango,'Title','')
        set(handles.Min_hw,'Enable','off','string','')
        set(handles.Max_hw,'Enable','off','string','')
        set(handles.Finalizar_Edicion_hw,'Enable','off')
    elseif val==3
        set(handles.On_hw,'Enable','on','value',1)
        set(handles.Off_hw,'Enable','on','value',0)
        set(handles.Panel_Unidades_hw,'Title','Unidades Estimador')
        set(handles.Legend_Unidades_hw,'string','Numero de Unidades')
        set(handles.Unidades_hw,'Enable','on','string','')
        set(handles.Panel_Rango,'Title','')
        set(handles.Min_hw,'Enable','off','string','')
        set(handles.Max_hw,'Enable','off','string','')
        set(handles.Finalizar_Edicion_hw,'Enable','off')
    elseif val==4
        set(handles.On_hw,'Enable','on','value',1)
        set(handles.Off_hw,'Enable','on','value',0)
        set(handles.Panel_Unidades_hw,'Title','Unidades Estimador')
        set(handles.Legend_Unidades_hw,'string','Numero de Unidades')
        set(handles.Unidades_hw,'Enable','on','string','')
        set(handles.Panel_Rango,'Title','')
        set(handles.Min_hw,'Enable','off','string','')
        set(handles.Max_hw,'Enable','off','string','')
        set(handles.Finalizar_Edicion_hw,'Enable','off')
    elseif val==5
        set(handles.On_hw,'Enable','off','value',0)
        set(handles.Off_hw,'Enable','off','value',0)
        set(handles.Panel_Unidades_hw,'Title','')
        set(handles.Legend_Unidades_hw,'string','')
        set(handles.Unidades_hw,'Enable','off','string','')
        set(handles.Panel_Rango,'Title','Rango lineal')
        set(handles.Min_hw,'Enable','on','string','')
        set(handles.Max_hw,'Enable','on','string','')
        set(handles.Finalizar_Edicion_hw,'Enable','off')
    elseif val==6
        set(handles.On_hw,'Enable','off','value',0)
        set(handles.Off_hw,'Enable','off','value',0)
        set(handles.Panel_Unidades_hw,'Title','')
        set(handles.Legend_Unidades_hw,'string','')
        set(handles.Unidades_hw,'Enable','off','string','')
        set(handles.Panel_Rango,'Title','Rango muerto')
        set(handles.Min_hw,'Enable','on','string','')
        set(handles.Max_hw,'Enable','on','string','')
        set(handles.Finalizar_Edicion_hw,'Enable','off')
    elseif val==7
        set(handles.On_hw,'Enable','off','value',0)
        set(handles.Off_hw,'Enable','off','value',0)
        set(handles.Panel_Unidades_hw,'Title','Grado del Polinomio')
        set(handles.Legend_Unidades_hw,'string','Grado')
        set(handles.Unidades_hw,'Enable','on','string','')
        set(handles.Panel_Rango,'Title','')
        set(handles.Min_hw,'Enable','off','string','')
        set(handles.Max_hw,'Enable','off','string','')
        set(handles.Finalizar_Edicion_hw,'Enable','off')
    elseif val==8
        set(handles.On_hw,'Enable','off','value',0)
        set(handles.Off_hw,'Enable','off','value',0)
        set(handles.Panel_Unidades_hw,'Title','')
        set(handles.Legend_Unidades_hw,'string','')
        set(handles.Unidades_hw,'Enable','off','string','')
        set(handles.Panel_Rango,'Title','')
        set(handles.Min_hw,'Enable','off','string','')
        set(handles.Max_hw,'Enable','off','string','')
        set(handles.Finalizar_Edicion_hw,'Enable','on')
    end

    
%-------Habilitacion del boton de Finalizar Edicion de estimadores---------
function Unidades_hw_Callback(hObject, eventdata, handles)    
    if get(handles.Lista_Estimadores_hw,'value')==2||get(handles.Lista_Estimadores_hw,'value')==7
        if isempty(str2num(get(handles.Unidades_hw,'string')))~=1
            set(handles.Finalizar_Edicion_hw,'Enable','on')
        else
            set(handles.Finalizar_Edicion_hw,'Enable','off')
        end
    elseif get(handles.Lista_Estimadores_hw,'value')==3||get(handles.Lista_Estimadores_hw,'value')==4
        if get(handles.On_hw,'value')==1||get(handles.Off_hw,'value')==1
            if isempty(str2num(get(handles.Unidades_hw,'string')))~=1
                set(handles.Finalizar_Edicion_hw,'Enable','on')
            else
                set(handles.Finalizar_Edicion_hw,'Enable','off')        
            end
        end
    elseif get(handles.Lista_Estimadores_hw,'value')==5||get(handles.Lista_Estimadores_hw,'value')==6
        if isempty(str2num(get(handles.Min_hw,'string')))~=1&&isempty(str2num(get(handles.Max_hw,'string')))~=1
            set(handles.Finalizar_Edicion_hw,'Enable','on')
        else
            set(handles.Finalizar_Edicion_hw,'Enable','off')        
        end 
    else
        set(handles.Finalizar_Edicion_hw,'Enable','off')
    end

 function Min_hw_Callback(hObject, eventdata, handles)           
    if get(handles.Lista_Estimadores_hw,'value')==2||get(handles.Lista_Estimadores_hw,'value')==7
        if isempty(str2num(get(handles.Unidades_hw,'string')))~=1
            set(handles.Finalizar_Edicion_hw,'Enable','on')
        else
            set(handles.Finalizar_Edicion_hw,'Enable','off')
        end
    elseif get(handles.Lista_Estimadores_hw,'value')==3||get(handles.Lista_Estimadores_hw,'value')==4
        if get(handles.On_hw,'value')==1||get(handles.Off_hw,'value')==1
            if isempty(str2num(get(handles.Unidades_hw,'string')))~=1
                set(handles.Finalizar_Edicion_hw,'Enable','on')
            else
                set(handles.Finalizar_Edicion_hw,'Enable','off')        
            end
        end
    elseif get(handles.Lista_Estimadores_hw,'value')==5||get(handles.Lista_Estimadores_hw,'value')==6
        if isempty(str2num(get(handles.Min_hw,'string')))~=1&&isempty(str2num(get(handles.Max_hw,'string')))~=1
            set(handles.Finalizar_Edicion_hw,'Enable','on')
        else
            set(handles.Finalizar_Edicion_hw,'Enable','off')        
        end 
    else
        set(handles.Finalizar_Edicion_hw,'Enable','off')
    end

function Max_hw_Callback(hObject, eventdata, handles)
    if get(handles.Lista_Estimadores_hw,'value')==2||get(handles.Lista_Estimadores_hw,'value')==7
        if isempty(str2num(get(handles.Unidades_hw,'string')))~=1
            set(handles.Finalizar_Edicion_hw,'Enable','on')
        else
            set(handles.Finalizar_Edicion_hw,'Enable','off')
        end
    elseif get(handles.Lista_Estimadores_hw,'value')==3||get(handles.Lista_Estimadores_hw,'value')==4
        if get(handles.On_hw,'value')==1||get(handles.Off_hw,'value')==1
            if isempty(str2num(get(handles.Unidades_hw,'string')))~=1
                set(handles.Finalizar_Edicion_hw,'Enable','on')
            else
                set(handles.Finalizar_Edicion_hw,'Enable','off')        
            end
        end
    elseif get(handles.Lista_Estimadores_hw,'value')==5||get(handles.Lista_Estimadores_hw,'value')==6
        if isempty(str2num(get(handles.Min_hw,'string')))~=1&&isempty(str2num(get(handles.Max_hw,'string')))~=1
            set(handles.Finalizar_Edicion_hw,'Enable','on')
        else
            set(handles.Finalizar_Edicion_hw,'Enable','off')        
        end 
    else
        set(handles.Finalizar_Edicion_hw,'Enable','off')
    end
    
function Termino_Lineal_SelectionChangeFcn(hObject, eventdata, handles)
    if get(handles.Lista_Estimadores_hw,'value')==2||get(handles.Lista_Estimadores_hw,'value')==7
        if isempty(str2num(get(handles.Unidades_hw,'string')))~=1
            set(handles.Finalizar_Edicion_hw,'Enable','on')
        else
            set(handles.Finalizar_Edicion_hw,'Enable','off')
        end
    elseif get(handles.Lista_Estimadores_hw,'value')==3||get(handles.Lista_Estimadores_hw,'value')==4
        if get(handles.On_hw,'value')==1||get(handles.Off_hw,'value')==1
            if isempty(str2num(get(handles.Unidades_hw,'string')))~=1
                set(handles.Finalizar_Edicion_hw,'Enable','on')
            else
                set(handles.Finalizar_Edicion_hw,'Enable','off')        
            end
        end
    elseif get(handles.Lista_Estimadores_hw,'value')==5||get(handles.Lista_Estimadores_hw,'value')==6
        if isempty(str2num(get(handles.Min_hw,'string')))~=1&&isempty(str2num(get(handles.Max_hw,'string')))~=1
            set(handles.Finalizar_Edicion_hw,'Enable','on')
        else
            set(handles.Finalizar_Edicion_hw,'Enable','off')        
        end 
    else
        set(handles.Finalizar_Edicion_hw,'Enable','off')
    end
    
function Finalizar_Edicion_hw_Callback(hObject, eventdata, handles)
    global Estimadores estado
    
    Ocupado(handles)
    val=get(handles.Lista_Estimadores_hw,'value');    
    Unidades=str2num(get(handles.Unidades_hw,'string'));
    Min=str2num(get(handles.Min_hw,'string'));
    Max=str2num(get(handles.Max_hw,'string'));
    
    if get(handles.On_hw,'value')==1
        lin='on';
    else
        lin='off';
    end
    
    if val==2
        est=pwlinear('num',Unidades);
    elseif val==3
        est=sigmoidnet('num',Unidades,'LinearTerm',lin);
    elseif val==4
        est=wavenet('num',Unidades,'LinearTerm',lin);
    elseif val==5
        est=saturation('LinearInterval',[Min Max]);
    elseif val==6
         est=deadzone('ZeroInterval',[Min Max]);
    elseif val==7
         est=poly1d('Degree',Unidades);
    elseif val==8
        est='unitgain';
    end   
    
    if get(handles.Lista_Modelos_hw,'value')==2
        if estado==0
            Estimadores(1)={est};
            set(handles.Lista_Estimadores_hw,'value',1)
            Lista_Estimadores_hw_Callback(hObject, eventdata, handles)
            set(handles.Panel_Edicion_Estimadores_hw,'Title','Estimador de salida')
            set(hObject,'string','Finalizar')
            estado=1;
        else
            Estimadores(2)={est};
            set(handles.Lista_Estimadores_hw,'value',1,'Enable','off')
            Lista_Estimadores_hw_Callback(hObject, eventdata, handles)
            set(hObject,'string','')
            set(handles.Estimar_nlhw,'Enable','on')
            set(handles.Panel_Edicion_Estimadores_hw,'Title','')
        end
    elseif  get(handles.Lista_Modelos_hw,'value')==3
        Estimadores=[{est},{[]}];
        set(handles.Lista_Estimadores_hw,'value',1,'Enable','off')
        Lista_Estimadores_hw_Callback(hObject, eventdata, handles)
        set(hObject,'string','')
        set(handles.Estimar_nlhw,'Enable','on')
        set(handles.Panel_Edicion_Estimadores_hw,'Title','')
    elseif  get(handles.Lista_Modelos_hw,'value')==4
        Estimadores=[{[]},{est}];
        set(handles.Lista_Estimadores_hw,'value',1,'Enable','off')
        Lista_Estimadores_hw_Callback(hObject, eventdata, handles)
        set(hObject,'string','')
        set(handles.Estimar_nlhw,'Enable','on')
        set(handles.Panel_Edicion_Estimadores_hw,'Title','')
    end
    Desocupado(handles)
