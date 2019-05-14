function u=sseno(t,amplitud,frecuencia,fase_angulo,offset)
u=amplitud*sin(2*pi*frecuencia*t+fase_angulo*pi/180)+offset;
u=u';
end