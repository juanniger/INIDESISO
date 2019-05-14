%---------------------Elaboro: Juan Tapia Tinoco---------------------------
%----------------Asesor: M.I. Salvador Ramirez Zavala----------------------
%----------Universidad Michoacana de San Nicolas de Hidalgo----------------
%-----------------Facultad de Ingenieria Electrica-------------------------

%Descripcion:La funcion  poly2str_digital  recibe como entrada un vector de
%tamaño n que  contiene  los  coeficientes  de un  polinomio de grado n. El
%polinomio   representa  el  denominador  o  numerador  de  una  funcion de
%transferencia discreta por  lo que la  variable asociada al polinomio es z
%con potencias  negativas que van desde la potencia 0 hasta la potencia -n.
%La salida de la funcion es un estring de la forma:
%                             a0+a1z^-1+a2z^-2+..+anz^-n

function [salida] = poly2str_digital(entrada)

salida='';
Primer_Termino=0;                                                                  %La variable primer termino se emplea para no agregar el signo (+) en caso de ser positivo al primer termino del string de salida
if isnumeric(entrada)                                                              %Verificamos que el vector de entrada sea del tipo numerico.     
    tam=length(entrada);
    for cont=1:tam
        if entrada(cont)~=0                                                        %Si el coeficientes es diferente de cero entonces aparecera en el string de salida.         
            if entrada(cont)>0                                                     %Si es positivo el coeficiente entonces el termino tambien sera positivo y sera precedido del signo(+); 
                if Primer_Termino==1                                               %Si el primer termino diferente de cero ya fue añadido al string entonces la variable Primer_Termino toma el valor de 1. 
                    aux=sprintf('+ %g z^-%g',abs(entrada(cont)),cont-1);
                    salida=strjoin({salida,aux});                        
                elseif Primer_Termino==0                                           %Si el primer termino es positivo entonces no sera precedido del signo (+) 
                    if cont==1                                                     %Si el primer termino diferente de cero coincide con el primer coeficiente de la funcion entonces no sera acompañado de la variable z ya que la potencia para la primer posicion del vector es cero.
                        aux=sprintf('%g',abs(entrada(cont)));
                        salida=strjoin({salida,aux});
                    else
                        aux=sprintf('%g z^-%g',abs(entrada(cont)),cont-1);
                        salida=strjoin({salida,aux});
                    end
                end
            else                                                                    %En caso de que el coeficiente sea menor que cero, entonces es precedido por el signo (-).
               if cont==1 
                   aux=sprintf('- %g',abs(entrada(cont)));
                   salida=strjoin({salida,aux}); 
               else
                   aux=sprintf('- %g z^-%g',abs(entrada(cont)),cont-1);
                   salida=strjoin({salida,aux});
               end;
            end
            Primer_Termino=1;
        end
    end
end