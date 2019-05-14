function varargout = senal_definida_usuario(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @senal_definida_usuario_OpeningFcn, ...
                   'gui_OutputFcn',  @senal_definida_usuario_OutputFcn, ...
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


function senal_definida_usuario_OpeningFcn(hObject, eventdata, handles, varargin)
set(handles.edit2,'Enable','off');
set(handles.text5,'Enable','off');
set(handles.pushbutton2,'Enable','off');
set(handles.checkbox2,'visible','off');
set(handles.edit4,'value',1,'visible','off');
set(handles.text6,'visible','off');
set(handles.pushbutton3,'visible','off')
handles.output = hObject;

guidata(hObject, handles);

% UIWAIT makes senal_definida_usuario wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = senal_definida_usuario_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

clear global u;
global u t;
eval(get(handles.edit1,'string'));
close(handles.figure1);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject ,~, handles)
global a t;
set(hObject,'Enable','off');
set(handles.edit2,'Enable','off');          
set(handles.text5,'Enable','off');
t_muestreo=t(2)-t(1);
No_intervalos=str2double(get(handles.edit2,'string'));
a=cell(4,No_intervalos+1);
a{2,1}=t_muestreo;
a{3,1}=0;
a{4,1}=0;
for cont=1:No_intervalos
    a{1,1}=cont;
    h=Entrada_Definida_Trozos;
    uiwait(h);
    pause(0.5);
end
set(handles.checkbox2,'visible','on');
set(handles.pushbutton3,'visible','on');
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
if get(hObject,'value')==1
    set(handles.edit2,'Enable','on');          
    set(handles.text5,'Enable','on');
    set(handles.pushbutton2,'Enable','on');
    set(handles.text4,'Enable','off');
    set(handles.edit1,'Enable','off');
    set(handles.pushbutton1,'Enable','off');
else
    
    set(handles.edit2,'Enable','off');          
    set(handles.text5,'Enable','off');
    set(handles.pushbutton2,'Enable','off');
    set(handles.text4,'Enable','on');
    set(handles.edit1,'Enable','on');
    set(handles.pushbutton1,'Enable','on');
end
    

function edit2_Callback(hObject, eventdata, ~)
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


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
if get(hObject,'value')==1
set(handles.edit4,'visible','on');
set(handles.text6,'visible','on');
else
set(handles.edit4,'visible','off');
set(handles.text6,'visible','off');
end

% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2



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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
clear global t
global a u t
u=[];
for cont=2:a{1,1}+1
u=[u;a{1,cont}];
end

No_ciclos=str2double(get(handles.edit4,'string'));
aux=u;
for cont=2:No_ciclos
    u=[u;aux];
end

t=[0:a{2,1}:a{2,1}*(length(u)-1)];
close(handles.figure1);



% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
