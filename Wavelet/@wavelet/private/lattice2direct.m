function [P,Q]=lattice2direct(r)

m=length(r);
L=r(1)*[0 1;1 0];

for k=2:m
  L=[1 r(k);-r(k) 1]*L;
  if k<m
    L=[0 0 L(1,:);L(2,:) 0 0];
  end
end

P=L(1,:);
Q=L(2,:);
