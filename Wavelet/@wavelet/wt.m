function w=wt(w)

if strcmp(w.transformType,'pyramid')
    
  x=w.coef{w.level+1};
  n=size(x,1);
  if ~even(n)
    x=[x;2*x(n,:)-x(n-1,:)];
  end
  1;
  if strcmp(w.waveletType,'biorthogonal symmetric')
    [c,d]=swt(x,w.h0,w.h1);
  elseif strcmp(w.waveletType,'orthogonal') | strcmp(w.waveletType,'orthogonal symmetric')
    if strcmp(w.boundaryCondition,'filters')
      [c,d]=elwt(x,w.h0,w.h1,w.hl,w.hr);
    elseif strcmp(w.boundaryCondition,'circular')
      [c,d]=lwt(x,w.h0,w.h1);
    end
  else
    error('Unknown wavelet type')
  end
   
  w.coef(w.level+1)={d};
  w.coef(w.level+2)={c};
  w.level=w.level+1;
  w.levelRows(w.level+1)=size(c,1);
  
elseif strcmp(w.transformType,'tree')
  
  nNode=pow2(w.level);
  k=1;  
  for i=1:nNode
    
    x=w.coef{i};
    n=size(x,1);
    if ~even(n)
      x=[x;2*x(n,:)-x(n-1,:)];
    end

    if strcmp(w.waveletType,'biorthogonal symmetric')
      [c,d]=swt(x,w.h0,w.h1);
    elseif strcmp(w.waveletType,'orthogonal') | strcmp(w.waveletType,'orthogonal symmetric')
      if strcmp(w.boundaryCondition,'filters')
        [c,d]=elwt(x,w.h0,w.h1,w.hl,w.hr);
      elseif strcmp(w.boundaryCondition,'circular')
        [c,d]=lwt(x,w.h0,w.h1);
      end
    else
      error('Unknown wavelet type')
    end
    v(k)={d};
    v(k+1)={c};
    k=k+2;
  end
  w.coef=v;
  w.level=w.level+1;
  w.levelRows(w.level+1)=size(c,1);
  
else
  
  error('Unknown wavelet transform type')
  
end
