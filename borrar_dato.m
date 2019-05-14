function [a,m]=borrar_dato(a,borrar)
    a(borrar,:)=[];   
    [m,~]=size(a);    
    for cont=1:m
        a{cont,1}=cont;
    end
