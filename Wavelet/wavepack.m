function W=wavepack(X)

W=zeros(size(X,1),92);
X=sumrow0(smooth(X));

w=wavelet(X','bin 13/7');
W=getcoef(wt(wt(wt(w))))';
w=wavelet(W(:,1:46)','bin 13/7');
W(:,1:46)=getcoef(wt(w))';
