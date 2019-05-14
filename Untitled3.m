if  isa(sys,'idss') 
    b{1}=class(sys);
    b{2}= sys.Report.Method;
    A=sys.a;
    [m,n]=size(A);
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
end