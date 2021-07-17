function T=wavepack2(X,depth)

nBranch=pow2(depth);
T=cell(nBranch,1);

T1=wavetree(X,depth-1,'tree');

for i=1:pow2(depth-1)
  T(2*i-1:2*i)=wavetree(T1{i},1,'tree','bin 3/5');
end
