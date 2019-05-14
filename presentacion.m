function varargout = presentacion(varargin)
% PRESENTACION M-file for presentacion.fig
%      PRESENTACION, by itself, creates a new PRESENTACION or raises the existing
%      singleton*.
%
%      H = PRESENTACION returns the handle to a new PRESENTACION or the handle to
%      the existing singleton*.
%
%      PRESENTACION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRESENTACION.M with the given input arguments.
%
%      PRESENTACION('Property','Value',...) creates a new PRESENTACION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before presentacion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to presentacion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help presentacion

% Last Modified by GUIDE v2.5 25-Jul-2013 16:33:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @presentacion_OpeningFcn, ...
                   'gui_OutputFcn',  @presentacion_OutputFcn, ...
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


% --- Executes just before presentacion is made visible.
function presentacion_OpeningFcn(hObject, eventdata, handles, varargin)
    [x,~]=imread('imagenes/umsnh','jpg');
    axes(handles.axes1)
    image(x)
    axis (handles.axes1,'off')
    
    

    
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to presentacion (see VARARGIN)

% Choose default command line output for presentacion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes presentacion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = presentacion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    Identificacion;
    close(handles.figure1)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
