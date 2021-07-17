function [c,d]=swt(x,h0,h1)

p0=length(h0);
p1=length(h1);
p=max([p0 p1]);
[n,m]=size(x);

if rem(p,2)>0
  xe=[x((p-1)/2+1:-1:2,:);x;x(n-1:-1:n-(p-1)/2,:)];
end

xl2=symfir(xe,h0);
xh2=symfir(xe,h1);

if p0>p1
  c=xl2(p0:2:p0+n-1,:);
  d=xh2((p0+p1)/2+1:2:(p0+p1)/2+n,:);
else
  c=xl2((p0+p1)/2+1:2:(p0+p1)/2+n,:);
  d=xh2(p1:2:p1+n-1,:);
end

