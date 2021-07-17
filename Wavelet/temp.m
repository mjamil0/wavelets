ha=hpa([Ht(1:6,5)';pl(1,:)]);

for i=1:16
  ha(2,:)=gs(ha(2,:),Ht(1:6,5)');
  plot(abs(freqz(ha(2,:))),'r')
  pause
  ha=hpa([Ht(1:6,5)';ha(2,:)]);
  plot(abs(freqz(ha(2,:))),'r')
  pause
end