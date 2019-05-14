function imprimir(fid,data)

[m n]=size(data);
for cont=1:m
    fprintf(fid,'%i %i %i\n',data(cont,1),data(cont,2),data(cont,3));
end