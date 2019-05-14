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
end
b    