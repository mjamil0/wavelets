function H=altflip(L)

n=length(L);

if n>1
  H=L(n:-1:1);
else
  error('Invalid filter')
end