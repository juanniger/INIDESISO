function u=scuadrada(t,amplitud,frecuencia,ciclo_trabajo,offset)

w = 2*pi*frecuencia;
u= amplitud/2*square(w*t,ciclo_trabajo)+amplitud/2+offset;
u=u';
end