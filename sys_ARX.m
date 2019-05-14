function [num1,den1,ym,sys1]=sys_ARX(id_data,na,nb,nk)

sys1=arx(id_data,[na nb nk]);
%sys=d2c(sys1);
%[num1,den1]=tfdata(sys);
%ft=tf(num1,den1);
t=(0:id_data.Ts:(length(id_data.y)-1)*id_data.Ts);
ym=lsim(ft,id_data.u,t);
