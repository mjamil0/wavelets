function h=hpa(h)

t=atan(sum(h(2,:))/sum(h(1,:)));

h=grot(t,2,1,2)*h;
