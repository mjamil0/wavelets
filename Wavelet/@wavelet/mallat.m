function w=mallat(w,J)

transformString='w=';

for j=1:J
  transformString=[transformString 'wt('];
end

transformString=[transformString 'w'];

for j=1:J
  transformString=[transformString ')'];
end

transformString=[transformString ';'];

eval(transformString);
