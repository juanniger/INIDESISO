function varargout = comparacion2(varargin)
% COMPARACION2 M-file for comparacion2.fig
%      COMPARACION2, by itself, creates a new COMPARACION2 or raises the existing
%      singleton*.
%
%      H = COMPARACION2 returns the handle to a new COMPARACION2 or the handle to
%      the existing singleton*.
%
%      COMPARACION2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPARACION2.M with the given input arguments.
%
%      COMPARACION2('Property','Value',...) creates a new COMPARACION2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before comparacion2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to comparacion2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help comparacion2

% Last Modified by GUIDE v2.5 14-Jul-2013 12:54:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @comparacion2_OpeningFcn, ...
                   'gui_OutputFcn',  @comparacion2_OutputFcn, ...
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


% --- Executes just before comparacion2 is made visible.
function comparacion2_OpeningFcn(hObject, eventdata, handles, varargin)
global num1 den1 Nresplado Dresplado;
axes(handles.axes5);
axis off;
Nresplado=num1;
Dresplado=den1;
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to comparacion2 (see VARARGIN)

% Choose default command line output for comparacion2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes comparacion2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = comparacion2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function na1_Callback(hObject, eventdata, handles)
% hObject    handle to na1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of na1 as text
%        str2double(get(hObject,'String')) returns contents of na1 as a double


% --- Executes during object creation, after setting all properties.
function na1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to na1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nb1_Callback(hObject, eventdata, handles)
% hObject    handle to nb1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nb1 as text
%        str2double(get(hObject,'String')) returns contents of nb1 as a double


% --- Executes during object creation, after setting all properties.
function nb1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nb1 (see GCBO)
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



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nk1_Callback(hObject, eventdata, handles)
% hObject    handle to nk1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nk1 as text
%        str2double(get(hObject,'String')) returns contents of nk1 as a double


% --- Executes during object creation, after setting all properties.
function nk1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nk1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in I_ARX.
function I_ARX_Callback(hObject, eventdata, handles)
 %Funcion de identificacion
    
    %Idicador de que la funciom esta en uso
    [x,map]=imread('ocupado','jpg');
    axes(handles.axes5)
    image(x)
    axis off
    
    %Identificacion
    clear global num1 den1;
    global u salida t num_ARX1 den_ARX1 ;
    salida2=salida;
    t2=t;
    u2=u;  
    na=str2double(get(handles.na1,'string'));
    nb=str2double(get(handles.nb1,'string'));
    nk=str2double(get(handles.nk1,'string'));
    run(char('ARX'));
    num_ARX1=num1;
    den_ARX1=den1;
    axes(handles.axes1);
    plot(t,salida,'b');
    hold on
    plot(t,ym,'r');
    hold off;
    set(handles.error_ARX,'string',strcat('error= ',num2str(ema)));
    axes(handles.axes5);
    cla;
% hObject    handle to I_ARX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function na2_Callback(hObject, eventdata, handles)
% hObject    handle to na2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of na2 as text
%        str2double(get(hObject,'String')) returns contents of na2 as a double


% --- Executes during object creation, after setting all properties.
function na2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to na2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nb2_Callback(hObject, eventdata, handles)
% hObject    handle to nb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nb2 as text
%        str2double(get(hObject,'String')) returns contents of nb2 as a double


% --- Executes during object creation, after setting all properties.
function nb2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nc2_Callback(hObject, eventdata, handles)
% hObject    handle to nc2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nc2 as text
%        str2double(get(hObject,'String')) returns contents of nc2 as a double


% --- Executes during object creation, after setting all properties.
function nc2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nc2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nk2_Callback(hObject, eventdata, handles)
% hObject    handle to nk2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nk2 as text
%        str2double(get(hObject,'String')) returns contents of nk2 as a double


% --- Executes during object creation, after setting all properties.
function nk2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nk2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nb3_Callback(hObject, eventdata, handles)
% hObject    handle to nb3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nb3 as text
%        str2double(get(hObject,'String')) returns contents of nb3 as a double


% --- Executes during object creation, after setting all properties.
function nb3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nb3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nf3_Callback(hObject, eventdata, handles)
% hObject    handle to nf3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nf3 as text
%        str2double(get(hObject,'String')) returns contents of nf3 as a double


% --- Executes during object creation, after setting all properties.
function nf3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nf3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nk3_Callback(hObject, eventdata, handles)
% hObject    handle to nk3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nk3 as text
%        str2double(get(hObject,'String')) returns contents of nk3 as a double


% --- Executes during object creation, after setting all properties.
function nk3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nk3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nb4_Callback(hObject, eventdata, handles)
% hObject    handle to nb4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nb4 as text
%        str2double(get(hObject,'String')) returns contents of nb4 as a double


% --- Executes during object creation, after setting all properties.
function nb4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nb4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nc4_Callback(hObject, eventdata, handles)
% hObject    handle to nc4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nc4 as text
%        str2double(get(hObject,'String')) returns contents of nc4 as a double


% --- Executes during object creation, after setting all properties.
function nc4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nc4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nd4_Callback(hObject, eventdata, handles)
% hObject    handle to nd4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nd4 as text
%        str2double(get(hObject,'String')) returns contents of nd4 as a double


% --- Executes during object creation, after setting all properties.
function nd4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nd4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nf4_Callback(hObject, eventdata, handles)
% hObject    handle to nf4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nf4 as text
%        str2double(get(hObject,'String')) returns contents of nf4 as a double


% --- Executes during object creation, after setting all properties.
function nf4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nf4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nk4_Callback(hObject, eventdata, handles)
% hObject    handle to nk4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nk4 as text
%        str2double(get(hObject,'String')) returns contents of nk4 as a double


% --- Executes during object creation, after setting all properties.
function nk4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nk4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in I_ARMAX.
function I_ARMAX_Callback(hObject, eventdata, handles)
%Funcion de identificacion
    
    %Idicador de que la funciom esta en uso
    [x,map]=imread('ocupado','jpg');
    axes(handles.axes5)
    image(x)
    axis off
    
    %Identificacion
    clear global num1 den1;
    global u salida t num_ARMAX1 den_ARMAX1;
    salida2=salida;
    t2=t;
    u2=u;  
    na=str2double(get(handles.na2,'string'));
    nb=str2double(get(handles.nb2,'string'));
    nc=str2double(get(handles.nc2,'string'));
    nk=str2double(get(handles.nk2,'string'));
    run(char('ARMAX'));
    num_ARMAX1=num1;
    den_ARMAX1=den1;
    axes(handles.axes2);
    plot(t,salida,'b');
    hold on
    plot(t,ym,'r');
    hold off;
    set(handles.error_ARMAX,'string',strcat('error= ',num2str(ema)));
    axes(handles.axes5);
    cla;
% hObject    handle to I_ARMAX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in I_OE.
function I_OE_Callback(hObject, eventdata, handles)
%Funcion de identificacion
    
    %Idicador de que la funciom esta en uso
    [x,map]=imread('ocupado','jpg');
    axes(handles.axes5)
    image(x)
    axis off
    
    %Identificacion
    clear global num1 den1;
    global u salida t num_OE1 den_OE1;
    salida2=salida;
    t2=t;
    u2=u;  
    nb=str2double(get(handles.nb3,'string'));
    nf=str2double(get(handles.nf3,'string'));
    nk=str2double(get(handles.nk3,'string'));
    run(char('OE'));
    num_OE1=num1;
    den_OE1=den1;
    axes(handles.axes3);
    plot(t,salida,'b');
    hold on
    plot(t,ym,'r');
    hold off;
    set(handles.error_OE,'string',strcat('error= ',num2str(ema)));
    axes(handles.axes5);
    cla;
% hObject    handle to I_OE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in I_BJ.
function I_BJ_Callback(hObject, eventdata, handles)
%Funcion de identificacion
    
    %Idicador de que la funciom esta en uso
    [x,map]=imread('ocupado','jpg');
    axes(handles.axes5)
    image(x)
    axis off
    
    %Identificacion
    clear global num1 den1;
    global u salida t num_BJ1 den_BJ1;
    salida2=salida;
    t2=t;
    u2=u;  
    nb=str2double(get(handles.nb4,'string'));
    nc=str2double(get(handles.nc4,'string'));
    nd=str2double(get(handles.nd4,'string'));
    nf=str2double(get(handles.nf4,'string'));
    nk=str2double(get(handles.nk4,'string'));
    run(char('BJ'));
    num_BJ1=num1;
    den_BJ1=den1;
    axes(handles.axes4);
    plot(t,salida,'b');
    hold on
    plot(t,ym,'r');
    hold off;
    set(handles.error_BJ,'string',strcat('error= ',num2str(ema)));
    axes(handles.axes5);
    cla;
% hObject    handle to I_BJ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cargar_ft_ARX.
function cargar_ft_ARX_Callback(hObject, eventdata, handles)
global num_ARX1 den_ARX1;
set(handles.metodo,'string','ARX');
set(handles.num,'string',poly2str(num_ARX1,'s'));
set(handles.den,'string',poly2str(den_ARX1,'s'));
% hObject    handle to cargar_ft_ARX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cargar_ft_ARMAX.
function cargar_ft_ARMAX_Callback(hObject, eventdata, handles)
global num_ARMAX1 den_ARMAX1;
set(handles.metodo,'string','ARMAX');
set(handles.num,'string',poly2str(num_ARMAX1,'s'));
set(handles.den,'string',poly2str(den_ARMAX1,'s'));
% hObject    handle to cargar_ft_ARMAX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cargar_ft_OE.
function cargar_ft_OE_Callback(hObject, eventdata, handles)
global num_OE1 den_OE1;
set(handles.metodo,'string','OE');
set(handles.num,'string',poly2str(num_OE1,'s'));
set(handles.den,'string',poly2str(den_OE1,'s'));
% hObject    handle to cargar_ft_OE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cargar_ft_BJ.
function cargar_ft_BJ_Callback(hObject, eventdata, handles)
global num_BJ1 den_BJ1;
set(handles.metodo,'string','BJ');
set(handles.num,'string',poly2str(num_BJ1,'s'));
set(handles.den,'string',poly2str(den_BJ1,'s'));
% hObject    handle to cargar_ft_BJ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Identificar.
function Identificar_Callback(hObject, eventdata, handles)
I_ARX_Callback(hObject, eventdata, handles);
I_ARMAX_Callback(hObject, eventdata, handles);
I_OE_Callback(hObject, eventdata, handles);
I_BJ_Callback(hObject, eventdata, handles);

% hObject    handle to Identificar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in limpiar.
function limpiar_Callback(hObject, eventdata, handles)
axes(handles.axes1);
cla;
axes(handles.axes2);
cla;
axes(handles.axes3);
cla;
axes(handles.axes4);
cla;
set(handles.num,'string','');
set(handles.den,'string','');
set(handles.metodo,'string','');

% hObject    handle to limpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cerrar.
function cerrar_Callback(hObject, eventdata, handles)
global den1 num1 Nresplado Dresplado
num1=Nresplado;
den1=Dresplado;
close(handles.figure1);
% hObject    handle to cerrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


