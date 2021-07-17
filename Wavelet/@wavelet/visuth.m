function w=sureth(w,taps)

if nargin<2
  taps=[1:w.level];
end

n=length(w.data);
taps=sort(taps);
sigma=noiseLevel(w);
th=sigma*sqrt(2*log(n));

for j=taps   
  w.coef{j}(abs(w.coef{j})<th)=0;
  w.coef{j}(w.coef{j}>0)=w.coef{j}(w.coef{j}>0)-th;
  w.coef{j}(w.coef{j}<0)=w.coef{j}(w.coef{j}<0)+th;
end


function sigma=noiseLevel(w)

sigma=(median(abs(diff(w.data)))-median(diff(w.data)))/(sqrt(2)*0.6745);
