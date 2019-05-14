function u=striangular(t,amplitud,frecuencia,ciclo_trabajo,offset)
w = 2*pi*frecuencia;
u= amplitud/2*sawtooth(w*t,ciclo_trabajo/100)+amplitud/2+offset;
u=u';
end