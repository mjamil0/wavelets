function w=sureth(w,taps)

if nargin<2
  taps=[1:w.level+1];
end

taps=sort(taps);
sigma=varianceEstimate(w);
th=zeros(w.level+1,1);

for j=taps
  nc=length(w.coef{j});
  w.coef{j}=w.coef{j}/sigma;
  s2=(sum(w.coef{j}.^2)-nc)/nc;
  if s2<=(log2(nc)^1.5)/sqrt(nc)
    th(j)=sqrt(2*log(nc));
  else
    th(j)=sureThresoldValue(w.coef{j},nc);
  end
end

for j=taps   
  w.coef{j}(abs(w.coef{j})<th(j))=0;
  w.coef{j}(w.coef{j}>0)=(w.coef{j}(w.coef{j}>0)-th(j))*sigma;
  w.coef{j}(w.coef{j}<0)=(w.coef{j}(w.coef{j}<0)+th(j))*sigma;
end


function th=sureThresoldValue(x,nx)

a=sort(abs(x)).^2 ;
b=cumsum(a);
s=b+[nx-1:-1:0]'.*a;
risk=(nx-2*[1:nx]'+s)/nx;
[minRisk,ibest]=min(risk);
th=abs(x(ibest));


function sigma=varianceEstimate(w)

sigma=median(abs(w.coef{1})-median(w.coef{1}))/0.6745;
