function varargout = validar(varargin)
% VALIDAR M-file for validar.fig
%      VALIDAR, by itself, creates a new VALIDAR or raises the existing
%      singleton*.
%
%      H = VALIDAR returns the handle to a new VALIDAR or the handle to
%      the existing singleton*.
%
%      VALIDAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VALIDAR.M with the given input arguments.
%
%      VALIDAR('Property','Value',...) creates a new VALIDAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before validar_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to validar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help validar

% Last Modified by GUIDE v2.5 26-Jun-2014 16:12:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @validar_OpeningFcn, ...
                   'gui_OutputFcn',  @validar_OutputFcn, ...
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


% --- Executes just before validar is made visible.
function validar_OpeningFcn(hObject, eventdata, handles, varargin)
global  sys discreto continuo ft
if discreto==1
    [A,B,C,D,F] = polydata(sys);
    num1=B;
    den1=conv(A,F);
    set(handles.num1,'string',poly2str(num1,'z'));
    set(handles.den1,'string',poly2str(den1,'z'));
    set(handles.edit2,'string',num2str(sys.Ts),'Enable','Inactive');
    set(handles.popupmenu4,'Enable','Inactive');
elseif continuo==1
    [num1,den1]=tfdata(ft);
    set(handles.num1,'string',poly2str(num1{1},'s'));
    set(handles.den1,'string',poly2str(den1{1},'s'));
else
    return
end
axes(handles.axes10)
axis off
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to validar (see VARARGIN)

% Choose default command line output for validar
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes validar wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = validar_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%Imprime la señal de entrada en la gui
    global t u;

    axes(handles.axes1)
    m_in=min(u);
    m_ax=max(u);
    incr=(m_ax-m_in)/10;
    plot(t,u);
    title('entrada');    

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in senal_prueba.
function senal_prueba_Callback(hObject, eventdata, handles)
    %Crea la señal de prueba
    clear global t u;
    global t;
    val=get(hObject,'value');
   t_simulacion=str2double(get(handles.edit1,'string'));
    if isnan(t_simulacion)==1
        t_simulacion=10;
    end 
    t_muestreo=str2double(get(handles.edit1,'string'));
    if isnan(t_muestreo)==1
        t_muestreo=0.01;
    end   
    t_muestreo=unidades2(handles);
    t_simulacion=unidades1(handles);
    t=0:t_muestreo:t_simulacion;
  
    switch val
         case 2
            Senoidal           
        case 3
            Triangular            
        case 4
            Cuadrada
        case 5
            Rampa
        case 6
            Impulso
        case 7
            Escalon
        case 8
            senal_definida_usuario 
    end
% hObject    handle to senal_prueba (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns senal_prueba contents as cell array
%        contents{get(hObject,'Value')} returns selected item from senal_prueba


% --- Executes during object creation, after setting all properties.
function senal_prueba_CreateFcn(hObject, eventdata, handles)
% hObject    handle to senal_prueba (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in simular.
function simular_Callback(hObject, eventdata, handles)
global t u discreto continuo sys ft Num Den
ocupado1(handles)
ft_mod=tf(Num,Den);
if discreto==1
    [A,B,C,D,F] = polydata(sys);
    num1=B;
    den1=conv(A,F);
    funcion=tf(num1,den1,sys.Ts,'variable','z^-1');
elseif continuo==1
   funcion=ft;
else
    return
end    

    salida1=lsim(funcion,u,t);
    salida2=lsim(ft_mod,u,t);
    plot(handles.axes2,t,salida1,'b',t,salida2,'r');
    title('respuesta');
    legend(handles.axes2,'Identificacion','Modelado');
    desocupado1(handles)


% --- Executes on button press in cerrar.
function cerrar_Callback(hObject, eventdata, handles)
global discreto continuo
discreto=0;
continuo=0;
close(handles.figure1);

% hObject    handle to cerrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
clear global Num Den;
set(handles.text22,'string','');
set(handles.text23,'string','');
 % Carga la imagen del sistema elegido en la gui
    fun=get(hObject,'value');
    nombre=get(hObject,'string');
    if(fun==1||fun==9)
         axes(handles.axes1);
         cla;
    else
        nombre=char(strcat('imagenes/',(strcat(nombre(fun),'.jpg'))));
        [x,~]=imread(nombre,'jpg');
        axes(handles.axes4)
        image(x)
        axis off;
    end
    %Abre las gui's de inicializacion de parametros de los modelos
    switch fun
        case 2
            bola_y_barramodelo
        case 3
            circuito_RLCmodelo
        case 4
            control_cruceromodelo
        case 5
            pendulo_invertidomodelo
        case 6
            masa_resorte_amortiguadormodelo
        case 7 
            posicion_motor_CDmodelo
        case 8
            velocidad_motor_CDmodelo
        case 9
            Definido_x_usuariomodelo
    end
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
    fun=get(handles.popupmenu5,'value');
    if fun==1
        errordlg('No has elegido un modelo',' Error ');   
        return;
    end
    global Num Den m j r d l R L C b M I k;
    switch fun
          case 2
            g=9.8;
            Num=m*d*g;
            Den=(l*j/r^2+m)*[1 0 0];
        case 3
            Num=[1 0];
            Den=[L R 1/C]; 
        case 4
            Num=1;
            Den=[m b];
        case 5
            g=9.8;
            q=(M+m)*(I+m*l^2)-(m*l)^2;
            Num=1/q*[I+m*l^2 0 -g*m*l];
            Den=[1 b*(I+m*l^2)/q -(M+m)*m*g*l/q -b*m*g*l/q 0];
        case 6
            Num=1;
            Den=[m b k];
        case 7
            Num=k;
            Den=conv([1 0],[conv([j b],[l r])+[0 0 k^2]]);
        case 8
            Num=k;
            Den=conv([j b],[l r])+[0 0 k^2];
        case 9
     
    end
    set(handles.text23,'string',poly2str(Num,'s'));
    set(handles.text22,'string',poly2str(Den,'s'));
    set(handles.popupmenu5,'Enable','off');
    set(hObject,'Enable','off');
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
clear global Den Num u;
set(handles.text22,'string','');
set(handles.text23,'string','');
set(handles.popupmenu5,'value',1,'Enable','on');
set(handles.pushbutton5,'Enable','on');
cla(handles.axes4)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
