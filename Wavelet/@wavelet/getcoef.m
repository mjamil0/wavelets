function x=getcoef(w,taps,form)

if nargin<2
  taps=[];
end

if nargin<3
  form=[];
end

if isempty(taps)
  if strcmp(w.transformType,'pyramid')
    taps=[1:w.level+1];
  elseif strcmp(w.transformType,'tree')
    taps=[1:pow2(w.level)];
  end
end

if isempty(form)
  form='matrix';
end

if strcmp(form,'matrix')
  
  for i=taps
    w.coef{i}=w.coef{i}';
  end

  x=[w.coef{taps}]';
  
elseif strcmp(form,'cell')
  
  x=w.coef(taps);
  
end
