function w=medfilt(w,n,taps)

if nargin<3
  if strcmp(w.transformType,'pyramid')
    taps=[1:w.level+1];
  elseif strcmp(w.transformType,'tree')
    taps=[1:pow2(w.level)];
  end
end

if length(n)==1
  n=n*ones(1,length(taps));
end

if length(n)~=length(taps)
  error('orders length must be 1 or equal to taps')
end

for j=taps
  if ((j~=w.level+1) & strcmp(w.transformType,'pyramid')) | ((j~=pow2(w.level)) & strcmp(w.transformType,'tree'))
    w.coef{j}=mean0(medfilt1(w.coef{j},n(j)));
  else
    w.coef{j}=medfilt1(w.coef{j},n(j));
  end
end


function x=mean0(x)

if size(x,2)==1
  x=x-mean(x);
else
  x=add2rows(x,-mean(x));
end
