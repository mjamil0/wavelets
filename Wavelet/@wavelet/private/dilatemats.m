function [m0,m1]=dilatem1(h)

c=h(:)';
c=c/sum(c)*2;
n=length(c);
M=zeros(n,3*n-2);

k=1;
for i=0:n-1
  M(i+1,1+2*i:n+2*i)=c(end:-1:1);
end

m0=M(:,n:end-(n-1));
m1=M(:,n-1:end-n);
