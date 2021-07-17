ha(2,:)=pl(1,:);

for i=4:8
  ha=hpa([Ht(1:6,i)';ha(2,:)]);
  plot(abs(freqz(ha(2,:))),'r')
  pause
  ha(2,:)=gs(ha(2,:),Ht(1:6,i)');
  plot(abs(freqz(ha(2,:))),'r')
  pause
end