function [Hleft,Hright,Fleft,Fright,Pleft2,Pright2]=edgefilters(h0,h1,f0,f1);

nh=length(h0);
m=(nh-2)/2;
n=nh+2*m-2;
Hi=polyphasematrix(h0,h1,m);

P=eye(n)-Hi'*Hi;
Pleft=P(1:n/2,1:n/2);
Pright=P(n/2+1:n,n/2+1:n);

Pleft2=Pleft;
Pright2=Pright;

[q,r]=qr(Pleft);
rl=abs(diag(r))>1e-8;
Pleft=Pleft(:,rl);

[q,r]=qr(Pright);
rr=abs(diag(r))>1e-8;
Pright=Pright(:,rr);

Pleft(:,1)=Pleft(:,1)/norm(Pleft(:,1),2);
for i=2:sum(rl)
  Pleft(:,i)=gramSchmidt(Pleft(:,i),Pleft(:,1:i-1));
  Pleft(:,i)=Pleft(:,i)/norm(Pleft(:,i),2);
end

Pright(:,1)=Pright(:,1)/norm(Pright(:,1),2);
for i=2:sum(rr)
  Pright(:,i)=gramSchmidt(Pright(:,i),Pright(:,1:i-1));
  Pright(:,i)=Pright(:,i)/norm(Pright(:,i),2);
end

Hleft=rotatefilterleft(Pleft)';
Hright=rotatefilterright(Pright)';
[mb,nb]=size(Hleft);

HL=[[Hleft zeros(mb,n-nb)];Hi;[zeros(mb,n-nb) Hright]];

FL=inv(HL);

Fleft=FL(1:nb,1:mb+nb);
Fright=FL(end-nb+1:end,end-(mb+nb)+1:end);

Pleft=Pleft';
Pright=Pright';


function x=gramSchmidt(y,w)

if isempty(w)
  x=y;
else
  x=zeros(size(y));
  for i=1:size(w,2)
    x=x+dot(y,w(:,i))/dot(w(:,i),w(:,i))*w(:,i);
  end
  x=y-x;
end


function h=rotatefilterleft(h,h0,h1)

[mh,nh]=size(h);

j=nh;
k=nh-1;

for i=1:2:ceil(nh/2)*2
  t=hpa(h(:,k),h(:,j));
  h=h*grot(t,k,j,nh);
  j=j-2;
  k=k-2;
  if (k<1) & (j>0)
    k=2;
    j=1;
  end
end


function h=rotatefilterright(h,h0,h1)

[mh,nh]=size(h);

j=1;
k=2;

for i=1:2:ceil(nh/2)*2
  t=lpa(h(:,j),h(:,k));
  h=h*grot(t,j,k,nh);
  j=j+2;
  k=k+2;
  if (k>nh) & (j==nh)
    k=k-2;
  end
end


function g=grot(t,r,c,n)

g=eye(n);
g(r,r)=cos(t);
g(c,c)=g(r,r);
g(c,r)=sin(t);
g(r,c)=-g(c,r);


function t=hpa(l,h)

t=atan(sum(h)/sum(l));


function t=lpa(l,h)

a=ones(size(l));
a(2:2:end)=-a(2:2:end);
t=atan(-sum(a.*l)/sum(a.*h));

