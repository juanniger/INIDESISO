function varargout = Datos_Validacion_Interfaz(varargin)
% DATOS_VALIDACION_INTERFAZ MATLAB code for Datos_Validacion_Interfaz.fig
%      DATOS_VALIDACION_INTERFAZ, by itself, creates a new DATOS_VALIDACION_INTERFAZ or raises the existing
%      singleton*.
%
%      H = DATOS_VALIDACION_INTERFAZ returns the handle to a new DATOS_VALIDACION_INTERFAZ or the handle to
%      the existing singleton*.
%
%      DATOS_VALIDACION_INTERFAZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATOS_VALIDACION_INTERFAZ.M with the given input arguments.
%
%      DATOS_VALIDACION_INTERFAZ('Property','Value',...) creates a new DATOS_VALIDACION_INTERFAZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Datos_Validacion_Interfaz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Datos_Validacion_Interfaz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Datos_Validacion_Interfaz

% Last Modified by GUIDE v2.5 19-Aug-2014 20:35:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Datos_Validacion_Interfaz_OpeningFcn, ...
                   'gui_OutputFcn',  @Datos_Validacion_Interfaz_OutputFcn, ...
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


% --- Executes just before Datos_Validacion_Interfaz is made visible.
function Datos_Validacion_Interfaz_OpeningFcn(hObject, eventdata, handles, varargin)
global Datos
[~,n]=size(Datos);
Index=(1:n);
Index=num2str(Index');
set(handles.Tabla_Datos,'Data',Datos,'ColumnName',Index)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Datos_Validacion_Interfaz (see VARARGIN)

% Choose default command line output for Datos_Validacion_Interfaz
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Datos_Validacion_Interfaz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Datos_Validacion_Interfaz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Cerrar.
function Cerrar_Callback(hObject, eventdata, handles)
close(handles.figure1)
% hObject    handle to Cerrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
