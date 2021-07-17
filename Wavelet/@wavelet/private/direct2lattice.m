function r=direct2lattice(Q)

if ~isorthw(Q);
  error('This algorithm is valid for orthogonal filters only.')
end

P=altflip(Q);
m=length(Q);
nl=m/2+1;
r=zeros(1,nl);

for k=nl:-1:2
  r(k)=Q(1)/P(1);
  Q=(Q-r(k)*P)/(1+r(k)^2);
  Q=Q(3:m);
  m=m-2;
  if m>0
    P=altflip(Q);
  end
end

if rem(nl,2)>0
  r(1)=-1/prod(sqrt(r(2:nl).^2+1));
else
  r(1)=1/prod(sqrt(r(2:nl).^2+1));
end
