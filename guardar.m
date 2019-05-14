function guardar(src,event)
global data t_o d_leidos 

if src.ScansAcquired~=d_leidos
    data=[data ;event.Data]; 
    t_o=[t_o; event.TimeStamps];
    d_leidos=src.ScansAcquired;
end

