function salida=fmsalida(sys)
    num_outputs=getfis(sys,'numoutputs');
    salida=cell(3,num_outputs);
    for cont=1:num_outputs
        num_fm_sal=getfis(sys,'numoutputmfs');
        num_fm_sal=num_fm_sal(cont);
        Rango=sys.output(cont).range;
        x=(Rango(1):0.1:Rango(2));
        tipos_sal=cell(1,num_fm_sal);
        nombre_sal=cell(num_fm_sal,1);
        for cont1=1:num_fm_sal
            parametros_sal(cont1,:)=sys.output(cont).mf(cont1).params;
            tipos_sal{cont1}=sys.output(cont).mf(cont1).type;
            nombre_sal{cont1}=sys.output(cont).mf(cont1).name;
        end
        y=zeros(num_fm_sal,length(x));
        for cont1=1:num_fm_sal
            if strcmp(tipos_sal(cont1),'linear')
                y(cont1,:)=srampa(x,parametros_sal(cont1,1),parametros_sal(cont1,2));
            else
                y(cont1,:)=srampa(x,0,parametros_sal(cont1,1));
            end
        end
        salida{1,cont}=y;
        salida{2,cont}=x;
        salida{3,cont}=nombre_sal;
    end