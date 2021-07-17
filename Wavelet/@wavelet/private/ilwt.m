function x=ilwt(c,d,h0,h1)

n=size(c,1);
nh=length(h0);
r=direct2lattice(h0);

x=ilf([c(n-(nh-2)/2+1:n,:);c;c(1:nh/2,:)],[d(n-(nh-2)/2+1:n,:);d;d(1:nh/2,:)],r);

x=x(nh+1:2*n+nh,:);
