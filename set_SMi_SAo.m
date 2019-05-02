%filename: set_SMi_SAo.m
%script to find 
%self-consistent valve states and pressures:
done=0;  %not done yet!
while(~done)  %keep trying if not done (see below)
  SMi_noted=SMi;  %note the value of SMi
  SAo_noted=SAo;  %note the value of SAo
  % set pressures based on valve states:
  [PLV,Psa]=PLV_Psa_new(PLV_old,Psa_old,CLV_old,CLV,SMi,SAo);
  %and then set valve states based on pressures:
 
  %changes for regurgitation simulation
  if (rem(t,T)<0.002)&&(t<0.08)
      SMi=0.002-rem(t,T);
  else
      SMi=(PLA>PLV);
  end

  SAo=(PLV>Psa); %evaluates to 1 if PLV>Psa, 0 otherwise
  %we're done if both valve states are unchanged:
  done=(SMi==SMi_noted)&(SAo==SAo_noted);
end
