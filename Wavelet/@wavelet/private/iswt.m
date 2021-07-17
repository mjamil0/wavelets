function xo=iwt(c,d,f0,f1)

p0=length(f0);
p1=length(f1);
p=max([p0 p1]);
[n,m]=size(c);

if rem(p,2)>0
  ph=(p-1)/2;
else
  ph=p/2;
end

ci=zeros(2*n,m);
ci(1:2:2*n,:)=c;

di=zeros(2*n,m);
di(1:2:2*n,:)=d;

if p1>p0
  ci=[ci(p1:-1:2,:);ci;ci(2*n-1:-1:2*n-p1+1,:)];
  di=[di((p0+p1)/2-1:-1:1,:);zeros(1,m);di;di(2*n-3:-1:2*n-(p0+p1)/2,:)];
else
  ci=[ci((p0+p1)/2-1:-1:1,:);zeros(1,m);ci;ci(2*n-3:-1:2*n-(p0+p1)/2,:)];
  di=[di(p0:-1:2,:);di;di(2*n-1:-1:2*n-p0+1,:)];
end

co=symfir(ci,f0);
do=symfir(di,f1);

pe=3*(p0+p1)/4+floor(abs(p0-p1)/4);

xo=co(pe:pe+2*n-1,:)+do(pe:pe+2*n-1,:);
