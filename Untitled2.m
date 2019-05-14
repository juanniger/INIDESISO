if  isa(sys,'idtf') 
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
    b{12}=nx;
    b{13}='';
    b{14}=sys.report.fit.FitPercent;
    b{15}=sys.report.fit.FPE;
    b{16}=sys.report.fit.LossFcn;
    b{17}=sys.report.fit.MSE; 
end