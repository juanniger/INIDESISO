function sal=promediador(dat)

[m,n]=size(dat);
sal=zeros(m,n);
for cont=1:n
    for cont1=1:m
        if cont1<=10 && cont1>=1
            sal(cont1,cont)=sum(dat(1:cont1,cont))/cont1;
        else
            sal(cont1,cont)=sum(dat(cont1-9:cont1,cont)/10);
        end
    end
end
