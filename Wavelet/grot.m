function g=grot(t,r,c,n)

g=eye(n);
g(r,r)=cos(t);
g(c,c)=g(r,r);
g(c,r)=sin(t);
g(r,c)=-g(c,r);
