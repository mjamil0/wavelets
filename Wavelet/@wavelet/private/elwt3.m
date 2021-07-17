function [c,d]=elwt(x,h0,h1,hLeft,hRight)

[m,n]=size(x);
nh=length(h0);
[mb,nb]=size(hLeft);

r=direct2lattice(h0);
[c,d]=lf([zeros(1,n);x;zeros(1,n)],r);

cLeft=hLeft*x(1:nb,:);
dRight=hRight*x(end-nb+1:end,:);

c=[cLeft;c(nh/2+1:end-nh/2,:)];
d=[d(nh/2+1:end-nh/2,:);dRight];
