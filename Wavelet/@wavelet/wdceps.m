function w=wdceps(w,rc,nfft)

if nargin<2
  rc=0;
end

if strcmp(w.transformType,'pyramid')
  taps=[1:w.level+1];
elseif strcmp(w.transformType,'tree')
  taps=pow2(w.level);
end

for j=taps
  if rc==0
    if nargin<3
      nfft=size(w.coef{j},1);
    end
    w.coef{j}=dceps(w.coef{j}'-1,nfft)';
  elseif rc==1
    if nargin<3
      nfft=size(w.coef{j},2);
    end
    w.coef{j}=dceps(w.coef{j}-1,nfft);
  end
end
