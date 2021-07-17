function w=iwtj(w,J,taps)

if nargin>2
  w=hardth(w,inf,taps);
end

transformString='w';

for j=1:J
  transformString=['iwt(' transformString ')'];
end

transformString=['w=' transformString ';'];

eval(transformString);
