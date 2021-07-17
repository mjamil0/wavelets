function hb2=bfr(h0,h1,hb)

R=[abs(fft(h0,32));abs(fft(h1,32))];
%R=R(:,1:end/2);

F=[abs(fft(hb(1,:),32));abs(fft(hb(2,:),32))];
%F=F(:,1:end/2);

%R=[dct(h0,8);dct(h1,8)];
%F=[dct(hb(1,:),8);dct(hb(2,:),8)];

A=R*pinv(F);

[u,s,v]=svd(A);

Q=u*v';

hb2=Q*hb;

1;