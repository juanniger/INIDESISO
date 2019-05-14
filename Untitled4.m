if  isa(sys,'idproc') 
    b{1}=class(sys);
    b{2}= sys.Report.Method;
    b{3}=sys.Type{1};
    
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