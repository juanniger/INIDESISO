function d=subsystemCounter(sub)
str=sprintf('%s subsystem supports:\n',sub.SubsystemType)
a=sprintf('Rates from %g to %i scans/sec\n',min(sub.RateLimit),max(sub.RateLimit));
tam=length(sub.ChannelNames);
b=sprintf('%g channels (%s - %s)\n',sub.NumberOfChannelsAvailable,sub.ChannelNames{1},sub.ChannelNames{tam});

r=sub.MeasurementTypesAvailable;
tam=length(r);
e=[];
f=[];
for cont=1:tam
    c=r{cont};
    e=sprintf('%s  ',c);
    f=sprintf('%s %s',f,e);
end

d=sprintf('%s%s%s%s\n\n',str,a,b,f);