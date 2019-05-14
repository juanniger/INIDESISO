function [num1 den1 ym sys1]=sys_ARXMAX(id_data,na,nb,nc,nk)

sys1=armax(id_data,[na nb nc nk]);
sys=d2c(sys1);
[num1,den1]=tfdata(sys);
ft=tf(num1,den1);
t=(0:id_data.Ts:(length(id_data.y)-1)*id_data.Ts);
ym=lsim(ft,id_data.u,t);
