function x=ielwt(c,d,h0,h1,fl,fr)

[m,n]=size(c);
nh=length(h0);
[mb,nb]=size(fl);

r=direct2lattice(h0);

x=ilf([zeros(1,n);c;zeros(1,n)],[d;zeros(2,n)],r);

xl=zeros(nb,n);
xr=zeros(nb,n);
xl(1:nb-mb,:)=c(1:nb-mb,:);
xl(nb-mb+1:2:nb)=c(nb-mb+1:2*(nb-mb));
xl(nb-mb+2:2:nb)=d(1:nb-mb);

xr(end-(nb-mb)+1:end,:)=d(end-(nb-mb)+1:end,:);
xr(2:2:end-(nb-mb),:)=d(end-2*(nb-mb)+1:end-(nb-mb));
xr(1:2:end-(nb-mb),:)=c(end-(nb-mb)+1:end);

x=[fl*xl;x(nh+4:end-nh-5,:);fr*xr];
1;