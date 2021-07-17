function x=ielwt(c,d,h0,h1,fl,fr)

[m,n]=size(c);
nh=length(h0);
[mb,nb]=size(fl);

r=direct2lattice(h0);

x=ilf([zeros(1,n);c;zeros(1,n)],[d;zeros(2,n)],r);

xl=zeros(nb,n);
xr=zeros(nb,n);

if even(nb-mb)
  xl(1:2:nb,:)=c(1:nb/2,:);
  xl(2:2:nb,:)=d(1:nb/2,:);
  xr(1:2:nb,:)=c(end-nb/2+1:end,:);
  xr(2:2:nb,:)=d(end-nb/2+1:end,:);
else
  xl(2:2:nb)=c(1:(nb-1)/2,:);
  xl(1:2:nb)=d(1:(nb+1)/2,:);
  xr(1:2:nb)=c(end-(nb+1)/2+1:end,:);
  xr(2:2:nb)=d(end-(nb-1)/2+1:end,:);
end

x=[fl*xl;x(nh+4:end-nh-5,:);fr*xr];
