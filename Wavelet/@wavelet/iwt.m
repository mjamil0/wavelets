function w=iwt(w)

if w.level==0
  return
end

if strcmp(w.transformType,'pyramid')
  
  if strcmp(w.waveletType,'biorthogonal symmetric')
    w.coef(w.level)={iswt(w.coef{w.level+1},w.coef{w.level},w.f0,w.f1)};
  elseif strcmp(w.waveletType,'orthogonal') | strcmp(w.waveletType,'orthogonal symmetric')
    if strcmp(w.boundaryCondition,'circular')
      w.coef(w.level)={ilwt(w.coef{w.level+1},w.coef{w.level},w.h0,w.h1)};
    elseif strcmp(w.boundaryCondition,'filters')
      w.coef(w.level)={ielwt(w.coef{w.level+1},w.coef{w.level},w.h0,w.h1,w.fl,w.fr)};
    end
  else
    error('Unknown wavelet type')
  end
  
  w.coef{w.level+1}={};
  n=size(w.coef{w.level},1);
  
  if (w.level-1)~=0
    if n>size(w.coef{w.level-1},1)
      w.coef(w.level)={w.coef{w.level}(1:n-1,:)};
    end
  else
    if n>size(w.data,1)
      w.coef(w.level)={w.coef{w.level}(1:n-1,:)};
    end
  end
  w.level=w.level-1;
  
elseif strcmp(w.transformType,'tree')
  
  k=1;
  for i=1:2:pow2(w.level)
    
    if strcmp(w.waveletType,'biorthogonal symmetric')
      v(k)={iswt(w.coef{i+1},w.coef{i},w.f0,w.f1)};
    elseif strcmp(w.waveletType,'orthogonal') | strcmp(w.waveletType,'orthogonal symmetric')
      if strcmp(w.boundaryCondition,'circular')
        v(k)={ilwt(w.coef{i+1},w.coef{i},w.h0,w.h1)};
      elseif strcmp(w.boundaryCondition,'filters')
        v(k)={ielwt(w.coef{i+1},w.coef{i},w.h0,w.h1,w.fl,w.fr)};
      end
    else
      error('Unknown wavelet type')
    end
    
    if size(v{k},1)==(w.levelRows(w.level)+1)
      v(k)={v{k}(1:w.levelRows(w.level),:)};
    elseif (size(v{k},1)+1)==(w.levelRows(w.level))
      error('There is an unexpected error in wavelet algorithms.')
    end
    
    k=k+1;
    
  end
  
  w.coef=v;
  w.level=w.level-1;
  
else
  
  error('Unknown wavelet transform type')
 
end
