 x=datos_id.u;
 y=datos_id.y;
 trnData=[x y];
 numMFS=3;
 mfType='gbellmf';
 epoch_n=10;
 in_fis=genfis1(trnData,numMFS,mfType,'constant');
 out_fis=anfis(trnData,in_fis,epoch_n,[0 0 0 0]);
 t=(0:datos_id.TS:(length(datos_id.y)-1)*datos_id.TS);
 plot(t,y,t,evalfis(x,out_fis))
 legend('Training Data','ANFIS Output')

mf_in_name=out_fis.input.mf.name;
mf_in_type=out_fis.input.mf.type;
mf_in_params=out_fis.input.mf.params;
rango=out_fis.output.range;

x=(rango(1):0.1:rango(2));
mf1=evalmf(x,mf_in_params,mf_in_type);
figure
plot(x,mf1)