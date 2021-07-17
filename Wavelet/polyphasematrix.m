function H=polyphasematrix(h0,h1,n)

nh0=length(h0);
nh1=length(h1);

nh=max(nh0,nh1);

Hp=[[h0(end:-1:1) zeros(1,nh-nh0)];[h1(end:-1:1) zeros(1,nh-nh1)]];

H=zeros(2*n,nh+2*(n-1));

for i=1:2:2*n
  H(i:i+1,i:i+nh-1)=Hp;
end
