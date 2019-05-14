function varargout = Eleccion_salidas_entradas(varargin)
% ELECCION_SALIDAS_ENTRADAS MATLAB code for Eleccion_salidas_entradas.fig
%      ELECCION_SALIDAS_ENTRADAS, by itself, creates a new ELECCION_SALIDAS_ENTRADAS or raises the existing
%      singleton*.
%
%      H = ELECCION_SALIDAS_ENTRADAS returns the handle to a new ELECCION_SALIDAS_ENTRADAS or the handle to
%      the existing singleton*.
%
%      ELECCION_SALIDAS_ENTRADAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ELECCION_SALIDAS_ENTRADAS.M with the given input arguments.
%
%      ELECCION_SALIDAS_ENTRADAS('Property','Value',...) creates a new ELECCION_SALIDAS_ENTRADAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Eleccion_salidas_entradas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Eleccion_salidas_entradas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Eleccion_salidas_entradas

% Last Modified by GUIDE v2.5 16-Aug-2014 01:36:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Eleccion_salidas_entradas_OpeningFcn, ...
                   'gui_OutputFcn',  @Eleccion_salidas_entradas_OutputFcn, ...
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


% --- Executes just before Eleccion_salidas_entradas is made visible.
function Eleccion_salidas_entradas_OpeningFcn(hObject, eventdata, handles, varargin)

    global data valores
    valores=[];
    [~,n]=size(data);
    lista_entrada=cell(n+2,1);
    lista_salida=cell(n+2,1);
    lista_entrada{1}='Numero de entradas';
    lista_salida{1}='Numero de salidas';
    for cont=1:n+1
        lista_entrada{cont+1}=cont-1;
        lista_salida{cont+1}=cont-1;
    end
    set(handles.Num_Entradas,'Enable','on','string',lista_entrada)
    set(handles.Num_Salidas,'Enable','on','string',lista_salida)
    set(handles.Cargar,'Enable','off')
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Eleccion_salidas_entradas (see VARARGIN)

% Choose default command line output for Eleccion_salidas_entradas
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Eleccion_salidas_entradas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Eleccion_salidas_entradas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in Num_Entradas.
function Num_Entradas_Callback(hObject, eventdata, handles)
global data
[~,n]=size(data);
val=get(handles.Num_Entradas,'value');
if val>1
    set(handles.Num_Salidas,'value',(n-(val-2))+2)
else
    set(handles.Num_Salidas,'value',1)
end    
set(handles.Cargar,'Enable','on')
% hObject    handle to Num_Entradas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Num_Entradas contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Num_Entradas


% --- Executes during object creation, after setting all properties.
function Num_Entradas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Num_Entradas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Num_Salidas.
function Num_Salidas_Callback(hObject, eventdata, handles)
global data
[~,n]=size(data);
val=get(handles.Num_Salidas,'value');
if val>1
    set(handles.Num_Entradas,'value',(n-(val-2))+2)
else
    set(handles.Num_Entradas,'value',1)
end
set(handles.Cargar,'Enable','on')
% hObject    handle to Num_Salidas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Num_Salidas contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Num_Salidas


% --- Executes during object creation, after setting all properties.
function Num_Salidas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Num_Salidas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Cargar.
function Cargar_Callback(hObject, eventdata, handles)
    global valores
    valores(1)=get(handles.Num_Salidas,'value')-2;
    valores(2)=get(handles.Num_Entradas,'value')-2;
    close(handles.figure1)
% hObject    handle to Cargar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
