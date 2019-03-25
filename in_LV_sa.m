%filename: in_LV_sa.m  (initialization for LV_sa)
T =0.0125    %Duration of heartbeat (minutes)
TS=0.0050    %Duration of systole   (minutes)
tauS=0.0025  %CLV time constant during systole (minutes)
tauD=0.0075  %CLV time constant during diastole (minutes)
Rs=17.86     %Systemic resistance (mmHg/(liter/minute))
%Valve resistances here are not supposed to be realistic,
%just small enough to be negligible:
RMi=0.01     %mitral valve resistance (mmHg/(liter/minute))
RAo=0.01     %aortic valve resistance (mmHg/(liter/minute))
%The following value of Csa is approximate;
%needs adjustment to make blood pressure 120/80:
Csa=0.00175  %Systemic arterial compliance (liters/mmHg)
CLVS=0.00003 %Min (systolic)  value of CLV (liters/mmHg)
CLVD=0.0146  %Max (diastolic) value of CLV (liters/mmHg)
Vsad=0.825   %Systemic arterial volume when Psa=0 (liters)
VLVd=0.027   %Left ventricular volume when PLV=0 (liters)
PLA=5        %Left atrial pressure (mmHg)
dt=0.01*T    %Time step duration (minutes)
%This choice implies 100 timesteps per cardiac cycle.
klokmax=15*T/dt %Total number of timesteps 
%This choice implies simulation of 15 cardiac cycles.
PLV=5                    %Initial value of PLV (mmHg)
Psa=80                   %Initial value of Psa (mmHg)
%set initial valve states:
SMi=(PLA>PLV); %evaluates to 1 if PLA>PLV, 0 otherwise
SAo=(PLV>Psa); %evaluates to 1 if PLV>Psa, 0 otherwise
CLV=CV_now(0,CLVS,CLVD)  %Initial value of CLV (liters/mmHg)
%Initialize arrays used to store data for plotting:
%Although the program will work without doing this, 
%it will run MUCH faster if MATLAB knows in advance 
%how much space is needed for these arrays.
  t_plot=zeros(1,klokmax);
CLV_plot=zeros(1,klokmax);
PLV_plot=zeros(1,klokmax);
Psa_plot=zeros(1,klokmax);
VLV_plot=zeros(1,klokmax);
Vsa_plot=zeros(1,klokmax);
QMi_plot=zeros(1,klokmax);
QAo_plot=zeros(1,klokmax);
 Qs_plot=zeros(1,klokmax);
SMi_plot=zeros(1,klokmax);
SAo_plot=zeros(1,klokmax);
%For self-checking in the function PLV_Psa_new, set CHECK=1                    
%To skip the self-checking, set CHECK=0
CHECK=1
