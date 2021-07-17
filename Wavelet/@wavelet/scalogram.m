function s=scalogram(w,n)

if strcmp(w.transformType,'pyramid')
  
  taps=n;
  w=wtj(w,n-1);
  
  if min(size(w.data))>1
    for i=1:taps
      s{i}=getcoef(iwtj(w,n-1,[[1:i-1] [i+1:taps]]));
    end
  else
    s=zeros(taps,length(w.data));
    for i=1:taps
      s(i,:)=getcoef(iwtj(w,n-1,[[1:i-1] [i+1:taps]]))';
    end
  end
  
elseif strcmp(w.transformType,'tree')
  
  taps=pow2(n);
  w=wtj(w,n);
  
  if min(size(w.data))>1
    for i=1:taps
      s{i}=getcoef(iwtj(w,n,[[1:i-1] [i+1:taps]]));
    end
  else
    s=zeros(taps,length(w.data));
    for i=1:taps
      s(i,:)=getcoef(iwtj(w,n,[[1:i-1] [i+1:taps]]))';
    end
  end
  
end
