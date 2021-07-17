function w=softh(w,th,taps)

if nargin<3
  taps=[1:w.level+1];
end

if length(th)==1
  th=th*ones(1,length(taps));
end

if length(taps)~=length(th)
  error('Length of threshold vector must be equal to number of taps')
end
  
if length(th)>1
  for j=taps
    w.coef{j}(abs(w.coef{j})<th(j))=zeros(nnz(abs(w.coef{j})<th(j)),1);
    w.coef{j}(w.coef{j}>0)=w.coef{j}(w.coef{j}>0)-th(j);
    w.coef{j}(w.coef{j}<0)=w.coef{j}(w.coef{j}<0)+th(j);
  end
else
  for j=taps
    w.coef{j}(abs(w.coef{j})<th)=zeros(nnz(abs(w.coef{j})<th),1);
    w.coef{j}(w.coef{j}>0)=w.coef{j}(w.coef{j}>0)-th;
    w.coef{j}(w.coef{j}<0)=w.coef{j}(w.coef{j}<0)+th;
  end
end

k=find(taps==w.level+1);

if ~isempty(k)
  w.coef{w.level+1}=w.coef{w.level+1}+th(k);
end
