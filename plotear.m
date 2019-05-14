function plotear(src,event)
global ejes d_leidos
if src.ScansAcquired~=d_leidos
    hold on;
    plot(ejes,event.TimeStamps,event.Data);
    hold off;
end

