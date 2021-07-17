function w=imallat(w,J,thLevels)

if nargin>2
  w=hardth(w,inf,thLevels);
end

transformString='w';

for j=1:J
  transformString=['iwt(' transformString ')'];
end

transformString=['w=' transformString ';'];

eval(transformString);
