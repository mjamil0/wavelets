function [h0,h1,f0,f1]=getfilters(waveletType)

[h0,h1,f0,f1]=getfilters(wavelet(1,waveletType,[],''));
