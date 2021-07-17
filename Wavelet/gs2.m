function x=gs2(y,w)

if isempty(w)
  x=y;
else
  x=zeros(size(y));
  for i=1:size(w,2)
    x=x+dot(y,w(i,:))/dot(w(i,:),w(i,:))*w(i,:);
  end
  x=y-x;
end