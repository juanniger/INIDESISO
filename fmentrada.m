function salida=fmentrada(sys)
    num_inputs=getfis(sys,'numinputs');
    salida=cell(3,num_inputs);
    for cont=1:num_inputs
        num_fm_ent=getfis(sys,'numinputmfs');
        num_fm_ent=num_fm_ent(cont);
        Rango=sys.input(cont).range;
        x=(Rango(1):0.1:Rango(2));
        tipos_ent=cell(1,num_fm_ent);
        nombre_ent=cell(num_fm_ent,1);
        for cont1=1:num_fm_ent
            parametros_ent(cont1,:)=sys.input(cont).mf(cont1).params;
            tipos_ent{cont1}=sys.input(cont).mf(cont1).type;
            nombre_ent{cont1}=sys.input(cont).mf(cont1).name;
        end
        y=zeros(num_fm_ent,length(x));
        for cont1=1:num_fm_ent
            y(cont1,:)=evalmf(x,parametros_ent(cont1,:),tipos_ent{cont1});
        end
        salida{1,cont}=y;
        salida{2,cont}=x;
        salida{3,cont}=nombre_ent;
    end