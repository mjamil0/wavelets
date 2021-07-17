function [c,d]=elwt(x,h0,h1,hLeft,hRight)

[m,n]=size(x);
nh=length(h0);
[mb,nb]=size(hLeft);

h0l=mb-1:-2:1;
h0l=h0l(end:-1:1);
h1l=mb:-2:1;
h1l=h1l(end:-1:1);
h0r=1:2:mb;
h1r=2:2:mb;
r=direct2lattice(h0);

[c,d]=lf([zeros(1,n);x;zeros(1,n)],r);

cLeft=hLeft(h0l,:)*x(1:nb,:);
dLeft=hLeft(h1l,:)*x(1:nb,:);
cRight=hRight(h0r,:)*x(end-nb+1:end,:);
dRight=hRight(h1r,:)*x(end-nb+1:end,:);

c=[cLeft;c(nh/2+1:end-nh/2,:);cRight];
d=[dLeft;d(nh/2+1:end-nh/2,:);dRight];
