numreglas=getfis(fis1,'numrules');
entrada=fmentrada(fis1);
salida=fmsalida(fis1);
antecedentes=cell(27,1);
consecuencias=cell(27,1);
peso=cell(27,1);
conecciones=cell(27,1);
for cont=1:numreglas
    antecedentes{cont}=fis1.rule(cont).antecedent;
    consecuencias{cont}=fis1.rule(cont).consequent;
    peso{cont}=fis1.rule(cont).weight;
    conecciones{cont}=fis1.rule(cont).connection;
end

numentradas=getfis(fis1,'numinputs');
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
            arreglo_entrada{cont,cont1}=sprintf('Si (Entrada%g  es %s)',cont1,mfs_in{cont1,(antecedentes{cont}(cont1))});
        elseif cont1>1
            if  conecciones{cont}
                ope='y';
            else
                ope='o';
            end
            arreglo_entrada{cont,cont1}=sprintf('%s (Entrada%g  es %s)',ope,cont1,mfs_in{cont1,(antecedentes{cont}(cont1))});
        end         
                
    end
end


reglas=cell(numreglas,1);
for cont=1:numreglas
    reglas{cont}=strjoin({arreglo_entrada{cont,:},arreglo_salida{cont}});
end