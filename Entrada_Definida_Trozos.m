function varargout = Entrada_Definida_Trozos(varargin)
% ENTRADA_DEFINIDA_TROZOS MATLAB code for Entrada_Definida_Trozos.fig
%      ENTRADA_DEFINIDA_TROZOS, by itself, creates a new ENTRADA_DEFINIDA_TROZOS or raises the existing
%      singleton*.
%
%      H = ENTRADA_DEFINIDA_TROZOS returns the handle to a new ENTRADA_DEFINIDA_TROZOS or the handle to
%      the existing singleton*.
%
%      ENTRADA_DEFINIDA_TROZOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENTRADA_DEFINIDA_TROZOS.M with the given input arguments.
%
%      ENTRADA_DEFINIDA_TROZOS('Property','Value',...) creates a new ENTRADA_DEFINIDA_TROZOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Entrada_Definida_Trozos_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Entrada_Definida_Trozos_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Entrada_Definida_Trozos

% Last Modified by GUIDE v2.5 22-Jul-2013 14:31:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Entrada_Definida_Trozos_OpeningFcn, ...
                   'gui_OutputFcn',  @Entrada_Definida_Trozos_OutputFcn, ...
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


% --- Executes just before Entrada_Definida_Trozos is made visible.
function Entrada_Definida_Trozos_OpeningFcn(hObject, eventdata, handles, varargin)
global a
cont=a{1,1};
t_inicial=a{3,cont};
valor_inicial=a{4,cont};
nombre=strcat('Intervalo ',num2str(cont));
set(handles.text1,'string',nombre);
set(handles.edit3,'string',num2str(t_inicial),'Enable','off');
set(handles.edit4,'string',num2str(valor_inicial));
set(handles.popupmenu4,'value',1);

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Entrada_Definida_Trozos (see VARARGIN)

% Choose default command line output for Entrada_Definida_Trozos
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Entrada_Definida_Trozos wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Entrada_Definida_Trozos_OutputFcn(hObject, eventdata, handles) 
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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
global a
val=get(hObject,'value');
cont=a{1,1};
if cont>1
    val_ref=a{2,cont};
    ref=val_ref-val;
    if ref>0
        t_inicial=str2double(get(handles.edit3,'string'));
        t_inicial=t_inicial/1000^ref;
    elseif ref<0
        t_inicial=str2double(get(handles.edit3,'string'));
        t_inicial=t_inicial*1000^abs(ref);
    else
        return;
    end
    set(handles.edit3,'string',num2str(t_inicial));
    a{2,cont}=val;
end
        
    
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global a
cont=a{1,1};
t_muestreo=a{2,1};
t_inicial=a{3,cont};
t_final=unidades2(handles);
t=[t_inicial:t_muestreo:t_final+t_muestreo];
tam=length(t)-1;
m=str2double(get(handles.edit1,'string'));
b=str2double(get(handles.edit4,'string'));
b=b-m*(t_inicial);
u=srampa(t,m,b);

if abs(t_final-t(tam))>abs(t_final-t(tam+1))
    a{3,cont+1}=t(tam+1);
    a{4,cont+1}=u(tam+1);
else
    a{3,cont+1}=t(tam);
    a{4,cont+1}=u(tam);
end

if cont==1
    a{1,cont+1}=u(1:tam);
else
    a{1,cont+1}=u(2:tam);
end
a{2,cont+1}=1;

close(handles.figure1);

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
