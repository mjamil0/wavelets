function [p0,p1]=scaling(w)

if strcmp(w.waveletType,'biorthogonal symmetric')
  [m0,m1]=dilatem1(w.h0);
  [v,e]=eig(m0);
  [x,n]=min(abs(diag(e)-sqrt(2)));
  p0=v(:,n);
  
  [m0,m1]=dilatem1(w.f0);
  [v,e]=eig(m0);
  [x,n]=min(abs(diag(e)-sqrt(2)));
  p1=v(:,n);
  [x,k]=max(abs(p0));
  p0=sign(max(p0(k)))*p0;
  p0=sign(max(p0))*p0;
  [x,k]=max(abs(p1));
  p1=sign(max(p1(k)))*p1;
  p1=sign(max(p1))*p1;
else
  [m0,m1]=dilatem1(w.h0);
  [v,e]=eig(m0);
  [x,n]=min(abs(diag(e)-1));
  p0=v(:,n);
  [x,k]=max(abs(p0));
  p0=sign(max(p0(k)))*p0;
  p1=[];
end
