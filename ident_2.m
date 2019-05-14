function varargout = ident_2(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ident_2_OpeningFcn, ...
                   'gui_OutputFcn',  @ident_2_OutputFcn, ...
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
 

function ident_2_OpeningFcn(hObject, eventdata, handles, varargin)
    axes(handles.axes10)
    axis off;
    set(handles.uitable1,'Data',[]);
    set(handles.popupmenu5,'Enable','off');
    set(handles.pushbutton20,'Enable','off');
    set(handles.pushbutton21,'Enable','off');
    set(handles.pushbutton22,'Enable','off');
    handles.output = hObject;
    guidata(hObject, handles);

function varargout = ident_2_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

%Creacion de las funciones
function na_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function nb_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function nc_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function nd_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function nf_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function nk_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function metodos_identificacion_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%menus

function menu_axes4_Callback(hObject, eventdata, handles)
    function menu_limites_Callback(hObject, eventdata, handles)
        function menu_limitesx_Callback(hObject, eventdata, handles) 
            global x_1 x_2
            h=limite_;
            uiwait(h);
            set(handles.axes4,'Xlim',[x_1 x_2]);
        function menu_limitesy_Callback(hObject, eventdata, handles)
            global y_1 y_2
            h=limite_y;
            uiwait(h);
            set(handles.axes4,'Ylim',[y_1 y_2]);
%Botones de accion

function identificar_Callback(hObject, eventdata, handles)

    global datos_id ft_m ema sys sistems;
    %Identificacion
    clear global num1 den1;
    ocupado1(handles);
    fun=get(handles.metodos_identificacion,'value');
    na=str2double(get(handles.na,'string'));
    nb=str2double(get(handles.nb,'string'));
    nc=str2double(get(handles.nc,'string'));
    nd=str2double(get(handles.nd,'string'));
    nf=str2double(get(handles.nf,'string'));
    nk=str2double(get(handles.nk,'string'));
    n=str2double(get(handles.n,'string'));
    set(handles.popupmenu5,'Enable','off','value',1);
    set(handles.pushbutton20,'Enable','off');
    set(handles.pushbutton21,'Enable','off');
    set(handles.pushbutton22,'Enable','off');
    set(handles.checkbox4,'value',0);
    switch fun
        case 2
            met='AR';
            [num1 den1 ym sys]=sys_AR(datos_id,n);
            na=0;
            nb=0;
            nc=0;
            nd=0;
            nf=0;
            nk=0;
            
        case 3
            met='IVAR'
             [num1 den1 ym sys]=sys_ivar(datos_id,na,nc);
            nb=0;
            nd=0;
            nf=0;
            nk=0;
            n=0;
        case 4
            met='ARX';
            [num1 den1 ym sys]=sys_ARX(datos_id,na,nb,nk);
            nc=0;
            nd=0;
            nf=0;
            n=0;
        case 5
            met='IV4';
            [num1 den1 ym sys]=sys_IV4(datos_id,na,nb,nk);
            nc=0;
            nd=0;
            nf=0;
            n=0;
        case 6
            met='ARMAX';
            [num1 den1 ym sys]=sys_ARXMAX(datos_id,na,nb,nc,nk);
            nd=0;
            nf=0;
            n=0;
        case 7
            met='OE';
            [num1 den1 ym sys]=sys_OE(datos_id,nb,nf,nk);
            na=0;
            nc=0;
            nd=0;
            n=0;
        case 8
            met='BJ';
             [num1 den1 ym sys]=sys_BJ(datos_id,nb,nc,nd,nf,nk);
            na=0;
        case 9
            met='PEM';
             [num1 den1 ym sys]=sys_PEM(datos_id,sys);
            na=0;
            nb=0;
            nc=0;
            nd=0;
            nf=0;
            nk=0;
            n=0;       
    end
    t=[0:datos_id.Ts:(length(datos_id.y)-1)*datos_id.Ts];
    ema=mean(abs(ym-datos_id.y));
    [A,B,C,D,F] = polydata(sys);
    num1=B;
    den1=conv(A,F);
    set(handles.num1,'string',poly2str(num1,'z'));
    set(handles.den1,'string',poly2str(den1,'z'));
    set(handles.error,'string',num2str(ema));
    val=get(handles.checkbox3,'value');
    
    val_col=get(handles.popupmenu4,'value');
    switch val_col
        case 1
            col='b';
            c_l='azul';
        case 2
            col='b';
            c_l='azul';
        case 3
            col='g';
            c_l='verde';
        case 4
            col='r';
            c_l='rojo';
        case 5
            col='c';
            c_l='cian';
        case 6
            col='m';
            c_l='magenta';
        case 7
            col='y';
            c_l='amarillo';
        case 8
            col='k';
            c_l='negro';
    end 
    if val==0
        %clear sistems
        axes(handles.axes4)
        plot(t,datos_id.y,'b',t,ym,col);
        hold off;
        sistems={sys};
         b{1,1}=c_l;
    b{1,2}=met;
    b{1,3}=na;
    b{1,4}=nb;
    b{1,5}=nc;
    b{1,6}=nd;
    b{1,7}=nf;
    b{1,8}=nk;
    b{1,9}=n;  
    set(handles.uitable1,'Data',b);
    elseif val==1
        axes(handles.axes4)
        hold on
        plot(t,datos_id.y,'b');
        hold on
        plot(t,ym,col);
        hold off;
        [m j]=size(sistems);
        sistems{1,j+1}=sys;
          a=get(handles.uitable1,'Data');
    b{1,1}=c_l;
    b{1,2}=met;
    b{1,3}=na;
    b{1,4}=nb;
    b{1,5}=nc;
    b{1,6}=nd;
    b{1,7}=nf;
    b{1,8}=nk;
    b{1,9}=n;  
    if m>0
        a=[a;b];
    else
    a=b;
    end
    set(handles.uitable1,'Data',a);
    else
        return;
    end
    
    
   ft_m={num1 den1};
   desocupado1(handles);

function metodos_identificacion_Callback(hObject, eventdata, handles)
    val=get(hObject,'value');
        switch val
            case 2
                set(handles.na,'Enable','off');
                set(handles.text11,'Enable','off');
                set(handles.nb,'Enable','off');
                set(handles.text12,'Enable','off');
                set(handles.nc,'Enable','off');
                set(handles.text13,'Enable','off');
                set(handles.nd,'Enable','off');
                set(handles.text14,'Enable','off');
                set(handles.nf,'Enable','off');
                set(handles.text15,'Enable','off');
                set(handles.nk,'Enable','off');
                set(handles.text17,'Enable','off');
                set(handles.n,'Enable','on');
                set(handles.text20,'Enable','on');
        case 3
                set(handles.na,'Enable','on');
                set(handles.text11,'Enable','on');
                set(handles.nb,'Enable','off');
                set(handles.text12,'Enable','off');
                set(handles.nc,'Enable','on');
                set(handles.text13,'Enable','on');
                set(handles.nd,'Enable','off');
                set(handles.text14,'Enable','off');
                set(handles.nf,'Enable','off');
                set(handles.text15,'Enable','off');
                set(handles.nk,'Enable','off');
                set(handles.text17,'Enable','off');
                set(handles.n,'Enable','off');
                set(handles.text20,'Enable','off');
        case 4
                set(handles.na,'Enable','on');
                set(handles.text11,'Enable','on');
                set(handles.nb,'Enable','on');
                set(handles.text12,'Enable','on');
                set(handles.nc,'Enable','off');
                set(handles.text13,'Enable','off');
                set(handles.nd,'Enable','off');
                set(handles.text14,'Enable','off');
                set(handles.nf,'Enable','off');
                set(handles.text15,'Enable','off');
                set(handles.nk,'Enable','on');
                set(handles.text17,'Enable','on');
                set(handles.n,'Enable','off');
                set(handles.text20,'Enable','off');
        case 5
                set(handles.na,'Enable','on');
                set(handles.text11,'Enable','on');
                set(handles.nb,'Enable','on');
                set(handles.text12,'Enable','on');
                set(handles.nc,'Enable','off');
                set(handles.text13,'Enable','off');
                set(handles.nd,'Enable','off');
                set(handles.text14,'Enable','off');
                set(handles.nf,'Enable','off');
                set(handles.text15,'Enable','off');
                set(handles.nk,'Enable','on');
                set(handles.text17,'Enable','on');
                set(handles.n,'Enable','off');
                set(handles.text20,'Enable','off');
        case 6
                set(handles.na,'Enable','on');
                set(handles.text11,'Enable','on');
                set(handles.nb,'Enable','on');
                set(handles.text12,'Enable','on');
                set(handles.nc,'Enable','on');
                set(handles.text13,'Enable','on');
                set(handles.nd,'Enable','off');
                set(handles.text14,'Enable','off');
                set(handles.nf,'Enable','off');
                set(handles.text15,'Enable','off');
                set(handles.nk,'Enable','on');
                set(handles.text17,'Enable','on');
                set(handles.n,'Enable','off');
                set(handles.text20,'Enable','off');
       case 7
                set(handles.na,'Enable','off');
                set(handles.text11,'Enable','off');
                set(handles.nb,'Enable','on');
                set(handles.text12,'Enable','on');
                set(handles.nc,'Enable','off');
                set(handles.text13,'Enable','off');
                set(handles.nd,'Enable','off');
                set(handles.text14,'Enable','off');
                set(handles.nf,'Enable','on');
                set(handles.text15,'Enable','on');
                set(handles.nk,'Enable','on');
                set(handles.text17,'Enable','on');
                set(handles.n,'Enable','off');
                set(handles.text20,'Enable','off');
        case 8
                set(handles.na,'Enable','off');
                set(handles.text11,'Enable','off');
                set(handles.nb,'Enable','on');
                set(handles.text12,'Enable','on');
                set(handles.nc,'Enable','on');
                set(handles.text13,'Enable','on');
                set(handles.nd,'Enable','on');
                set(handles.text14,'Enable','on');
                set(handles.nf,'Enable','on');
                set(handles.text15,'Enable','on');
                set(handles.nk,'Enable','on');
                set(handles.text17,'Enable','on');
                set(handles.n,'Enable','off');
                set(handles.text20,'Enable','off');
        case 9
                set(handles.na,'Enable','off');
                set(handles.text11,'Enable','off');
                set(handles.nb,'Enable','off');
                set(handles.text12,'Enable','off');
                set(handles.nc,'Enable','off');
                set(handles.text13,'Enable','off');
                set(handles.nd,'Enable','off');
                set(handles.text14,'Enable','off');
                set(handles.nf,'Enable','off');
                set(handles.text15,'Enable','off');
                set(handles.nk,'Enable','off');
                set(handles.text17,'Enable','off');
                set(handles.n,'Enable','off');
                set(handles.text20,'Enable','off');
                
        end
function validar_Callback(hObject, eventdata, handles)
    global discreto continuo
    discreto=1;
    continuo=0;
    validar;
function edit1_Callback(hObject, eventdata, handles)
function edit2_Callback(hObject, eventdata, handles)
function na_Callback(hObject, eventdata, handles)
function nb_Callback(hObject, eventdata, handles)
function nc_Callback(hObject, eventdata, handles)
function nd_Callback(hObject, eventdata, handles)
function nf_Callback(hObject, eventdata, handles)
function nk_Callback(hObject, eventdata, handles)

function cerrar_Callback(hObject, eventdata, handles)
    close(handles.figure1);
    
function comparar_Callback(hObject, eventdata, handles)
global sistems datos_val sys
[m n]=size(sistems);
a=[];
for cont=1:n
    a=sprintf('%s,sistems{1,%g}',a,cont);
end
a=sprintf('compare(datos_val%s);',a);
figure;
eval(a);

% hObject    handle to comparar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


    



function n_Callback(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n as text
%        str2double(get(hObject,'String')) returns contents of n as a double


% --- Executes during object creation, after setting all properties.
function n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


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


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
    global datos_val sys
    a=spa(datos_val);
    b=idfrd(sys);
    figure
    bode(a,b);
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
    global datos_val sys
    
    [num den]=tfdata(sys);
    figure
    dimpulse(num,den);
    hold on
    cra([datos_val.y datos_val.u]);
    
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
    global sys datos_id
    [z p k]=zpkdata(sys);
    hf=figure
    iopzplot(sys)
    a=sprintf('Ganancia=%g',k);
    
    h1 = uicontrol('Parent',hf, ...
'Units','points', ...
'BackgroundColor',[0.8 0.8 0.8], ...
'ListboxTop',0, ...
'Position',[ 1 2 140.5 19.5 ], ...
'String',[a], ...
'Style','text', ...
'Tag','StaticText2');
    
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
    global sys datos_val
    h=figure;
    resid(sys,datos_val)
    a=get(h,'children');
    b=get(a(1,1),'children');
    c=get(a(2,1),'children');
    d=get(c(1,1),'Children');
    h=get(b(1,1),'Children');
    
    set(h(1,1),'visible','off');
    set(h(2,1),'Marker','none');
    set(h(2,1),'Line','-');
    set(d(1,1),'Visible','off');
    set(d(2,1),'Marker','none');
    set(d(2,1),'Line','-');
    set(b(2,1),'FaceColor',[1 1 1]);
    set(b(2,1),'LineStyle','--');
    set(c(2,1),'FaceColor',[1 1 1]);
    set(c(2,1),'LineStyle','--');
    
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
    global sys sistems
    h=Parametros_desviaciones;
    uiwait(h);
    [m n]=size(sistems);
    [A,B,C,D,F] = polydata(sys);
    num1=B;
    den1=conv(A,F);
    set(handles.num1,'string',poly2distr(num1));
    set(handles.den1,'string',poly2distr(den1));
    sistems(1,n)={sys};
    
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object deletion, before destroying properties.
function axes4_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
    global sys datos_id
    val=get(hObject,'value');
    if val==1
        set(handles.popupmenu5,'Enable','on');
        set(handles.pushbutton20,'Enable','on');
        set(handles.pushbutton21,'Enable','on');
        set(handles.pushbutton22,'Enable','on');
        set(handles.comparar,'Enable','off');
        set(handles.pushbutton14,'Enable','off');
        set(handles.pushbutton15,'Enable','off');
        set(handles.pushbutton16,'Enable','off');
        set(handles.pushbutton17,'Enable','off');
        set(handles.pushbutton19,'Enable','off');
        set(handles.validar,'Enable','off');
       
        
    else
        set(handles.popupmenu5,'Enable','off','value',1);
        set(handles.pushbutton20,'Enable','off');
        set(handles.pushbutton21,'Enable','off');
        set(handles.pushbutton22,'Enable','off');
        [A,B,C,D,F] = polydata(sys);
        num1=B;
        den1=conv(A,F);
        set(handles.num1,'string',poly2str(num1,'z'));
        set(handles.den1,'string',poly2str(den1,'z'));
        set(handles.comparar,'Enable','on');
        set(handles.pushbutton14,'Enable','on');
        set(handles.pushbutton15,'Enable','on');
        set(handles.pushbutton16,'Enable','on');
        set(handles.pushbutton17,'Enable','on');
        set(handles.pushbutton19,'Enable','on');
        set(handles.validar,'Enable','on');
    end
        
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
    global sys datos_id ft
    [A,B,C,D,F] = polydata(sys);
    num1=B;
    den1=conv(A,F);
    ft=tf(num1,den1,datos_id.Ts,'variable','z^-1');
    
    val=get(hObject,'value');
    nombres=get(hObject,'string');
    ft=d2c(ft,nombres{val,1});
    [num1 den1]=tfdata(ft);
    set(handles.num1,'string',poly2str(num1{1},'s'));
    set(handles.den1,'string',poly2str(den1{1},'s'));
    
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


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
    global datos_val ft
    figure
    compare(datos_val,ft);
    
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
    global ft
    figure
    iopzplot(ft);
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
    global continuo discreto
    continuo=1;
    discreto=0;
    validar;
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
