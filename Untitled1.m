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
    b{9}=np;
    b{10}=nz;
    b{11}=ioDelay;
    b{12}=nx;
    b{13}='';
    b{14}=sys.report.fit.FitPercent;
    b{15}=sys.report.fit.FPE;
    b{16}=sys.report.fit.LossFcn;
    b{17}=sys.report.fit.MSE; 
end