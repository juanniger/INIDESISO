function varargout = Identificacion_Respuesta_Al_Escalon(varargin)
% IDENTIFICACION_RESPUESTA_AL_ESCALON MATLAB code for Identificacion_Respuesta_Al_Escalon.fig
%      IDENTIFICACION_RESPUESTA_AL_ESCALON, by itself, creates a new IDENTIFICACION_RESPUESTA_AL_ESCALON or raises the existing
%      singleton*.
%
%      H = IDENTIFICACION_RESPUESTA_AL_ESCALON returns the handle to a new IDENTIFICACION_RESPUESTA_AL_ESCALON or the handle to
%      the existing singleton*.
%
%      IDENTIFICACION_RESPUESTA_AL_ESCALON('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IDENTIFICACION_RESPUESTA_AL_ESCALON.M with the given input arguments.
%
%      IDENTIFICACION_RESPUESTA_AL_ESCALON('Property','Value',...) creates a new IDENTIFICACION_RESPUESTA_AL_ESCALON or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Identificacion_Respuesta_Al_Escalon_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Identificacion_Respuesta_Al_Escalon_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Identificacion_Respuesta_Al_Escalon

% Last Modified by GUIDE v2.5 03-Aug-2014 18:55:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Identificacion_Respuesta_Al_Escalon_OpeningFcn, ...
                   'gui_OutputFcn',  @Identificacion_Respuesta_Al_Escalon_OutputFcn, ...
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


% --- Executes just before Identificacion_Respuesta_Al_Escalon is made visible.
function Identificacion_Respuesta_Al_Escalon_OpeningFcn(hObject, eventdata, handles, varargin)
global u y t datos

cla(handles.Indicador_Ocupado)
axis(handles.Indicador_Ocupado,'off')
axes(handles.Respuestas)
plot(t,y);

axes(handles.Figura_Primer_Orden)
nombre='imagenes/primer orden';
[x,map]=imread(nombre,'jpg');
image(x)
axis off;

axes(handles.Figure_Segundo_Orden_Sobreamortiguado)
nombre='imagenes/segundo orden sobreamortiguado';
[x,map]=imread(nombre,'jpg');
image(x)
axis off;

axes(handles.Figura_Segundo_Orden_Subamortiguado)
nombre='imagenes/segundo orden subamortiguado';
[x,map]=imread(nombre,'jpg');
image(x)
axis off;

        set(handles.Metodo_Tangente,'Enable','off','value',0)
        set(handles.Metodo_2_Puntos,'Enable','off','value',0)
        set(handles.Lista_Modelos,'Enable','off')
        set(handles.Metodo_Olden,'Enable','off')
        set(handles.Metodo_1,'Enable','off','value',0)
        set(handles.Metodo_2,'Enable','off','value',0)
datos=iddata(y,u,t(2)-t(1));
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Identificacion_Respuesta_Al_Escalon (see VARARGIN)

% Choose default command line output for Identificacion_Respuesta_Al_Escalon
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Identificacion_Respuesta_Al_Escalon wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Identificacion_Respuesta_Al_Escalon_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function menu_limites_Callback(hObject, eventdata, handles)
    function Menu_limites1_Callback(hObject, eventdata, handles)
        function menu_limitex_Callback(hObject, eventdata, handles)
            global x_1 x_2
            h=limite_;
            uiwait(h);
            set(handles.Respuestas,'Xlim',[x_1 x_2]);
        function menu_limitey_Callback(hObject, eventdata, handles)
            global y_1 y_2
            h=limite_y;
            uiwait(h);
            set(handles.Respuestas,'Ylim',[y_1 y_2]);
            
% --- Executes on button press in Mantener.
function Mantener_Callback(hObject, eventdata, handles)
    val=get(hObject,'value');
    if val==1
        axes(handles.Respuestas)
        hold on;
    else
        axes(handles.Respuestas)
        hold off;
    end
% hObject    handle to Mantener (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Mantener


% --- Executes on selection change in Lista_Modelos.
function Lista_Modelos_Callback(hObject, eventdata, handles)
global datos sys
Ocupado(handles)
val1=get(handles.Metodo_Tangente,'value');
val2=get(handles.Metodo_2_Puntos,'value');
fun=get(handles.Lista_Modelos,'value');
if val1==1
    switch fun
        case 2
          sys=metodo_tangente(datos,'miller');
        case 3
            sys=metodo_tangente(datos,'nichols');
    end
        
elseif val2==1
    switch fun
        case 2
            sys=metodo_dospuntos(datos,'Alfaro');
        case 3
            sys=metodo_dospuntos(datos,'Broida');
        case 4
            sys=metodo_dospuntos(datos,'Chen y Yang');
        case 5
            sys=metodo_dospuntos(datos,'Ho');
        case 6
            sys=metodo_dospuntos(datos,'Viteckova');
    end
else
    return
end

a1=poly2str(sys.num{1,1},'s');
a2=poly2str(sys.den{1,1},'s');
[~,n]=size(a2);
b=[];
for cont=1:n+8
    b=sprintf('%s-',b);
end
a=sprintf('(%s)*exp(-%gs)\n%s\n%s',a1,sys.InputDelay,b,a2);
set(handles.Funcion_Transferencia,'string',a);
Desocupado(handles)
% hObject    handle to Lista_Modelos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Lista_Modelos contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Lista_Modelos


% --- Executes during object creation, after setting all properties.
function Lista_Modelos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Lista_Modelos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uipanel2.
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)

val1=get(handles.Metodo_Tangente,'value');
val2=get(handles.Metodo_2_Puntos,'value');
a={'Metodo de la tangente';'Miller';'Nichols'};
b={'Metodo de dos puntos';'Alfaro';'Broida';'Chen y Yang';'Ho';'Smith';'Viteckova'};
if val1==1
    set(handles.Lista_Modelos,'string',a,'value',1)
elseif val2==1
    set(handles.Lista_Modelos,'string',b,'value',1)
else
    return
end

if val1==1||val2==1
    set(handles.Lista_Modelos,'Enable','on')
end
% hObject    handle to the selected object in uipanel2 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------


% --- Executes on selection change in Lista_Colores.
function Lista_Colores_Callback(hObject, eventdata, handles)
% hObject    handle to Lista_Colores (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Lista_Colores contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Lista_Colores


% --- Executes during object creation, after setting all properties.
function Lista_Colores_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Lista_Colores (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Plotear.
function Plotear_Callback(hObject, eventdata, handles)
    global datos sys
    val=get(handles.Lista_Colores,'value');
    switch val
        case 1
            col='b';
        case 2
            col='b';
        case 3
            col='g';
        case 4
            col='r';
        case 5
            col='c';
        case 6
            col='m';
        case 7
            col='y';
        case 8
            col='k';
    end
    
    val=get(handles.Mantener,'value');
    if val==1
        axes(handles.Respuestas)
        hold on;
    else
        axes(handles.Respuestas)
        cla;
    end
    
    %axes(handles.Respuestas);
    u=datos.u;
    y=datos.y;
    t=[0:datos.Ts:(length(u)-1)*datos.Ts];
    ys=lsim(sys,u,t);
    plot(t,y,t,ys,col);
    
    
% hObject    handle to Plotear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in uipanel3.
function uipanel3_SelectionChangeFcn(hObject, eventdata, handles)
    
global datos sys
Ocupado(handles)
val1=get(handles.Metodo_1,'value');
val2=get(handles.Metodo_2,'value');
if val1==1
    sys=oscilante05(datos);    
elseif val2==1
    sys=maxsobreimpulso(datos);
else
    return
end

a1=poly2str(sys.num{1,1},'s');
a2=poly2str(sys.den{1,1},'s');
[m n]=size(a2);
b=[];
for cont=1:n+8
    b=sprintf('%s-',b);
end
a=sprintf('(%s)*exp(-%gs)\n%s\n%s',a1,sys.InputDelay,b,a2);
set(handles.Funcion_Transferencia,'string',a);
Desocupado(handles)
% hObject    handle to the selected object in uipanel3 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Eliminar_Retardo.
function Eliminar_Retardo_Callback(hObject, eventdata, handles)
    global sys
    sys.InputDelay=0;
    a1=poly2str(sys.num{1,1},'s');
a2=poly2str(sys.den{1,1},'s');
[m n]=size(a2);
b=[];
for cont=1:n+8
    b=sprintf('%s-',b);
end
a=sprintf('(%s)*exp(-%gs)\n%s\n%s',a1,sys.InputDelay,b,a2);
set(handles.Funcion_Transferencia,'string',a);
% hObject    handle to Eliminar_Retardo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Metodo_Olden.
function Metodo_Olden_Callback(hObject, eventdata, handles)
    global datos sys
Ocupado(handles)
    val1=get(hObject,'value');

if val1==1
    sys=metodo_oldenburg(datos);    
else
    return
end
a1=poly2str(sys.num{1,1},'s');
a2=poly2str(sys.den{1,1},'s');
[~,n]=size(a2);
b=[];
for cont=1:n+8
    b=sprintf('%s-',b);
end
a=sprintf('(%s)*exp(-%gs)\n%s\n%s',a1,sys.InputDelay,b,a2);
set(handles.Funcion_Transferencia,'string',a);
Desocupado(handles)
% hObject    handle to Metodo_Olden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Metodo_Olden


% --- Executes when selected object is changed in Panel_Opciones.
function Panel_Opciones_SelectionChangeFcn(hObject, eventdata, handles)
    val1=get(handles.Primer_Orden,'value');
    val2=get(handles.Segundo_Orden_Sobre,'value');
    val3=get(handles.Segundo_Orden_Sub,'value');

    if val1==1
        set(handles.Metodo_Tangente,'Enable','on','value',0)
        set(handles.Metodo_2_Puntos,'Enable','on','value',0)
        set(handles.Lista_Modelos,'Enable','off')
        
        set(handles.Metodo_Olden,'Enable','off')
        
        set(handles.Metodo_1,'Enable','off','value',0)
        set(handles.Metodo_2,'Enable','off','value',0)
    elseif val2==1
         set(handles.Metodo_Tangente,'Enable','off','value',0)
        set(handles.Metodo_2_Puntos,'Enable','off','value',0)
        set(handles.Lista_Modelos,'Enable','off')
        
        set(handles.Metodo_Olden,'Enable','on')
        
        set(handles.Metodo_1,'Enable','off','value',0)
        set(handles.Metodo_2,'Enable','off','value',0) 
    else
        set(handles.Metodo_Tangente,'Enable','off','value',0)
        set(handles.Metodo_2_Puntos,'Enable','off','value',0)
        set(handles.Lista_Modelos,'Enable','off')
        
        set(handles.Metodo_Olden,'Enable','off')
        
        set(handles.Metodo_1,'Enable','on','value',0)
        set(handles.Metodo_2,'Enable','on','value',0)
    end
% hObject    handle to the selected object in Panel_Opciones 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Cerrar.
function Cerrar_Callback(hObject, eventdata, handles)
    close(handles.figure1)
% hObject    handle to Cerrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
