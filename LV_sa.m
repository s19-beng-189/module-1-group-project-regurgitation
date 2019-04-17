%filename:  LV_sa.m
clear all %clear all variables
clf       %and figures
global T TS tauS tauD;
global Csa Rs RMi RAo dt CHECK PLA;
in_LV_sa  %initialize

%% Find New Csa Value
% CsaValue = linspace(0.00001, 0.04);
% for n = 1:length(CsaValue)
%     Csa = CsaValue(n);
%     for klok=1:klokmax  
%         t=klok*dt;
%         PLV_old=PLV;
%         Psa_old=Psa;
%         CLV_old=CLV;
%         CLV=CV_now(t,CLVS,CLVD);
%   %find self-consistent 
%   %valve states and pressures:
%         set_SMi_SAo
%   %store in arrays for future plotting:
%         t_plot(klok)=t;
%         CLV_plot(klok)=CLV;
%         PLV_plot(klok)=PLV;
%         Psa_plot(klok)=Psa;
%         VLV_plot(klok)=CLV*PLV+VLVd;
%         Vsa_plot(klok)=Csa*Psa+Vsad;
%         QMi_plot(klok)=SMi*(PLA-PLV)/RMi;
%         QAo_plot(klok)=SAo*(PLV-Psa)/RAo;
%         Qs_plot(klok)=Psa/Rs;
%         SMi_plot(klok)=SMi;
%         SAo_plot(klok)=SAo;
%     end
%     ESP(n) = max(Psa_plot(1300:1500)); %ESP
%     EDP(n) = min(Psa_plot(1300:1500)); %EDP
%     err_ESP(n) = abs(120-ESP(n)); % error btw ESP and 120
%     err_EDP(n) = abs(80-EDP(n)); % error btw EDP and 80
% end
% min_err = min(err_ESP); %error is 0.3281
% v = err_ESP == min_err;
% Csa = sum(CsaValue*v'); %new Csa value 0.0012

%% plot results:
Csa = 0.0012;
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
        CLV_plot(klok)=CLV*1.75;
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
figure(1)
subplot(3,1,1), plot(t_plot,CLV_plot)
subplot(3,1,2), plot(t_plot,PLV_plot,t_plot,Psa_plot)
subplot(3,1,3), plot(t_plot,QMi_plot,t_plot,QAo_plot,t_plot,Qs_plot)
%left ventricular pressure-volume loop
figure(2)
plot(VLV_plot,PLV_plot)
%systemic arterial pressure-volume ``loop''
figure(3)
plot(Vsa_plot,Psa_plot)
