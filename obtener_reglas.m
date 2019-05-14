function reglas=obtener_reglas(sys)
    numreglas=getfis(sys,'numrules');
    entrada=fmentrada(sys);
    salida=fmsalida(sys);
    antecedentes=cell(numreglas,1);
    consecuencias=cell(numreglas,1);
    peso=cell(numreglas,1);
    conecciones=cell(numreglas,1);
    for cont=1:numreglas
        antecedentes{cont}=[sys.rule(cont).antecedent];
        consecuencias{cont}=sys.rule(cont).consequent;
        peso{cont}=sys.rule(cont).weight;
        conecciones{cont}=sys.rule(cont).connection;
    end

    numentradas=getfis(sys,'numinputs');
    mfs_in=[];
    for cont=1:numentradas
        mfs_in=[mfs_in,entrada{3,cont}];
    end
    mfs_out=salida{3};

    arreglo_salida=cell(numreglas,1);
    arreglo_entrada=cell(numreglas,numentradas);


    for cont=1:numreglas
        arreglo_salida{cont}=sprintf('Entonces (Salida  es %s)',mfs_out{(consecuencias{cont})});
        for cont1=1:numentradas
            if cont1==1
                if numentradas==1
                    arreglo_entrada{cont}=sprintf('Si (Entrada%g  es %s)',cont1,mfs_in{(antecedentes{cont}),cont1});
                else
                    arreglo_entrada{cont,cont1}=sprintf('Si (Entrada%g  es %s)',cont1,mfs_in{(antecedentes{cont}(cont1)),cont1});
                end
            elseif cont1>1
                if  conecciones{cont}
                    ope='y';
                else
                    ope='o';
                end
                if numentradas==1
                    arreglo_entrada{cont}=sprintf('%s (Entrada%g  es %s)',ope,cont1,mfs_in{(antecedentes{cont}),cont1});
                else
                    arreglo_entrada{cont,cont1}=sprintf('%s (Entrada%g  es %s)',ope,cont1,mfs_in{(antecedentes{cont}(cont1)),cont1});
                end
            end    
            

        end
    end


    reglas=cell(numreglas,1);
    for cont=1:numreglas
        reglas{cont}=strjoin({arreglo_entrada{cont,:},arreglo_salida{cont}});
    end