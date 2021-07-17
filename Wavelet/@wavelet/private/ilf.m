function x=ilf(g,h,r)

mr=length(r);
mf=2*(mr-1);

[m,n]=size(g);

mf2=mr-1;
x=zeros(2*m+mf,n);
mm=m+mf2;

h0=zeros(mm,n);
g0=h0;
h1=h0;
g1=h0;

h0(mf2+1:mm,:)=h+r(mf2+1)*g;
g0(1:m,:)=g-r(mf2+1)*h;

k1=mf2;
k2=m+1;

for k=1:mf2-1,

  if rem(k,2)>0
    h1(k1:mm,:)=h0(k1:mm,:)+r(k1)*g0(1:k2,:);
    g1(1:k2,:)=g0(1:k2,:)-r(k1)*h0(k1:mm,:);
   else
    h0(k1:mm,:)=h1(k1:mm,:)+r(k1)*g1(1:k2,:);
    g0(1:k2,:)=g1(1:k2,:)-r(k1)*h1(k1:mm,:);
  end

  k1=k1-1;
  k2=k2+1;

end

if rem(k,2)>0
  x(1:2:2*m+mf,:)=r(1)*h1(1:mm,:);
  x(2:2:2*m+mf,:)=r(1)*g1(1:mm,:);
else
  x(1:2:2*m+mf,:)=r(1)*h0(1:mm,:);
  x(2:2:2*m+mf,:)=r(1)*g0(1:mm,:);
end
