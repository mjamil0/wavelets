function [T,y]=wp2test(X,b)

treeDepth=4;
nBranch=pow2(treeDepth);

T=wavepack2(X,treeDepth);

for i=1:nBranch
  T{i}=msc(T{i});
end

y=[T{1:end}]*solvepls([T{1:end}],b,20);
