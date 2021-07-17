function [c,d]=lwt(x,h0,h1)

nx=size(x,1);
nh=length(h0);
r=direct2lattice(h0);

[c,d]=lf([x(nx-nh+1:nx,:);x;x(1:nh,:)],r);

c=c(nh:nx/2+nh-1,:);
d=d(nh:nx/2+nh-1,:);
