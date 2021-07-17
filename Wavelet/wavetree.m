function W=wavetree(X,depth,returnStruct,filterType)

if nargin<2
  depth=1;
  returnStruct='mat';
  filterType='bin 13/7';
elseif nargin<3
  returnStruct='mat';
  filterType='bin 13/7';
elseif nargin<4
  filterType='bin 13/7';
end

[m,n]=size(X);
nBranch=pow2(depth);
nCoef=ceil(n/nBranch);
W=zeros(m,nBranch*nCoef);

wTree{1}=X;
count=0;

for j=1:depth
  for k=1:pow2(j-1)
    count=count+1;
    wc=getcoef(wt(wavelet(wTree{count}',filterType)))';
    wTree{2*count}=wc(:,1:end/2);
    wTree{2*count+1}=wc(:,end/2+1:end);
    wTree{count}=[];
  end
end

if strcmp(returnStruct,'mat')  
  j=0;
  for k=count+1:count+nBranch
    W(:,j+1:j+size(wTree{k},2))=wTree{k};
    j=j+size(wTree{k},2);
  end
elseif strcmp(returnStruct,'tree')
  W=wTree(count+1:count+nBranch);
end
