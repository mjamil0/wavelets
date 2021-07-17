function [g0,h0]=latticefilter(x,r)

[m,n]=size(x);
mf2=length(r)-1;
m2=m/2;
mm=m2+mf2;

h0=zeros(mm,n);
g0=h0;
h1=h0;
g1=h0;

h0(1:m2,:)=x(1:2:m,:)*r(1);
g0(mf2+1:mm,:)=x(2:2:m,:)*r(1);

k1=1;
k2=mf2;

for k=1:mf2-1

  if rem(k,2)>0
    h1(1:m2+k1,:)=h0(1:m2+k1,:)-r(k1+1)*g0(k2:mm,:);
    g1(k2:mm,:)=g0(k2:mm,:)+r(k1+1)*h0(1:m2+k1,:);
  else
    h0(1:m2+k1,:)=h1(1:m2+k1,:)-r(k1+1)*g1(k2:mm,:);
    g0(k2:mm,:)=g1(k2:mm,:)+r(k1+1)*h1(1:m2+k1,:);
  end

  k1=k1+1;
  k2=k2-1;

end

if rem(mf2,2)>0

  h1=h0-r(k1+1)*g0;
  g1=g0+r(k1+1)*h0;
  h0=h1;
  g0=g1;

else

  h0=h1-r(k1+1)*g1;
  g0=g1+r(k1+1)*h1;

end
