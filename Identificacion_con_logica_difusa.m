function varargout = Identificacion_con_logica_difusa(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Identificacion_con_logica_difusa_OpeningFcn, ...
                   'gui_OutputFcn',  @Identificacion_con_logica_difusa_OutputFcn, ...
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


%----------------------------Funcion de apertura---------------------------
%Esta funcion se ejecuta al inicializarse la interfaz grafica, por lo tanto
%las caracteristicas de inicio se fijan aqui.

function Identificacion_con_logica_difusa_OpeningFcn(hObject, eventdata, handles, varargin)
    global fis_iniciales anfis_fis
    fis_iniciales=[];
    anfis_fis=[];
    set(handles.Tabla_Estructuras,'Data',[])
    set(handles.Tabla_anfis,'Data',[])
    set(handles.Tabla_Canales,'Data',[])
    set(handles.Tabla_Reglas,'Data',[])
    set(handles.Gen1,'value',0)
    set(handles.Gen2,'value',0)
    set(handles.Gen3,'value',0)
    set(handles.Num_fm,'string','')
    set(handles.Legend_Num_funciones_membresia,'string','','Enable','off')
    set(handles.Lista_fm_in,'Enable','off','value',1)
    set(handles.Lista_fm_out,'Enable','off','value',1)
    set(handles.Crear_Estructura,'Enable','off')
    set(handles.Entrenar_Anfis,'Enable','off')
    set(handles.Legend_Indice_de_estructura,'Enable','off')
    set(handles.Num_Epoc,'string','','Enable','off')
    set(handles.Legend_Numero_de_epocas,'Enable','off')
    set(handles.Gen1,'Enable','off','value',0)
    set(handles.Gen2,'Enable','off','value',0)
    set(handles.Gen3,'Enable','off','value',0)
    set(handles.Agregar_Estructura,'Enable','on')
    set(handles.Num_fm,'Enable','off')
    set(handles.Index,'Enable','off')
    Desocupado(handles);
handles.output = hObject;
guidata(hObject, handles);

function varargout = Identificacion_con_logica_difusa_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

%---------------------------Funciones de creacion--------------------------
%----------------Le dan formato a los edist y popupmenus-------------------
function Lista_fm_in_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Lista_fm_out_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Num_fm_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Radio_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Radio_Callback(hObject, eventdata, handles)

function Index_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Lista_Colores_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Lista_Colores_Callback(hObject, eventdata, handles)

function Num_Epoc_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Num_Epoc_Callback(hObject, eventdata, handles)

%----------------------Panel de Estructuras de Sugeno----------------------
%En este panel se generan las  estructuras cuyas funciones  de membresia se
%emplean para entrenar los datos mediante la funcion anfis.

function Crear_Estructura_Callback(hObject, eventdata, handles)
    global fis_iniciales datos_id
    Ocupado(handles)
    pause(0.5)
    Num_fm=str2num(get(handles.Num_fm,'string'));
    val=get(handles.Lista_fm_in,'value');
    if val==1
        tipo_fm_in='gbellmf';
    elseif val==2
        tipo_fm_in='trimf';
    elseif val==3
        tipo_fm_in='trapmf';
    elseif val==4
        tipo_fm_in='gbellmf';
    elseif val==5
        tipo_fm_in='pimf';
   elseif val==6
        tipo_fm_in='psigmf';
    elseif val==7
        tipo_fm_in='dsigmf';
    elseif val==8
        tipo_fm_in='gaussmf';
    elseif val==9
        tipo_fm_in='gauss2mf';        
    end
    
    val=get(handles.Lista_fm_out,'value');
    if val==1
        tipo_fm_out='linear';
    elseif val==2
        tipo_fm_out='linear';
    elseif val==3
        tipo_fm_out='constant';
    end
    
    if get(handles.Gen1,'value')==1
        if isempty(Num_fm)|| Num_fm<2
            Num_fm=2;
        end
        inicial_fis=genfis1([datos_id.u,datos_id.y],Num_fm,tipo_fm_in,tipo_fm_out);
        tipo=inicial_fis.type;
        and_Method=inicial_fis.andMethod;
        orMethod=inicial_fis.orMethod;
        impMethod=inicial_fis.impMethod;
        aggMethod=inicial_fis. aggMethod;
        defuzzMethod=inicial_fis.defuzzMethod;
        Radio='';
        Clusters='';
    elseif get(handles.Gen2,'value')==1
        if isempty(Num_fm)
            h=errordlg('Debes ingresar manualmente un radio de influencia');
            uiwait(h)
            Desocupado(handles)
            return
        end
        inicial_fis=genfis2(datos_id.u,datos_id.y,Num_fm);
        tipo=inicial_fis.type;
        and_Method=inicial_fis.andMethod;
        orMethod=inicial_fis.orMethod;
        impMethod=inicial_fis.impMethod;
        aggMethod=inicial_fis. aggMethod;
        defuzzMethod=inicial_fis.defuzzMethod;
        tipo_fm_in='gaussmf';
        tipo_fm_out='linear';
        Radio=Num_fm;
        Num_fm='';
        Clusters='';
    elseif get(handles.Gen3,'value')==1
        if isempty(Num_fm)|| Num_fm<1
            Num_fm='auto';
        end
        inicial_fis=genfis3(datos_id.u,datos_id.y,'sugeno',Num_fm);
        tipo=inicial_fis.type;
        and_Method=inicial_fis.andMethod;
        orMethod=inicial_fis.orMethod;
        impMethod=inicial_fis.impMethod;
        aggMethod=inicial_fis. aggMethod;
        defuzzMethod=inicial_fis.defuzzMethod;
        tipo_fm_in='gaussmf';
        tipo_fm_out='linear';
        Clusters=Num_fm;
        Num_fm='';
        Radio='';
    end

    b{1,1}=tipo;
    b{1,2}=and_Method;
    b{1,3}=orMethod;
    b{1,4}=impMethod;
    b{1,5}=aggMethod;
    b{1,6}=defuzzMethod;
    b{1,7}=Num_fm;
    b{1,8}=Radio;
    b{1,9}=Clusters;
    b{1,10}=tipo_fm_in;
    b{1,11}=tipo_fm_out;
    b{1,12}=true;
    b{1,13}=false;
    
    Datos_tabla_estructura=get(handles.Tabla_Estructuras,'Data');
    [m,~]=size(Datos_tabla_estructura);
    for cont=1:m
        Datos_tabla_estructura{cont,12}=false;
    end
    datos_tabla_anfis=get(handles.Tabla_anfis,'Data');
    [m,~]=size(datos_tabla_anfis);
    for cont=1:m
        datos_tabla_anfis{cont,9}=false;
    end
    set(handles.Tabla_anfis,'Data',datos_tabla_anfis);
    
    set(handles.Tabla_Estructuras,'Data',[Datos_tabla_estructura;b])
    inicial_fis={inicial_fis;fmentrada(inicial_fis)};
    fms=inicial_fis{2,1};
    [~,n]=size(fms);
    entradas=[true(1);false(n-1,1)];
    set(handles.Tabla_Canales,'Data',entradas)
    y=fms{1,1};
    x=fms{2,1};
    nombres=fms{3,1};
    plot(handles.fm_entrada,x,y')
    legend(handles.fm_entrada,nombres)
    cla(handles.fm_salida)
    legend(handles.fm_salida,'off')
    ylabel(handles.fm_entrada,'Grado de membresia')
    xlabel(handles.fm_entrada,'Entrada')
    fis_iniciales=[fis_iniciales,{inicial_fis}];
    
    
    set(handles.Legend_Num_funciones_membresia,'string','','Enable','off')
    set(handles.Num_fm,'Enable','off','string','')
    set(handles.Lista_fm_in,'Enable','off','value',1)
    set(handles.Lista_fm_out,'Enable','off','value',1)
    set(handles.Crear_Estructura,'Enable','off')
    set(handles.Gen1,'value',0,'Enable','off')
    set(handles.Gen2,'value',0,'Enable','off')
    set(handles.Gen3,'value',0,'Enable','off')
    set(handles.Agregar_Estructura,'Enable','on')
    set(handles.Index,'Enable','on','string','')
    set(handles.Legend_Indice_de_estructura,'Enable','on')
    set(handles.Num_Epoc,'Enable','off','string','')
    set(handles.Entrenar_Anfis,'Enable','off')
    set(handles.Legend_Numero_de_epocas,'Enable','off')
    
    Desocupado(handles);
function Tabla_Estructuras_CellSelectionCallback(hObject, eventdata, handles)
    global datos
    datos=get(handles.Tabla_Estructuras,'Data');
    
    
function Tabla_Estructuras_CellEditCallback(hObject, eventdata, handles)
    global datos fis_iniciales
    estado=0;
    datos_tabla_estructuras=get(handles.Tabla_Estructuras,'Data');
    
    [m,~]=size(datos_tabla_estructuras);
    for cont=m:-1:1                                                                                                                 %Se borran los sistemas señalados tanto de los datos de la tabla como de la variable sistemas_no_lineales.
        if datos_tabla_estructuras{cont,13}
            for cont1=1:m
                if  datos_tabla_estructuras{cont,12}
                    if cont1==cont
                        cla(handles.fm_entrada)
                        legend(handles.fm_entrada,'off')
                        set(handles.Tabla_Canales,'Data',[])
                    end
                    if m==1
                        set(handles.Num_Epoc,'Enable','off','string','')
                        set(handles.Legend_Numero_de_epocas,'Enable','off')
                        set(handles.Entrenar_Anfis,'Enable','off')
                        set(handles.Legend_Indice_de_estructura,'Enable','off')
                        set(handles.Index,'Enable','off','string','')
                    end
                end
            end
            datos_tabla_estructuras(cont,:)=[];
            fis_iniciales(:,cont)=[];
            set(handles.Tabla_Estructuras,'Data',datos_tabla_estructuras)
            return
        end
    end
    
    metodos_copia=datos(:,2:5);
    metodos=datos_tabla_estructuras(:,2:5);
    [m,~]=size(metodos);
    for cont=1:m
        for cont1=1:4
            if strcmp(metodos(cont,cont1),metodos_copia(cont,cont1))~=1
                if cont1==1
                    fis_iniciales{cont}.andMethod=metodos{cont,cont1};
                    return
                elseif cont1==2
                    fis_iniciales{cont}.orMethod=metodos{cont,cont1};
                    return
                elseif cont1==3
                    fis_iniciales{cont}.impMethod=metodos{cont,cont1};
                    return
                elseif cont1==4
                    fis_iniciales{cont}.aggMethod=metodos{cont,cont1};
                    return
                end
            end
        end
    end
    
    
    copia=datos(:,12);
    [m,~]=size(datos_tabla_estructuras);
    actual=datos_tabla_estructuras(:,12);
    for cont=1:m
        if actual{cont}==true && copia{cont}==false
            [~,n]=size(fis_iniciales{cont}{2});
            entradas=[true(1);false(n-1,1)];
            set(handles.Tabla_Canales,'Data',entradas)
            y=fis_iniciales{cont}{2}{1};
            x=fis_iniciales{cont}{2}{2};
            nombre=fis_iniciales{cont}{2}{3};
            plot(handles.fm_entrada,x,y')
            legend(handles.fm_entrada,nombre)
            ylabel(handles.fm_entrada,'Grado de membresia')
            xlabel(handles.fm_entrada,'Entrada')
            cla(handles.fm_salida)
            legend(handles.fm_salida,'off')
        else
            datos_tabla_estructuras(cont,12)={false};
        end
    end
    datos_tabla_anfis=get(handles.Tabla_anfis,'Data');
    [m,~]=size(datos_tabla_anfis);
    for cont=1:m
        datos_tabla_anfis{cont,9}=false;
    end
    set(handles.Tabla_anfis,'Data',datos_tabla_anfis)
    set(handles.Tabla_Estructuras,'Data',datos_tabla_estructuras)
    
    comprobar=get(handles.Tabla_Estructuras,'Data');
    comprobar2=get(handles.Tabla_anfis,'Data');
    if isempty(comprobar)
        comprobar=[];
    else
        comprobar=comprobar(:,12);
    end
    if isempty(comprobar2)
        comprobar2=[];
    else
        comprobar2=comprobar2(:,9);
    end
    comprobar=[comprobar;comprobar2];
    m=length(comprobar);
    for cont=1:m
        if comprobar{cont}
            return
        else
            if cont==m
                cla(handles.fm_salida)
                cla(handles.fm_entrada)
                legend(handles.fm_salida,'off')
                legend(handles.fm_entrada,'off')
                set(handles.Tabla_Canales,'Data',[])
            end
        end
    end


function Entrenar_Anfis_Callback(hObject, eventdata, handles)
    global anfis_fis datos_id fis_iniciales datos_val
    [m,~]=size(get(handles.Tabla_Estructuras,'Data'));
    indice=str2num(get(handles.Index,'string'));
    
    if indice>m && indice<0
        set(handles.Num_Epoc,'Enable','off','string','')
        set(handles.Legend_Numero_de_epocas,'Enable','off')
        set(handles.Entrenar_Anfis,'Enable','off')
        return
    end
    Ocupado(handles)
    pause(0.5)
    datos_tabla=get(handles.Tabla_Estructuras,'Data');
    [m,~]=size(datos_tabla);
    index=str2num(get(handles.Index,'string'));
    num_epoc=str2num(get(handles.Num_Epoc,'string'));
    if m<index
        h=errordlg('El index que has elegido no corresponde a ninguna estructura');
        uiwait(h)
    else
        sys=anfis([datos_id.u,datos_id.y],fis_iniciales{index}{1},num_epoc,[0 0 0 0]);
    end
  
    fms_ent=fmentrada(sys);
    fms_sal=fmsalida(sys);
    
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
        
    salida=evalfis(datos_id.u,sys);
    datos_sistema={sys;col;salida;{fms_ent};{fms_sal}};                                                                                         %datos_sistema es uncell que contiene el sistema identificado, el color del ploteo y la respuesta del modelo a la entrada de identificacion.
    anfis_fis=[anfis_fis,datos_sistema];                                                                                              %Se agrega el sistema a la variable sistemas donde se almacenan todos los sistemas identificados mediante la interfaz.      
    datos_tabla_anfis=get(handles.Tabla_anfis,'Data');
    [m,~]=size(datos_tabla_anfis);
    
    for cont=1:m
        datos_tabla_anfis{cont,9}=false;
    end
    Datos_tabla_estructura=get(handles.Tabla_Estructuras,'Data');
    [m,~]=size(Datos_tabla_estructura);
    for cont=1:m
        Datos_tabla_estructura{cont,12}=false;
    end
    set(handles.Tabla_Estructuras,'Data',Datos_tabla_estructura);
    
    b{1,1}=c_l;
    b{1,2}=sys.andMethod;
    b{1,3}=sys.orMethod;
    b{1,4}=sys.impMethod;
    b{1,5}=sys.aggMethod;
    b{1,6}=sys.defuzzMethod;
    b{1,7}=sys.input(1).mf(1).type;
    b{1,8}=sys.output(1).mf(1).type;
    b{1,9}=true;
    b{1,10}=false;
    b{1,11}=true;
    
    datos_tabla_anfis=[datos_tabla_anfis;b];
    set(handles.Tabla_anfis,'Data',datos_tabla_anfis)
    
    [~,n]=size(fms_ent);
    entradas=[true(1);false(n-1,1)];
    set(handles.Tabla_Canales,'Data',entradas)
    
    y_ent=fms_ent{1,1};
    x_ent=fms_ent{2,1};
    nombre_ent=fms_ent{3,1};
    plot(handles.fm_entrada,x_ent,y_ent')
    legend(handles.fm_entrada,nombre_ent)
    ylabel(handles.fm_entrada,'Grado de membresia')
    xlabel(handles.fm_entrada,'Entrada')

    y_sal=fms_sal{1,1};
    x_sal=fms_sal{2,1};
    nombre_sal=fms_sal{3,1};    
    plot(handles.fm_salida,x_sal,y_sal')
    legend(handles.fm_salida,nombre_sal)
    ylabel(handles.fm_salida,'Grado de membresia')
    xlabel(handles.fm_salida,'Salida')
    
    reglas=obtener_reglas(sys);
    set(handles.Tabla_Reglas,'Data',reglas)
            
    t=(0:datos_id.TS:(length(datos_id.y)-1)*datos_id.TS);
    plot(handles.Respuestas_Modelos,t,datos_id.y)
    if ishold(handles.Respuestas_Modelos)==0
        hold(handles.Respuestas_Modelos)
    end
    [m,~]=size(datos_tabla_anfis);
    for cont=1:m
        if datos_tabla_anfis{cont,11}
            plot(handles.Respuestas_Modelos,t,anfis_fis{3,cont},anfis_fis{2,cont})
        end
    end
    Desocupado(handles)


function Cerrar_Callback(hObject, eventdata, handles)
    close(handles.figure1)

function Tabla_anfis_CellEditCallback(hObject, eventdata, handles)
 global datos2 anfis_fis datos_id
    estado=0;
    datos_tabla_anfis=get(handles.Tabla_anfis,'Data');
    
    [m,~]=size(datos_tabla_anfis);
    for cont=m:-1:1                                                                                                                 %Se borran los sistemas señalados tanto de los datos de la tabla como de la variable sistemas_no_lineales.
        if datos_tabla_anfis{cont,10}
            for cont1=1:m
                if  datos_tabla_anfis{cont,9}
                    if cont1==cont
                        cla(handles.fm_entrada)
                        legend(handles.fm_entrada,'off')
                        cla(handles.fm_salida)
                        legend(handles.fm_salida,'off')
                        set(handles.Tabla_Canales,'Data',[])
                    end
                end
            end
            datos_tabla_anfis(cont,:)=[];
            anfis_fis(:,cont)=[];
            set(handles.Tabla_anfis,'Data',datos_tabla_anfis)
            Tabla_anfis_CellEditCallback(hObject, eventdata, handles)
            return
        end
    end
    
    
    
    copia=datos2(:,9);
    [m,~]=size(datos_tabla_anfis);
    actual=datos_tabla_anfis(:,9);
    for cont=1:m
        if actual{cont}==true && copia{cont}==false
            estado=1;
            sys=anfis_fis{1,cont};
            reglas=obtener_reglas(sys);
            set(handles.Tabla_Reglas,'Data',reglas)
            [~,n]=size(anfis_fis{4,cont}{1});
            entradas=[true(1);false(n-1,1)];
            set(handles.Tabla_Canales,'Data',entradas)
            y=anfis_fis{4,cont}{1}{1};
            x=anfis_fis{4,cont}{1}{2};
            nombre=anfis_fis{4,cont}{1}{3};
            plot(handles.fm_entrada,x,y')
            legend(handles.fm_entrada,nombre)
            ylabel(handles.fm_entrada,'Grado de membresia')
            xlabel(handles.fm_entrada,'Entrada')
            y=anfis_fis{5,cont}{1}{1};
            x=anfis_fis{5,cont}{1}{2};
            nombre=anfis_fis{5,cont}{1}{3};
            plot(handles.fm_salida,x,y')
            legend(handles.fm_salida,nombre)
            ylabel(handles.fm_salida,'Grado de membresia')
            xlabel(handles.fm_salida,'Salida')
        else
            datos_tabla_anfis(cont,9)={false};
        end
    end
    datos_tabla_estructuras=get(handles.Tabla_Estructuras,'Data');
    if estado==1
        [m,~]=size(datos_tabla_estructuras);
        for cont=1:m
            datos_tabla_estructuras{cont,12}=false;
        end
        set(handles.Tabla_anfis,'Data',datos_tabla_anfis)
    end
    set(handles.Tabla_Estructuras,'Data',datos_tabla_estructuras)
    t=(0:datos_id.TS:(length(datos_id.y)-1)*datos_id.TS);
    cla(handles.Respuestas_Modelos)                                                                                                 %Ploteamos la respuesta de los sistemas que hayan sido seleccionados por el usuario.
    plot(handles.Respuestas_Modelos,t,datos_id.y)
    if ishold(handles.Respuestas_Modelos)==0
        hold(handles.Respuestas_Modelos)
    end

    [m,~]=size(datos_tabla_anfis);
    for cont=1:m
        if datos_tabla_anfis{cont,11}
            plot(handles.Respuestas_Modelos,t,anfis_fis{3,cont},anfis_fis{2,cont})
        end
    end

    comprobar=get(handles.Tabla_Estructuras,'Data');
    comprobar2=get(handles.Tabla_anfis,'Data');
    if isempty(comprobar)
        comprobar=[];
    else
        comprobar=comprobar(:,12);
    end
    if isempty(comprobar2)
        comprobar2=[];
    else
        comprobar2=comprobar2(:,9);
    end

    comprobar=[comprobar;comprobar2];
    m=length(comprobar);
    for cont=1:m
        if comprobar{cont}
            return
        else
            if cont==m
                cla(handles.fm_salida)
                cla(handles.fm_entrada)
                legend(handles.fm_salida,'off')
                legend(handles.fm_entrada,'off')
                set(handles.Tabla_Canales,'Data',[])
                set(handles.Tabla_Reglas,'Data',[])
            end
        end
    end
    

function Tabla_anfis_CellSelectionCallback(hObject, eventdata, handles)
    global datos2
    datos2=get(handles.Tabla_anfis,'Data');

function Tabla_Canales_CellEditCallback(hObject, eventdata, handles)
    global datos3 anfis_fis fis_iniciales
    index=0;
    datos_canales=get(handles.Tabla_Canales,'Data');
    tam=length(datos_canales);
    for cont=1:tam
        if datos_canales(cont)==true && datos3(cont)==false
            index=cont;
        else
            datos_canales(cont)=false;
        end
    end
    set(handles.Tabla_Canales,'Data',datos_canales)
    
    Est=get(handles.Tabla_Estructuras,'Data');
    Anf=get(handles.Tabla_anfis,'Data');
    
    
    if isempty(Est)~=1
        Est=Est(:,12);
    end
    if isempty(Anf)~=1
        Anf=Anf(:,9);
    end
    
    m=length(Est);
    n=length(Anf);
    
    if index~=0
        for cont=1:m
            if Est{m}
                x=fis_iniciales{cont}{2}{2,index};
                y=fis_iniciales{cont}{2}{1,index};
                nombres=fis_iniciales{cont}{2}{3,index};
            end
        end
       for cont=1:n
            if Anf{n}
                x=anfis_fis{4,cont}{1}{2,index};
                y=anfis_fis{4,cont}{1}{1,index};
                nombres=anfis_fis{4,cont}{1}{3,index};
            end
       end    
        plot(handles.fm_entrada,x,y')
        legend(handles.fm_entrada,nombres)
        ylabel(handles.fm_entrada,'Grado de membresia')
        xlabel(handles.fm_entrada,'Entrada')
    else
        cla(handles.fm_entrada)
        legend(handles.fm_entrada,'off')
    end

function Tabla_Canales_CellSelectionCallback(hObject, eventdata, handles)
    global datos3
    datos3=get(handles.Tabla_Canales,'Data');

function Panel_Estructuras_Sugeno_SelectionChangeFcn(hObject, eventdata, handles)

    val1=get(handles.Gen1,'value');
    val2=get(handles.Gen2,'value');
    val3=get(handles.Gen3,'value');

    if val1==1
        set(handles.Legend_Num_funciones_membresia,'string','Num de Funciones de Membresia','Enable','on')
        set(handles.Num_fm,'Enable','on')
        set(handles.Lista_fm_in,'Enable','on','value',1)
        set(handles.Lista_fm_out,'Enable','on','value',1)
        set(handles.Crear_Estructura,'Enable','on')
    elseif val2==1
        set(handles.Legend_Num_funciones_membresia,'string','Radio del cluster','Enable','on')
        set(handles.Num_fm,'Enable','on')
        set(handles.Lista_fm_in,'Enable','off','value',1)
        set(handles.Lista_fm_out,'Enable','off','value',1)
        set(handles.Crear_Estructura,'Enable','on')
    elseif val3==1
        set(handles.Legend_Num_funciones_membresia,'string','Num de clusters','Enable','on')
        set(handles.Num_fm,'Enable','on')
        set(handles.Lista_fm_in,'Enable','off','value',1)
        set(handles.Lista_fm_out,'Enable','off','value',1)
        set(handles.Crear_Estructura,'Enable','on')
    end
function Lista_fm_in_Callback(hObject, eventdata, handles)
function Lista_fm_out_Callback(hObject, eventdata, handles)
function Num_fm_Callback(hObject, eventdata, handles)

function Agregar_Estructura_Callback(hObject, eventdata, handles)
    set(handles.Gen1,'Enable','on','value',0)
    set(handles.Gen2,'Enable','on','value',0)
    set(handles.Gen3,'Enable','on','value',0)
    set(handles.Agregar_Estructura,'Enable','off')
    
function Index_Callback(hObject, eventdata, handles)
    [m,~]=size(get(handles.Tabla_Estructuras,'Data'));
    indice=str2num(get(handles.Index,'string'));
    
    if indice<=m && indice>0
        set(handles.Num_Epoc,'Enable','on','string','')
        set(handles.Legend_Numero_de_epocas,'Enable','on')
        set(handles.Entrenar_Anfis,'Enable','on')
    else
        set(handles.Num_Epoc,'Enable','off','string','')
        set(handles.Legend_Numero_de_epocas,'Enable','off')
        set(handles.Entrenar_Anfis,'Enable','off')
    end
