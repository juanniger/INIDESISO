%---------------------Elaboro: Juan Tapia Tinoco---------------------------
%----------------Asesor: M.I. Salvador Ramirez Zavala----------------------
%----------Universidad Michoacana de San Nicolas de Hidalgo----------------
%-----------------Facultad de Ingenieria Electrica-------------------------

%Descripcion:La presente funcion se encarga de crear un string en la 
%variable salida que contiene los datos relevantes del subsistema que se 
%manda a la funcion en la variable sub, dependiendo del subsistema se 
%tienen 5 casos diferentes ya que cada subsistema cuenta con diferentes 
%caracteristicas. Ademas que tipo de subsistema se envio a la funcion 
%devolviendo un numero entre el 1 y el 5

%                       1:Analog Input Subsystem
%                       2:Analog Output Subsystem
%                       3:Digital IO Subsystem
%                       4:Counter Input Subsystem
%                       5:Counter Output Subsystem

function [salida,tipo]=subsystem(sub)

    subsistema=sprintf('\n\n%s subsystem supports:\n',sub.SubsystemType);                                                                                   %En susbsistema se guarda el tipo de subsistema que recibe la funcion como variable de entrada, pudiendo ser: AnalogInput, AnalogOutput, DigitalSubsystem, CouterInput o CouterOutput.

    if strcmp(sub.SubsystemType,'AnalogInput')                                                                                                              %En caso de que el subsistema sea del tipo de entrada analogica se cumple esta condicional. 
        tipo=1;
        No_Rangos=length(sub.RangesAvailable);                                                                                                              %No_Rangos contiene el numero de rangos de entrada disponibles.
        Rangos=sprintf('%d Ranges supported \n',No_Rangos);                                                                                                 %Rangos es una variable tipo string donde se guardan los rangos disponibles, el primer renglon del string despliega el numero de Rangos disponibles.
        for cont=1:No_Rangos
            Rangos_aux=sprintf('%f to %f Volts \n',sub.RangesAvailable(1,cont).Min,sub.RangesAvailable(1,cont).Max);                                        %Rangos_aux es un string que contiene el valor minimo y maximo de el rango equivalente a la iteracion en que se encuentre el ciclo for.
            Rangos=horzcat(Rangos,Rangos_aux);                                                                                                              %Concatena horizontalmente la variable Rangos y Rangos_aux.
        end
        Rates=sprintf('Rates from %f to %f scans/sec \n',sub.RateLimit(1),sub.RateLimit(2));
        Canales=sprintf('%d channels (%s-%s)\n',sub.NumberOfChannelsAvailable,sub.ChannelNames{1},sub.ChannelNames{sub.NumberOfChannelsAvailable});
        No_Tipo_de_mediciones=length(sub.MeasurementTypesAvailable);                                                                                        %No_Tipo_Mediciones es una variable que almacena el numero de tipos de mediciones disponibles para en la tarjeta.
        Tipo_de_mediciones='';                                                                                                                              %Tipo_de_mediciones es una variable tipo string donde se alamacenaran los tipos de mediciones disponibles en la tarjeta.
        for cont=1:No_Tipo_de_mediciones
            if cont==No_Tipo_de_mediciones
                Tipo_de_mediciones_aux=sprintf('%s measurement type',sub.MeasurementTypesAvailable{cont});                                                  %Tipo_de_mediciones_aux es el tipo de medicion de los No_tipo_Mediciones disponibles en la tarjeta.En el caso donde se entra a la ultima iteracion se le agrega la frase 'measurement type'   
            else
                Tipo_de_mediciones_aux=sprintf('%s, ',sub.MeasurementTypesAvailable{cont});                                                                 
            end
            Tipo_de_mediciones=strcat(Tipo_de_mediciones,Tipo_de_mediciones_aux);                                                                           %Concatena la variable Tipo_de_mediciones y Tipo_de_mediciones_aux.
        end
        salida=horzcat(subsistema,Rangos,Rates,Canales,Tipo_de_mediciones);
                                                                                                                                                            %Las demas condicionales repiten algunas de las funciones, solo que algunos de los subsistemas no tienen algunas de las variables. Esa es la razon por lo que ya no se comentan.
    elseif strcmp(sub.SubsystemType,'AnalogOutput') 
        tipo=2;
        No_Rangos=length(sub.RangesAvailable);                                                                          
        Rangos=sprintf('%d Ranges supported \n',No_Rangos);                                              
        for cont=1:No_Rangos
            Rangos_aux=sprintf('%f to %f Volts \n',sub.RangesAvailable(1,cont).Min,sub.RangesAvailable(1,cont).Max);  
            Rangos=horzcat(Rangos,Rangos_aux);                                                                          
        end
        Rates=sprintf('Rates from %f to %f scans/sec \n',sub.RateLimit(1),sub.RateLimit(2));
        Canales=sprintf('%d channels (%s-%s)\n',sub.NumberOfChannelsAvailable,sub.ChannelNames{1},sub.ChannelNames{sub.NumberOfChannelsAvailable});
        No_Tipo_de_mediciones=length(sub.MeasurementTypesAvailable);                                              
        Tipo_de_mediciones='';
        for cont=1:No_Tipo_de_mediciones
            if cont==No_Tipo_de_mediciones
                Tipo_de_mediciones_aux=sprintf('%s measurement type\n\n',sub.MeasurementTypesAvailable{cont});      
            else
                Tipo_de_mediciones_aux=sprintf('%s, ',sub.MeasurementTypesAvailable{cont});  
            end
            Tipo_de_mediciones=strcat(Tipo_de_mediciones,Tipo_de_mediciones_aux);                                                      
        end
        if sub.RateLimit(1)==0 && sub.RateLimit(2)==0
            salida=horzcat(subsistema,Rangos,Canales,Tipo_de_mediciones);
        else
            salida=horzcat(subsistema,Rangos,Rates,Canales,Tipo_de_mediciones);
        end
    elseif strcmp(sub.SubsystemType,'DigitalIO') 
        tipo=3;
        Canales=sprintf('%d channels (%s-%s)\n',sub.NumberOfChannelsAvailable,sub.ChannelNames{1},sub.ChannelNames{sub.NumberOfChannelsAvailable});
        No_Tipo_de_mediciones=length(sub.MeasurementTypesAvailable);                                             
        Tipo_de_mediciones='';
        for cont=1:No_Tipo_de_mediciones
            if cont==No_Tipo_de_mediciones
                Tipo_de_mediciones_aux=sprintf('%s measurement type\n\n',sub.MeasurementTypesAvailable{cont});      
            else
                Tipo_de_mediciones_aux=sprintf('%s, ',sub.MeasurementTypesAvailable{cont});  
            end
            Tipo_de_mediciones=strcat(Tipo_de_mediciones,Tipo_de_mediciones_aux);                                                                          
        end
        
        salida=horzcat(subsistema,Canales,Tipo_de_mediciones);
    elseif strcmp(sub.SubsystemType,'CounterInput') 
        tipo=4;
        Rates=sprintf('Rates from %f to %f scans/sec \n',sub.RateLimit(1),sub.RateLimit(2));
        Canales=sprintf('%d channels (%s-%s)\n',sub.NumberOfChannelsAvailable,sub.ChannelNames{1},sub.ChannelNames{sub.NumberOfChannelsAvailable});
        No_Tipo_de_mediciones=length(sub.MeasurementTypesAvailable);                                              
        Tipo_de_mediciones='';
        for cont=1:No_Tipo_de_mediciones
            if cont==No_Tipo_de_mediciones
                Tipo_de_mediciones_aux=sprintf('%s measurement type\n\n',sub.MeasurementTypesAvailable{cont});      
            else
                Tipo_de_mediciones_aux=sprintf('%s, ',sub.MeasurementTypesAvailable{cont});  
            end
            Tipo_de_mediciones=strcat(Tipo_de_mediciones,Tipo_de_mediciones_aux);                                                                        
        end
        
        salida=horzcat(subsistema,Rates,Canales,Tipo_de_mediciones);
    elseif strcmp(sub.SubsystemType,'CounterOutput') 
        tipo=5;
        Rates=sprintf('Rates from %f to %f scans/sec \n',sub.RateLimit(1),sub.RateLimit(2));
        Canales=sprintf('%d channels (%s-%s)\n',sub.NumberOfChannelsAvailable,sub.ChannelNames{1},sub.ChannelNames{sub.NumberOfChannelsAvailable});
        No_Tipo_de_mediciones=length(sub.MeasurementTypesAvailable);                                             
        Tipo_de_mediciones='';
        for cont=1:No_Tipo_de_mediciones
            if cont==No_Tipo_de_mediciones
                Tipo_de_mediciones_aux=sprintf('%s measurement type\n\n',sub.MeasurementTypesAvailable{cont});      
            else
                Tipo_de_mediciones_aux=sprintf('%s, ',sub.MeasurementTypesAvailable{cont});  
            end
            Tipo_de_mediciones=strcat(Tipo_de_mediciones,Tipo_de_mediciones_aux);       
        end
        
        salida=horzcat(subsistema,Rates,Canales,Tipo_de_mediciones);
    end
