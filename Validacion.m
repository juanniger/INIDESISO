function varargout = Validacion(varargin)
% VALIDACION MATLAB code for Validacion.fig
%      VALIDACION, by itself, creates a new VALIDACION or raises the existing
%      singleton*.
%
%      H = VALIDACION returns the handle to a new VALIDACION or the handle to
%      the existing singleton*.
%
%      VALIDACION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VALIDACION.M with the given input arguments.
%
%      VALIDACION('Property','Value',...) creates a new VALIDACION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Validacion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Validacion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Validacion

% Last Modified by GUIDE v2.5 19-Aug-2014 19:00:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Validacion_OpeningFcn, ...
                   'gui_OutputFcn',  @Validacion_OutputFcn, ...
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


% --- Executes just before Validacion is made visible.
function Validacion_OpeningFcn(hObject, eventdata, handles, varargin)
    global sistemas sistemas_no_lineales anfis_fis
    set(handles.Similitud,'Enable','off')
    set(handles.Desempeno,'Enable','off')
    Desocupado(handles)
    [~,n1]=size(sistemas);
    Cont_Index=1;
    b=[];
    lineales=[];
    if n1>1
        for cont=2:n1
            sys=sistemas{1,cont};
            if  isa(sys,'idpoly') 
                b{1}=class(sys);
                b{2}= sys.Report.Method;
                if sys.IntegrateNoise==1
                    if strcmp(b{2},'ARX')
                        b{2}='ARIX';
                    elseif strcmp(b{2},'ARMAX')
                        b{2}='ARIMAX';
                    elseif strcmp(b{2},'BJ')
                        b{2}='BJ con I';
                    end
                end

                A=sys.a;
                B=sys.b;
                C=sys.c;
                D=sys.d;
                F=sys.f;

                na=length(A)-1;
                nc=length(C)-1;
                nd=length(D)-1;
                nf=length(F)-1;
                nb=length(B);

                if na==0
                    na=[];
                end
                if nb==0
                    nb=[];
                end
                if nc==0
                    nc=[];
                end
                if nd==0
                    nd=[];
                end
                if nf==0
                    nf=[];
                end

                nk=0;
                for cont=1:length(B)
                    if B(cont)==0
                        nk=nk+1;
                    else
                        break
                    end
                end
                nb=nb-nk;

                b{3}=na;
                b{4}=nb;
                b{5}=nc;
                b{6}=nd;
                b{7}=nf;
                b{8}=nk;
                b{9}='';
                b{10}='';
                b{11}='';
                b{12}='';
                b{13}='';
                b{14}=sys.report.fit.FitPercent;
                b{15}=sys.report.fit.FPE;
                b{16}=sys.report.fit.LossFcn;
                b{17}=sys.report.fit.MSE; 
            elseif  isa(sys,'idtf') 
                b{1}=class(sys);
                b{2}= sys.Report.Method;
                Num=sys.num;
                Den=sys.Den;

                np=length(Den)-1;
                nz=length(Num)-1;
                ioDelay=sprintf('%g %s',sys.ioDelay,sys.TimeUnit);
                b{3}='';
                b{4}='';
                b{5}='';
                b{6}='';
                b{7}='';
                b{8}='';
                b{9}=np;
                b{10}=nz;
                b{11}=ioDelay;
                b{12}='';
                b{13}='';
                b{14}=sys.report.fit.FitPercent;
                b{15}=sys.report.fit.FPE;
                b{16}=sys.report.fit.LossFcn;
                b{17}=sys.report.fit.MSE; 
            elseif  isa(sys,'idss') 
                b{1}=class(sys);
                b{2}= sys.Report.Method;
                A=sys.a;
                [m,~]=size(A);
                nx=m;
                b{3}='';
                b{4}='';
                b{5}='';
                b{6}='';
                b{7}='';
                b{8}='';
                b{9}='';
                b{10}='';
                b{11}='';
                b{12}=nx;
                b{13}='';
                b{14}=sys.report.fit.FitPercent;
                b{15}=sys.report.fit.FPE;
                b{16}=sys.report.fit.LossFcn;
                b{17}=sys.report.fit.MSE;
            elseif  isa(sys,'idproc') 
                b{1}=class(sys);
                b{2}= sys.Report.Method;
                b{13}=sys.Type{1};

                ruido_orden=length(sys.NoiseTF.num{1});
                if ruido_orden==2
                    b{13}=sprintf('%s_ARMA1',b{3});
                elseif ruido_orden==3
                    b{13}=sprintf('%s_ARMA2',b{3});
                end
                b{3}='';
                b{4}='';
                b{5}='';
                b{6}='';
                b{7}='';
                b{8}='';
                b{9}='';
                b{10}='';
                b{11}='';
                b{12}='';
                b{14}=sys.report.fit.FitPercent;
                b{15}=sys.report.fit.FPE;
                b{16}=sys.report.fit.LossFcn;
                b{17}=sys.report.fit.MSE;  
            end
        b{18}=false;
        b{19}=Cont_Index;
        b{20}=false;
        b{21}='';
        Cont_Index=Cont_Index+1;
        lineales=[lineales;b];    
        end
    end
    set(handles.Tabla_Modelos_Lineales,'Data',lineales)
    [~,n2]=size(sistemas_no_lineales);
    b=[];
    no_lineales=[];
    if n2>1
        for cont=2:n2
            sys=sistemas_no_lineales{1,cont};
            if  isa(sys,'idnlarx') 
                b{1}=class(sys);
                b{2}=sys.na;
                b{3}=sys.nb;
                b{4}=sys.nk;
                b{5}=class(sys.NonLinearity);
                if isa(sys.NonLinearity,'linear'),
                    if isempty(sys.CustomRegressors)~=1
                        b{6}='';
                        b{7}='';
                        b{11}='CustomRegressors';
                    end
                else
                    b{6}=sys.NonLinearity.NumberOfUnits;
                    b{7}=sys.NonLinearity.LinearTerm;
                    b{11}='';
                end
                b{8}='';
                b{9}='';
                b{10}='';
                b{12}=sys.EstimationInfo.LossFcn;
                b{13}=sys.EstimationInfo.FPE;
        elseif  isa(sys,'idnlhw') 
                b{1}=class(sys);
                b{2}=sys.nb;
                b{3}=sys.nf;
                b{4}=sys.nk;
                b{5}=class(sys.InputNonLinearity);
                if isa(sys.InputNonLinearity,'pwlinear')
                    b{6}=sys.InputNonLinearity.NumberOfUnits;
                    b{7}='';
                elseif isa(sys.InputNonLinearity,'sigmoidnet')
                    b{6}=sys.InputNonLinearity.NumberOfUnits;
                    b{7}=sys.InputNonLinearity.LinearTerm;
                elseif isa(sys.InputNonLinearity,'wavenet')
                    b{6}=sys.InputNonLinearity.NumberOfUnits;
                    b{7}=sys.InputNonLinearity.LinearTerm;
                elseif isa(sys.InputNonLinearity,'saturation')
                    b{6}=num2str(sys.InputNonLinearity.LinearInterval);
                    b{7}='';
                elseif isa(sys.InputNonLinearity,'deadzone')
                    b{6}=num2str(sys.InputNonLinearity.ZeroInterval);
                    b{7}='';
                elseif isa(sys.InputNonLinearity,'unitgain')
                    b{6}='';
                    b{7}='';
                elseif isa(sys.InputNonLinearity,'poly1d')
                    b{6}=sys.InputNonLinearity.Degree;
                    b{7}='';    
                end
                b{8}=class(sys.OutputNonLinearity);
                if isa(sys.OutputNonLinearity,'pwlinear')
                    b{9}=sys.OutputNonLinearity.NumberOfUnits;
                    b{10}='';
                elseif isa(sys.OutputNonLinearity,'sigmoidnet')
                    b{9}=sys.OutputNonLinearity.NumberOfUnits;
                    b{10}=sys.OutputNonLinearity.LinearTerm;
                elseif isa(sys.OutputNonLinearity,'wavenet')
                    b{9}=sys.OutputNonLinearity.NumberOfUnits;
                    b{10}=sys.OutputNonLinearity.LinearTerm;
                elseif isa(sys.OutputNonLinearity,'saturation')
                    b{9}=num2str(sys.OutputNonLinearity.LinearInterval);
                    b{10}='';
                elseif isa(sys.OutputNonLinearity,'deadzone')
                    b{9}=num2str(sys.OutputNonLinearity.ZeroInterval);
                    b{10}='';
                elseif isa(sys.OutputNonLinearity,'unitgain')
                    b{9}='';
                    b{10}='';
                elseif isa(sys.OutputNonLinearity,'poly1d')
                    b{9}=sys.OutputNonLinearity.Degree;
                    b{10}='';    
                end
                b{11}='';
                b{12}=sys.EstimationInfo.LossFcn;
                b{13}=sys.EstimationInfo.FPE;
            end
            b{14}=false;
            b{15}=Cont_Index;
            b{16}=false;
            b{17}='';
            Cont_Index=Cont_Index+1;
            no_lineales=[no_lineales;b];
        end
    end
    set(handles.Tabla_Modelos_No_Lineales,'Data',no_lineales)
    [~,n3]=size(anfis_fis);
    b=[];
    logica_difusa=[];
    if n3>0
        for cont=1:n3
            sys=anfis_fis{1,cont};
            b{1}=sys.type;
            b{2}=sys.andMethod;
            b{3}=sys.orMethod;
            b{4}=sys.defuzzMethod;
            b{5}=sys.impMethod;
            b{6}=sys.aggMethod;
            tipos=getfis(sys,'inmftypes');
            tipos=tipos(1,:);
            b{7}=tipos;
            b{8}=getfis(sys,'numinputmfs');
            tipos=getfis(sys,'outmftypes');
            tipos=tipos(1,:);
            b{9}=tipos;
            b{10}=getfis(sys,'numoutputmfs');
            b{11}=false;
            b{12}=Cont_Index;
            b{13}='';
            Cont_Index=Cont_Index+1;
            logica_difusa=[logica_difusa;b];
        end
    end
    set(handles.Tabla_Logica_Difusa,'Data',logica_difusa)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Validacion (see VARARGIN)

% Choose default command line output for Validacion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Validacion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Validacion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Graficar.
function Graficar_Callback(hObject, eventdata, handles)
global anfis_fis sistemas_no_lineales sistemas datos_val Respuestas error
set(handles.Similitud,'Enable','on')
set(handles.Desempeno,'Enable','on')
Ocupado(handles)
[~,n3]=size(anfis_fis);
[~,n2]=size(sistemas_no_lineales);
[~,n1]=size(sistemas);

if n2==0
    n2=1;
end
if n1==0
    n1=1;
end
index=(1:n1+n2+n3-2);
m=length(datos_val.u);
Respuestas=zeros(m,n1+n2+n3-2);
Systemas=cell(1,n1+n2+n3-2);
t=(0:datos_val.TS:(length(datos_val.y)-1)*datos_val.TS);
cont_res=1;

for cont=2:n1
    Respuestas(:,cont_res)=lsim(sistemas{1,cont},datos_val.u,t);
    Systemas{cont_res}=sistemas{1,cont};
    cont_res=cont_res+1;
end

for cont=2:n2
    Respuestas(:,cont_res)=sim(sistemas_no_lineales{1,cont},datos_val.u);
    Systemas{cont_res}=sistemas_no_lineales{1,cont};
    cont_res=cont_res+1;
end

for cont=1:n3
    Respuestas(:,cont_res)=evalfis(datos_val.u,anfis_fis{1,cont});
    Systemas{cont_res}=anfis_fis{1,cont};
    cont_res=cont_res+1;
end

dat=[];
for cont=1:n1+n2+n3-2
    dat=[dat,datos_val.y];
end
error=Respuestas-dat;



if ishold(handles.Respuestas_Validacion)~=1
    hold(handles.Respuestas_Validacion)
end
plot(handles.Respuestas_Validacion,t,Respuestas)
plot(handles.Respuestas_Validacion,t,datos_val.y,'LineWidth',1)
legend(handles.Respuestas_Validacion,num2str(index'))


plot(handles.Respuestas_Error,t,error)
legend(handles.Respuestas_Error,num2str(index'))

data1=get(handles.Tabla_Modelos_Lineales,'Data');
data2=get(handles.Tabla_Modelos_No_Lineales,'Data');
data3=get(handles.Tabla_Logica_Difusa,'Data');

[m,~]=size(data1);
for cont=1:m
    data1{cont,18}=true;
end
[m,~]=size(data2);
for cont=1:m
    data2{cont,14}=true;
end
[m,~]=size(data3);
for cont=1:m
    data3{cont,11}=true;
end
set(handles.Tabla_Modelos_Lineales,'Data',data1)
set(handles.Tabla_Modelos_No_Lineales,'Data',data2)
set(handles.Tabla_Logica_Difusa,'Data',data3)
Desocupado(handles);

function Tabla_Modelos_Lineales_CellSelectionCallback(hObject, eventdata, handles)
function Tabla_Modelos_Lineales_CellEditCallback(hObject, eventdata, handles)
global Respuestas error datos_val sistemas sistemas_no_lineales

copia_Respuesta=Respuestas;
copia_error=error;
data1=get(handles.Tabla_Modelos_Lineales,'Data');
data2=get(handles.Tabla_Modelos_No_Lineales,'Data');
data3=get(handles.Tabla_Logica_Difusa,'Data');
t=(0:datos_val.TS:(length(datos_val.y)-1)*datos_val.TS);

[m1,~]=size(data1);
[m2,~]=size(data2);
[m3,~]=size(data3);
plotear=cell(m1+m2+m3,1);
indices=cell(m1+m2+m3,1);
residuos=cell(m1+m2,1);
for cont=1:m1+m2+m3
    if cont<=m1
        plotear(cont)=data1(cont,18);
        indices(cont)=data1(cont,19);
        residuos(cont)=data1(cont,20);
    elseif cont<=m1+m2
        plotear(cont)=data2(cont-m1,14);
        indices(cont)=data2(cont-m1,15);
        residuos(cont)=data2(cont-m1,16);
    elseif cont<=m1+m2+m3
        plotear(cont)=data3(cont-m1-m2,11);
        indices(cont)=data3(cont-m1-m2,12);
    end
end

m=length(residuos);
for cont=1:m
    if cont<=m1
        if residuos{cont}==1
            sys=sistemas{1,cont+1};
            figure()
            resid(sys,datos_val)
            data1{cont,20}=false;
            set(handles.Tabla_Modelos_Lineales,'Data',data1)
            return
        end
    elseif cont<=m1+m2
        if residuos{cont}==1
            sys=sistemas_no_lineales{1,cont+1-m1};
            figure()
            resid(sys,datos_val)
            data2{cont-m1,16}=false;
            set(handles.Tabla_Modelos_No_Lineales,'Data',data2)
            return
        end
    end
end

m=length(plotear);

for cont=m:-1:1
    if plotear{cont}==false
        indices(cont)=[];
        copia_Respuesta(:,cont)=[];
        copia_error(:,cont)=[];
    end
end

m=length(indices);
for cont=1:m
    index(cont)=indices{cont};
end
cla(handles.Respuestas_Validacion)
cla(handles.Respuestas_Error)
if ishold(handles.Respuestas_Validacion)~=1
    hold(handles.Respuestas_Validacion)
end
plot(handles.Respuestas_Validacion,t,datos_val.y,'LineWidth',1)
if m>0
    plot(handles.Respuestas_Validacion,t,copia_Respuesta)
    plot(handles.Respuestas_Error,t,copia_error)
    legend(handles.Respuestas_Error,num2str(index'))
    legend(handles.Respuestas_Validacion,num2str(index'))
end






function Tabla_Modelos_No_Lineales_CellSelectionCallback(hObject, eventdata, handles)
function Tabla_Modelos_No_Lineales_CellEditCallback(hObject, eventdata, handles)
global Respuestas error  sistemas sistemas_no_lineales datos_val

copia_Respuesta=Respuestas;
copia_error=error;
data1=get(handles.Tabla_Modelos_Lineales,'Data');
data2=get(handles.Tabla_Modelos_No_Lineales,'Data');
data3=get(handles.Tabla_Logica_Difusa,'Data');
t=(0:datos_val.TS:(length(datos_val.y)-1)*datos_val.TS);

[m1,~]=size(data1);
[m2,~]=size(data2);
[m3,~]=size(data3);
plotear=cell(m1+m2+m3,1);
indices=cell(m1+m2+m3,1);
residuos=cell(m1+m2,1);
for cont=1:m1+m2+m3
    if cont<=m1
        plotear(cont)=data1(cont,18);
        indices(cont)=data1(cont,19);
        residuos(cont)=data1(cont,20);
    elseif cont<=m1+m2
        plotear(cont)=data2(cont-m1,14);
        indices(cont)=data2(cont-m1,15);
        residuos(cont)=data2(cont-m1,16);
    elseif cont<=m1+m2+m3
        plotear(cont)=data3(cont-m1-m2,11);
        indices(cont)=data3(cont-m1-m2,12);
    end
end

m=length(residuos);
for cont=1:m
    if cont<=m1
        if residuos{cont}==1
            sys=sistemas{1,cont+1};
            figure()
            resid(sys,datos_val)
            data1{cont,20}=false;
            set(handles.Tabla_Modelos_Lineales,'Data',data1)
            return
        end
    elseif cont<=m1+m2
        if residuos{cont}==1
            sys=sistemas_no_lineales{1,cont+1-m1};
            figure()
            resid(sys,datos_val)
            data2{cont-m1,16}=false;
            set(handles.Tabla_Modelos_No_Lineales,'Data',data2)
            return
        end
    end
end

m=length(plotear);


for cont=m:-1:1
    if plotear{cont}==false
        indices(cont)=[];
        copia_Respuesta(:,cont)=[];
        copia_error(:,cont)=[];
    end
end

m=length(indices);
for cont=1:m
    index(cont)=indices{cont};
end
cla(handles.Respuestas_Validacion)
cla(handles.Respuestas_Error)
if ishold(handles.Respuestas_Validacion)~=1
    hold(handles.Respuestas_Validacion)
end
plot(handles.Respuestas_Validacion,t,datos_val.y,'LineWidth',1)
if m>0
    plot(handles.Respuestas_Validacion,t,copia_Respuesta)
    plot(handles.Respuestas_Error,t,copia_error)
    legend(handles.Respuestas_Error,num2str(index'))
    legend(handles.Respuestas_Validacion,num2str(index'))
end

function Tabla_Logica_Difusa_CellSelectionCallback(hObject, eventdata, handles)
function Tabla_Logica_Difusa_CellEditCallback(hObject, eventdata, handles)
global Respuestas error datos_val

copia_Respuesta=Respuestas;
copia_error=error;
data1=get(handles.Tabla_Modelos_Lineales,'Data');
data2=get(handles.Tabla_Modelos_No_Lineales,'Data');
data3=get(handles.Tabla_Logica_Difusa,'Data');
t=(0:datos_val.TS:(length(datos_val.y)-1)*datos_val.TS);

[m1,~]=size(data1);
[m2,~]=size(data2);
[m3,~]=size(data3);
plotear=cell(m1+m2+m3,1);
indices=cell(m1+m2+m3,1);
for cont=1:m1+m2+m3
    if cont<=m1
        plotear(cont)=data1(cont,18);
        indices(cont)=data1(cont,19);
    elseif cont<=m1+m2
        plotear(cont)=data2(cont-m1,14);
        indices(cont)=data2(cont-m1,15);
    elseif cont<=m1+m2+m3
        plotear(cont)=data3(cont-m1-m2,11);
        indices(cont)=data3(cont-m1-m2,12);
    end
end

m=length(plotear);


for cont=m:-1:1
    if plotear{cont}==false
        indices(cont)=[];
        copia_Respuesta(:,cont)=[];
        copia_error(:,cont)=[];
    end
end

m=length(indices);
for cont=1:m
    index(cont)=indices{cont};
end
cla(handles.Respuestas_Validacion)
cla(handles.Respuestas_Error)
if ishold(handles.Respuestas_Validacion)~=1
    hold(handles.Respuestas_Validacion)
end
plot(handles.Respuestas_Validacion,t,datos_val.y,'LineWidth',1)
if m>0
    plot(handles.Respuestas_Validacion,t,copia_Respuesta)
    plot(handles.Respuestas_Error,t,copia_error)
    legend(handles.Respuestas_Error,num2str(index'))
    legend(handles.Respuestas_Validacion,num2str(index'))
end


% --- Executes on button press in Similitud.
function Similitud_Callback(hObject, eventdata, handles)
global datos_val Respuestas

data1=get(handles.Tabla_Modelos_Lineales,'Data');
data2=get(handles.Tabla_Modelos_No_Lineales,'Data');
data3=get(handles.Tabla_Logica_Difusa,'Data');

[m1,~]=size(data1);
[m2,~]=size(data2);
[m3,~]=size(data3);

error=zeros(m1+m2+m3,1);
den=norm(datos_val.y-mean(datos_val.y));
for cont=1:m1+m2+m3
    e=norm(datos_val.y-Respuestas(:,cont));
    error(cont)=100*(1-e/den);
end

for cont=1:m1+m2+m3
    if cont<=m1
        data1{cont,21}=error(cont);
    elseif cont<=m1+m2
        data2{cont-m1,17}=error(cont);
    elseif cont<=m1+m2+m3
        data3{cont-m1-m2,13}=error(cont);
    end
end
set(handles.Tabla_Modelos_Lineales,'Data',data1)
set(handles.Tabla_Modelos_No_Lineales,'Data',data2)
set(handles.Tabla_Logica_Difusa,'Data',data3)
    
% hObject    handle to Similitud (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Desempeno.
function Desempeno_Callback(hObject, eventdata, handles)
global error Respuestas Datos


[~,n]=size(error);
ISE=zeros(1,n);
ITSE=zeros(1,n);
ISTSE=zeros(1,n);
IAE=zeros(1,n);
ITAE=zeros(1,n);
MCE=zeros(1,n);
Media=zeros(1,n);
Media_error=zeros(1,n);
Des_Est=zeros(1,n);
Des_Est_error=zeros(1,n);
Var=zeros(1,n);
Var_error=zeros(1,n);
Covar=zeros(1,n);
Correlacion=zeros(1,n);
N=length(error(:,1));
for cont=1:n
    ISE(cont)=sum(error(:,cont).^2);
    ITSE(cont)=sum(cont*(error(:,cont).^2));
    ISTSE(cont)=sum(cont^2*(error(:,cont).^2));
    IAE(cont)=sum(abs(error(:,cont)));
    ITAE(cont)=sum(cont*(abs(error(:,cont))));
    MCE(cont)=sqrt(ISE(cont)/N);
    Media(cont)=sum(Respuestas(:,cont))/N;
    Media_error(cont)=sum(error(:,cont))/N;
    Des_Est(cont)=sqrt((sum((Respuestas(:,cont)-Media(cont)).^2)/N));
    Des_Est_error(cont)=sqrt((sum((error(:,cont)-Media(cont)).^2)/N));
    Var(cont)=Des_Est(cont)^2;
    Var_error(cont)=Des_Est_error(cont)^2;
    Covar(cont)=sum((Respuestas(:,cont)-Media(cont)).*(error(:,cont)-Media_error(cont)))/N;
    Correlacion(cont)=Covar(cont)/(Des_Est(cont)*Des_Est_error(cont));
end

Datos=[ISE;ITSE;ISTSE;IAE;ITAE;MCE;Media;Des_Est;Var;Covar;Correlacion];
Datos_Validacion_Interfaz;
% hObject    handle to Desempeno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
