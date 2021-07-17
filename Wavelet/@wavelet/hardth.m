function w=hardth(w,th,taps)

if nargin<3
  taps=[1:w.level+1];
end

if length(th)>1
  for j=taps
    w.coef{j}(abs(w.coef{j})<th(j))=zeros(nnz(abs(w.coef{j})<th(j)),1);
  end
else
  for j=taps
    w.coef{j}(abs(w.coef{j})<th)=zeros(nnz(abs(w.coef{j})<th),1);
  end
end
