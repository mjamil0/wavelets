function s=scalogram(w,n)

if strcmp(w.transformType,'pyramid')
  
  taps=n;
  s=zeros(taps,length(w.data));
  w=wtj(w,n-1);
  
  for i=1:taps
    s(i,:)=getcoef(iwtj(w,n-1,[[1:i-1] [i+1:taps]]))';
  end
  
elseif strcmp(w.transformType,'tree')
  
  taps=pow2(n);
  s=zeros(taps,length(w.data));
  w=wtj(w,n);
  
  for i=1:taps
    s(i,:)=getcoef(iwtj(w,n,[[1:i-1] [i+1:taps]]))';
  end

end
