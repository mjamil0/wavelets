function h=lpa(h)

a=ones(size(h(1,:)));
a(2:2:end)=-a(2:2:end);
t=atan(-sum(a.*h(1,:))/sum(a.*h(2,:)));

h=grot(t,2,1,2)*h;