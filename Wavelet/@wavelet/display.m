function display(w)

disp(w.filterType)
figure
subplot(321)
plot(221)
plot(w.h0)
subplot(322)
plot(w.h1)
subplot(323)
plot(w.f0)
subplot(324)
plot(w.f1)
subplot(615)
plot(w.data)
subplot(616)
temp=[];
for i=1:w.level+1
  temp=[temp;w.coef{i}];
end
plot(temp)
