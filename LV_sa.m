%filename:  LV_sa.m
clear all %clear all variables
clf       %and figures
global T TS tauS tauD;
global Csa Rs RMi RAo dt CHECK PLA;
in_LV_sa  %initialize
for klok=1:klokmax
  t=klok*dt;
  PLV_old=PLV;
  Psa_old=Psa;
  CLV_old=CLV;
  CLV=CV_now(t,CLVS,CLVD);
  %find self-consistent 
  %valve states and pressures:
  set_SMi_SAo
  %store in arrays for future plotting:
  t_plot(klok)=t;
  CLV_plot(klok)=CLV;
  PLV_plot(klok)=PLV;
  Psa_plot(klok)=Psa;
  VLV_plot(klok)=CLV*PLV+VLVd;
  Vsa_plot(klok)=Csa*Psa+Vsad;
  QMi_plot(klok)=SMi*(PLA-PLV)/RMi;
  QAo_plot(klok)=SAo*(PLV-Psa)/RAo;
  Qs_plot(klok)=Psa/Rs;
  SMi_plot(klok)=SMi;
  SAo_plot(klok)=SAo;
end
%plot results:
figure(1)
plot(t_plot,PLV_plot); xlabel('Time (min)','FontSize',18); ylabel('PLV (mmHg)','FontSize',18); title('Left Ventricular Pressure','FontSize',18);

figure(2)
plot(t_plot,QAo_plot); xlabel('Time (min)','FontSize',18); ylabel('QAo (L/min)','FontSize',18); title('Flow Through Aorta','FontSize',18);

%left ventricular pressure-volume loop
figure(3)
plot(VLV_plot,PLV_plot); xlabel('Volume (L)','FontSize',18); ylabel('Pressure (mmHg)','FontSize',18); title('Left Ventricle PV Loop','FontSize',18);

figure(4)
plot(t_plot,Psa_plot); xlabel('Time (min)','FontSize',18); ylabel('Psa (mmHg)','FontSize',18); title('Systemic Pulse Pressure','FontSize',18);

figure(5)
plot(t_plot,QMi_plot); xlabel('Time (min)','FontSize',18); ylabel('QMi (L/min)','FontSize',18); title('Flow Through Mitral Valve','FontSize',18);





