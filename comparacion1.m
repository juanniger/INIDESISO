function varargout = comparacion1(varargin)
% COMPARACION1 M-file for comparacion1.fig
%      COMPARACION1, by itself, creates a new COMPARACION1 or raises the existing
%      singleton*.
%
%      H = COMPARACION1 returns the handle to a new COMPARACION1 or the handle to
%      the existing singleton*.
%
%      COMPARACION1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPARACION1.M with the given input arguments.
%
%      COMPARACION1('Property','Value',...) creates a new COMPARACION1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before comparacion1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to comparacion1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help comparacion1

% Last Modified by GUIDE v2.5 14-Jul-2013 12:57:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @comparacion1_OpeningFcn, ...
                   'gui_OutputFcn',  @comparacion1_OutputFcn, ...
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


% --- Executes just before comparacion1 is made visible.
function comparacion1_OpeningFcn(hObject, eventdata, handles, varargin)
global num1 den1 Nresplado Dresplado;
axes(handles.axes5);
axis off;
Nresplado=num1;
Dresplado=den1;
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to comparacion1 (see VARARGIN)

% Choose default command line output for comparacion1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes comparacion1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = comparacion1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function na_Callback(hObject, eventdata, handles)
% hObject    handle to na (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of na as text
%        str2double(get(hObject,'String')) returns contents of na as a double


% --- Executes during object creation, after setting all properties.
function na_CreateFcn(hObject, eventdata, handles)
% hObject    handle to na (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB

% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nb_Callback(hObject, eventdata, handles)
% hObject    handle to nb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nb as text
%        str2double(get(hObject,'String')) returns contents of nb as a double


% --- Executes during object creation, after setting all properties.
function nb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nc_Callback(hObject, eventdata, handles)
% hObject    handle to nc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nc as text
%        str2double(get(hObject,'String')) returns contents of nc as a double


% --- Executes during object creation, after setting all properties.
function nc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nd_Callback(hObject, eventdata, handles)
% hObject    handle to nd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nd as text
%        str2double(get(hObject,'String')) returns contents of nd as a double


% --- Executes during object creation, after setting all properties.
function nd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nd (see GCBO)
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



function nf_Callback(hObject, eventdata, handles)
% hObject    handle to nf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nf as text
%        str2double(get(hObject,'String')) returns contents of nf as a double


% --- Executes during object creation, after setting all properties.
function nf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nk_Callback(hObject, eventdata, handles)
% hObject    handle to nk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nk as text
%        str2double(get(hObject,'String')) returns contents of nk as a double


% --- Executes during object creation, after setting all properties.
function nk_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nk (see GCBO)
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
    global u salida t num_ARX den_ARX ;
    salida2=salida;
    t2=t;
    u2=u;  
    na=str2double(get(handles.na,'string'));
    nb=str2double(get(handles.nb,'string'));
    nk=str2double(get(handles.nk,'string'));
    run(char('ARX'));
    num_ARX=num1;
    den_ARX=den1;
    axes(handles.axes1);
    plot(t,salida,'b');
    hold on
    plot(t,ym,'r');
    hold off;
    set(handles.error_ARX,'string',strcat('error= ',num2str(ema)));
    axes(handles.axes5);
    cla
% hObject    handle to I_ARX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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
    global u salida t num_ARMAX den_ARMAX;
    salida2=salida;
    t2=t;
    u2=u;  
    na=str2double(get(handles.na,'string'));
    nb=str2double(get(handles.nb,'string'));
    nc=str2double(get(handles.nc,'string'));
    nk=str2double(get(handles.nk,'string'));
    run(char('ARMAX'));
    num_ARMAX=num1;
    den_ARMAX=den1;
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
    global u salida t num_OE den_OE;
    salida2=salida;
    t2=t;
    u2=u;  
    nb=str2double(get(handles.nb,'string'));
    nf=str2double(get(handles.nf,'string'));
    nk=str2double(get(handles.nk,'string'));
    run(char('OE'));
    num_OE=num1;
    den_OE=den1;
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
    global u salida t num_BJ den_BJ;
    salida2=salida;
    t2=t;
    u2=u;  
    nb=str2double(get(handles.nb,'string'));
    nc=str2double(get(handles.nc,'string'));
    nd=str2double(get(handles.nd,'string'));
    nf=str2double(get(handles.nf,'string'));
    nk=str2double(get(handles.nk,'string'));
    run(char('BJ'));
    num_BJ=num1;
    den_BJ=den1;
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
global num_ARX den_ARX;
set(handles.metodo,'string','ARX');
set(handles.num,'string',poly2str(num_ARX,'s'));
set(handles.den,'string',poly2str(den_ARX,'s'));
% hObject    handle to cargar_ft_ARX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cargar_ft_OE.
function cargar_ft_OE_Callback(hObject, eventdata, handles)
global num_OE den_OE;
set(handles.metodo,'string','OE');
set(handles.num,'string',poly2str(num_OE,'s'));
set(handles.den,'string',poly2str(den_OE,'s'));
% hObject    handle to cargar_ft_OE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cargar_ft_ARMAX.
function cargar_ft_ARMAX_Callback(hObject, eventdata, handles)
global num_ARMAX den_ARMAX;
set(handles.metodo,'string','ARMAX');
set(handles.num,'string',poly2str(num_ARMAX,'s'));
set(handles.den,'string',poly2str(den_ARMAX,'s'));
% hObject    handle to cargar_ft_ARMAX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cargar_ft_BJ.
function cargar_ft_BJ_Callback(hObject, eventdata, handles)
global num_BJ den_BJ;
set(handles.metodo,'string','BJ');
set(handles.num,'string',poly2str(num_BJ,'s'));
set(handles.den,'string',poly2str(den_BJ,'s'));
% hObject    handle to cargar_ft_BJ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
I_ARX_Callback(hObject, eventdata, handles);
I_ARMAX_Callback(hObject, eventdata, handles);
I_OE_Callback(hObject, eventdata, handles);
I_BJ_Callback(hObject, eventdata, handles);
% hObject    handle to pushbutton10 (see GCBO)
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


