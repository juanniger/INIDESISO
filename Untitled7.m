if  isa(sys,'idnlhw') 
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
b    
    
%     if isa(sys.NonLinearity,'linear'),
%         if isempty(sys.CustomRegressors)~=1
%             b{6}='';
%             b{7}='';
%             b{8}='CustomRegressors';
%         end
%     else
%         b{6}=sys.NonLinearity.NumberOfUnits;
%         b{7}=sys.NonLinearity.LinearTerm;
%         b{8}='';
%     end
   