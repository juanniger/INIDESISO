function varargout = Ident_1(varargin)
% IDENT_1 MATLAB code for Ident_1.fig
%      IDENT_1, by itself, creates a new IDENT_1 or raises the existing
%      singleton*.
%
%      H = IDENT_1 returns the handle to a new IDENT_1 or the handle to
%      the existing singleton*.
%
%      IDENT_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IDENT_1.M with the given input arguments.
%
%      IDENT_1('Property','Value',...) creates a new IDENT_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Ident_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Ident_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Ident_1

% Last Modified by GUIDE v2.5 13-Aug-2013 16:11:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Ident_1_OpeningFcn, ...
                   'gui_OutputFcn',  @Ident_1_OutputFcn, ...
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


% --- Executes just before Ident_1 is made visible.
function Ident_1_OpeningFcn(hObject, eventdata, handles, varargin)
global u y t datos

axes(handles.axes1)
plot(t,y);

axes(handles.axes2)
nombre='imagenes/primer orden';
[x,map]=imread(nombre,'jpg');
image(x)
axis off;

axes(handles.axes3)
nombre='imagenes/segundo orden sobreamortiguado';
[x,map]=imread(nombre,'jpg');
image(x)
axis off;

axes(handles.axes4)
nombre='imagenes/segundo orden subamortiguado';
[x,map]=imread(nombre,'jpg');
image(x)
axis off;

datos=iddata(y,u,t(2)-t(1));
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Ident_1 (see VARARGIN)

% Choose default command line output for Ident_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Ident_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Ident_1_OutputFcn(hObject, eventdata, handles) 
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
            set(handles.axes1,'Xlim',[x_1 x_2]);
        function menu_limitey_Callback(hObject, eventdata, handles)
            global y_1 y_2
            h=limite_y;
            uiwait(h);
            set(handles.axes1,'Ylim',[y_1 y_2]);
            
% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
    val=get(hObject,'value');
    if val==1
        axes(handles.axes1)
        hold on;
    else
        axes(handles.axes1)
        hold off;
    end
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
global datos sys
val1=get(handles.radiobutton1,'value');
val2=get(handles.radiobutton2,'value');
fun=get(handles.popupmenu1,'value');
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
[m n]=size(a2);
b=[];
for cont=1:n+8
    b=sprintf('%s-',b);
end
a=sprintf('(%s)*exp(-%gs)\n%s\n%s',a1,sys.InputDelay,b,a2);
set(handles.text2,'string',a);

% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uipanel2.
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)

val1=get(handles.radiobutton1,'value');
val2=get(handles.radiobutton2,'value');
a={'Metodo de la tangente';'Miller';'Nichols'};
b={'Metodo de dos puntos';'Alfaro';'Broida';'Chen y Yang';'Ho';'Smith';'Viteckova'};
if val1==1
    set(handles.popupmenu1,'string',a,'value',1)
elseif val2==1
    set(handles.popupmenu1,'string',b,'value',1)
else
    return
end
% hObject    handle to the selected object in uipanel2 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    global datos sys
    val=get(handles.popupmenu2,'value');
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
    
    val=get(handles.checkbox1,'value');
    if val==1
        axes(handles.axes1)
        hold on;
    else
        axes(handles.axes1)
        cla;
    end
    
    %axes(handles.axes1);
    u=datos.u;
    y=datos.y;
    t=[0:datos.Ts:(length(u)-1)*datos.Ts];
    ys=lsim(sys,u,t);
    plot(t,y,t,ys,col);
    
    
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in uipanel3.
function uipanel3_SelectionChangeFcn(hObject, eventdata, handles)
    
global datos sys
val1=get(handles.radiobutton3,'value');
val2=get(handles.radiobutton4,'value');
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
set(handles.text2,'string',a);
% hObject    handle to the selected object in uipanel3 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
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
set(handles.text2,'string',a);
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
    global datos sys
val1=get(hObject,'value');

if val1==1
    sys=metodo_oldenburg(datos);    
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
set(handles.text2,'string',a);
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8
