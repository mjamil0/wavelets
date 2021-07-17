function y=isorthw(x)

y=abs(sum(x(1:length(x)-2).*x(3:length(x))))<1e-6;
