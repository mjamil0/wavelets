function [w,nz]=neighcoefth(w,taps)

if nargin<2
  taps=[1:w.level];
end

n=length(w.data);
taps=sort(taps);
sigma=noiseLevel(w);
th=2*sigma^2*log(n);
nz=0;

for j=taps   
  ss=w.coef{j}.^2;
  ss=(ss([end 1:end-1])+ss+ss([2:end 1]))/3;
  w.coef{j}(ss<th)=0;
  nz=nz+sum(ss<th);
  %w.coef{j}(w.coef{j}>0)=w.coef{j}(w.coef{j}>0)-th;
  %w.coef{j}(w.coef{j}<0)=w.coef{j}(w.coef{j}<0)+th;
end


function sigma=noiseLevel(w)

sigma=(median(abs(diff(w.data)))-median(diff(w.data)))/(sqrt(2)*0.6745);
